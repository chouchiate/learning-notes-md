## [go] - statistical query


### repository

```go
package repository

import (
	"database/sql"
	"fmt"
	"time"

	"github.com/google/uuid"
	"golang.org/x/sync/errgroup"
	"gorm.io/gorm"
)

const (
	_6AM string = "6"
	_6PM string = "18"
)

type StatsData struct {
	PatientID   uuid.UUID
	PatientName string
	DeviceID    uuid.UUID
	SpaceID     uuid.UUID
}

type StatsSum struct {
	StatsData
	Value float32
}

type StatsCount struct {
	StatsData
	Value int
}

type sumData struct {
	DeviceID *uuid.UUID
	Sum      float32
}
type countData struct {
	DeviceID *uuid.UUID
	Count    int
}

type SpacePatientDeviceRegistry struct {
	SpaceWithPatientDevice // embedding
	FirstName              string
	LastName               string
	PatientUpdatedAt       time.Time
	DeviceUpdatedAt        time.Time
	IsLivingIn             bool
	IsInstalledIn          bool
}

type StatsResult struct {
	AwayFromBedCounts       []StatsCount
	SleepDurationSummations []StatsSum
	LongLyingCounts         []StatsCount
	AbnormalBreathCounts    []StatsCount
}

type statisticsRepo struct {
	db *gorm.DB
}

type StatsRepo interface {
	GetOrgStats(orgID uuid.UUID, startAt, endAt time.Time) (*StatsResult, error)
}

func NewStatisticRepo(db *gorm.DB) StatsRepo {
	return &statisticsRepo{db}
}

func (s *statisticsRepo) GetOrgStats(orgID uuid.UUID, startAt, endAt time.Time) (*StatsResult, error) {

	lists, err := s.listSpacesWithHistoricPatientDevice(orgID, startAt, endAt)
	if err != nil {
		return nil, err
	}
	var deviceIDs []uuid.UUID
	var emptyCountResult []*countData
	for _, item := range lists {
		if item.IsInstalledIn && item.IsLivingIn {
			deviceIDs = append(deviceIDs, item.DeviceID)
		}
		// TODOs: inactive/historic devices and checkout patients (!isInstalledIn || !isLivingIn) are manually updated at this moment;
		// will need to count them when they become automatic in the future
		emptyCountResult = append(emptyCountResult, &countData{
			DeviceID: &item.DeviceID,
			Count:    0,
		})
	}

	var g errgroup.Group
	var awayFromBedCounts, longLyingCounts, abnormalBreathCounts []*countData
	var sleepDurations []*sumData
	g.Go(func() error {
		awayFromBedCounts, err = s.countAwayFromBed(deviceIDs, startAt, endAt)
		if err != nil {
			if err == ErrNoData {
				awayFromBedCounts = emptyCountResult
				return nil
			}
			return err
		}
		return nil
	})
	g.Go(func() error {
		for _, deviceID := range deviceIDs {
			sleepDuration, err := s.calcSleepDurationSum(deviceID, startAt, endAt)
			if err == ErrNoData {
				sleepDurations = append(sleepDurations, &sumData{
					DeviceID: &deviceID,
					Sum:      0,
				})
				continue
			}
			if err != nil {
				return err
			}
			sleepDurations = append(sleepDurations, sleepDuration)
		}
		return nil
	})
	g.Go(func() error {
		longLyingCounts, err = s.countLongLying(deviceIDs, startAt, endAt)
		if err != nil {
			if err == ErrNoData {
				longLyingCounts = emptyCountResult
				return nil
			}
		}
		return err
	})
	g.Go(func() error {
		abnormalBreathCounts, err = s.countAbnormalBreath(deviceIDs, startAt, endAt)
		if err != nil {
			if err == ErrNoData {
				abnormalBreathCounts = emptyCountResult
				return nil
			}
		}
		return err
	})

	if err := g.Wait(); err != nil {
		return nil, err
	}

	var awayFromBedStats, abnormalBreathStats, longLyingStats []StatsCount
	var sleepDurationStats []StatsSum
	if len(sleepDurations) != 0 {
		for _, a := range sleepDurations {
			for _, b := range lists {
				if b.DeviceID == *a.DeviceID {
					sleepDurationStats = append(sleepDurationStats, StatsSum{
						StatsData: StatsData{
							PatientID:   b.PatientID,
							PatientName: b.FirstName + b.LastName,
							DeviceID:    b.DeviceID,
							SpaceID:     b.SpaceID,
						},
						Value: a.Sum,
					})
				}
			}
		}
	}

	if len(awayFromBedCounts) != 0 {
		for _, a := range awayFromBedCounts {
			for _, b := range lists {
				if b.DeviceID == *a.DeviceID {
					awayFromBedStats = append(awayFromBedStats, StatsCount{
						StatsData: StatsData{
							PatientID:   b.PatientID,
							PatientName: b.FirstName + b.LastName,
							DeviceID:    b.DeviceID,
							SpaceID:     b.SpaceID,
						},
						Value: a.Count,
					})
				}
			}
		}
	}

	if len(abnormalBreathStats) != 0 {
		for _, a := range abnormalBreathCounts {
			for _, b := range lists {
				if b.DeviceID == *a.DeviceID {
					abnormalBreathStats = append(abnormalBreathStats, StatsCount{
						StatsData: StatsData{
							PatientID:   b.PatientID,
							PatientName: b.FirstName + b.LastName,
							DeviceID:    b.DeviceID,
							SpaceID:     b.SpaceID,
						},
						Value: a.Count,
					})
				}
			}
		}
	}

	if len(longLyingCounts) != 0 {
		for _, a := range longLyingCounts {
			for _, b := range lists {
				longLyingStats = append(longLyingStats, StatsCount{
					StatsData: StatsData{
						PatientID:   b.PatientID,
						PatientName: b.FirstName + b.LastName,
						DeviceID:    b.DeviceID,
						SpaceID:     b.SpaceID,
					},
					Value: a.Count,
				})
			}
		}
	}

	result := &StatsResult{
		SleepDurationSummations: sleepDurationStats,
		AwayFromBedCounts:       awayFromBedStats,
		LongLyingCounts:         longLyingStats,
		AbnormalBreathCounts:    abnormalBreathStats,
	}

	return result, nil
}

const countAwayFromBedSqlScript = `
	SELECT device_id , COUNT(patient_state)
	FROM events
	WHERE device_id IN @DEVICE_IDS
	AND occurred_at BETWEEN '%[1]s' AND '%[2]s'
	AND (EXTRACT(HOUR from events.occurred_at) >= %[3]s OR EXTRACT(HOUR FROM events.occurred_at) < %[4]s)
	AND events.patient_state = 1
	GROUP BY device_id;
`

func (s *statisticsRepo) countAwayFromBed(deviceIDs []uuid.UUID, startAt, endAt time.Time) ([]*countData, error) {
	var counts []*countData
	res := s.db.Raw(fmt.Sprintf(countAwayFromBedSqlScript,
		startAt.Format(time.RFC3339),
		endAt.Format(time.RFC3339),
		_6PM,
		_6AM),
		sql.Named("DEVICE_IDS", deviceIDs)).Scan(&counts)
	if res.RowsAffected == 0 {
		return nil, ErrNoData
	}

	if res.Error != nil {
		return nil, res.Error
	}

	return counts, nil
}

const countSleepLessThanSqlScript = `
	WITH RECURSIVE
	selected_sleep_on_bed AS
	(
		SELECT *
		FROM events
		WHERE
		occurred_at BETWEEN '%[1]s' AND '%[2]s'
		AND (EXTRACT(HOUR from events.occurred_at) >= %[3]s OR EXTRACT(HOUR FROM events.occurred_at) < %[4]s)
		AND (events.patient_state = 0)
		AND device_id = '%[5]s'
		ORDER BY device_id, occurred_at DESC
	),
	selected_leave_bed AS
	(
		SELECT *
		FROM events
		WHERE
		occurred_at BETWEEN '%[1]s' AND '%[2]s'
		AND (EXTRACT(HOUR from events.occurred_at) >= %[3]s OR EXTRACT(HOUR FROM events.occurred_at) < %[4]s)
		AND (events.patient_state = 1)
		AND device_id = '%[5]s'
		ORDER BY device_id, occurred_at DESC
	),
	final_results AS (
		(
			SELECT
				lb.id AS leave_id,
				sob.id AS sleep_id,
				lb.device_id,
				lb.patient_state AS leave_ps,
				sob.patient_state AS sleep_ps,
				lb.occurred_at AS leave_occurred_at,
				sob.occurred_at AS sleep_occurred_at,
			EXTRACT(EPOCH FROM(lb.occurred_at - sob.occurred_at)) AS time_diff
			FROM selected_leave_bed AS lb
			LEFT JOIN selected_sleep_on_bed as sob
			ON lb.device_id = sob.device_id
			WHERE lb.occurred_at > sob.occurred_at
			LIMIT 1
		)
		UNION ALL
		SELECT iterative_result.* FROM final_results, LATERAL
		(
			SELECT
				lb.id AS leave_id,
				sob.id AS sleep_id,
				lb.device_id,
				lb.patient_state AS leave_ps,
				sob.patient_state AS sleep_ps,
				lb.occurred_at AS leave_occurred_at,
				sob.occurred_at AS sleep_occurred_at,
			EXTRACT(EPOCH FROM(lb.occurred_at - sob.occurred_at)) AS time_diff
			FROM selected_leave_bed AS lb
			LEFT JOIN selected_sleep_on_bed as sob
			ON lb.device_id = sob.device_id
			WHERE
				lb.occurred_at < final_results.sleep_occurred_at
			AND sob.occurred_at < final_results.sleep_occurred_at
			AND lb.occurred_at > sob.occurred_at
			LIMIT 1
		) AS iterative_result
	)

	SELECT device_id, SUM(time_diff) as sum
	FROM final_results
	GROUP BY device_id;
`

func (s *statisticsRepo) calcSleepDurationSum(deviceID uuid.UUID, startAt, endAt time.Time) (*sumData, error) {
	var sum *sumData
	res := s.db.Raw(fmt.Sprintf(countSleepLessThanSqlScript,
		startAt.Format(time.RFC3339),
		endAt.Format(time.RFC3339),
		_6PM,
		_6AM,
		deviceID)).Scan(&sum)

	if res.Error != nil {
		return nil, res.Error
	}

	if res.RowsAffected == 0 {
		return nil, ErrNoData
	}
	return sum, nil
}

const countLongLyingSqlScript = `
WITH long_lying_events AS (
	SELECT
		sba.data_id,
		events.device_id,
		sba.option,
		sba.created_at AS emitted_at

	FROM smartbed_alerts AS sba

	LEFT JOIN events
	ON sba.data_id = events.id

	WHERE sba.option = 'longLying' AND
		events.device_id IN @DEVICE_IDS

	UNION

	SELECT
		sbda.data_id,
		sbda.device_id,
		sbda.option,
		sbda.emitted_at
	FROM smartbed_delay_alerts AS sbda
	WHERE sbda.option = 'longLying' AND sbda.emitted_at IS NOT NULL
	AND sbda.device_id IN @DEVICE_IDS
)

SELECT
	device_id,
	COUNT(device_id)
FROM long_lying_events
WHERE emitted_at BETWEEN '%[1]s' AND '%[2]s'
GROUP BY device_id
`

func (s *statisticsRepo) countLongLying(deviceIDs []uuid.UUID, startAt, endAt time.Time) ([]*countData, error) {
	var counts []*countData
	res := s.db.Raw(fmt.Sprintf(countLongLyingSqlScript,
		startAt.Format(time.RFC3339),
		endAt.Format(time.RFC3339)),
		sql.Named("DEVICE_IDS", deviceIDs)).Scan(&counts)

	if res.Error != nil {
		return nil, res.Error
	}

	if res.RowsAffected == 0 {
		return nil, ErrNoData
	}

	return counts, nil
}

const countAbnormalBreathSqlScript = `
WITH selected_heart_breath_alerts AS (
	SELECT
		bra.data_id,
		hb.device_id,
		bra.option,
		hb.occurred_at
	FROM breath_rate_alerts AS bra
	LEFT JOIN heart_breaths AS hb
	ON bra.data_id = hb.id

	WHERE (bra.option = 'slowBreathRate' OR bra.option = 'rapidBreathRate')
		AND hb.occurred_at BETWEEN '%[1]s' AND '%[2]s'
		AND hb.device_id IN @DEVICE_IDS
	)

	SELECT
		device_id,
		COUNT(option)
	FROM selected_heart_breath_alerts
	GROUP BY device_id
`

func (s *statisticsRepo) countAbnormalBreath(deviceIDs []uuid.UUID, startAt, endAt time.Time) ([]*countData, error) {
	var counts []*countData

	res := s.db.Raw(fmt.Sprintf(countAbnormalBreathSqlScript,
		startAt.Format(time.RFC3339),
		endAt.Format(time.RFC3339)),
		sql.Named("DEVICE_IDS", deviceIDs)).Scan(&counts)

	if res.Error != nil {
		return nil, res.Error
	}

	if res.RowsAffected == 0 {
		return nil, ErrNoData
	}
	return counts, nil
}

const listHistoricSpacePatientDeviceSqlScript = `
	WITH device_installed_in_spaces_history AS (
		SELECT space_id, device_id, branch, room, bed, organization_id, dins.updated_at AS device_updated_at, is_installed_in
		FROM device_installed_in_spaces AS dins

		JOIN (
			SELECT * FROM spaces_v2 WHERE organization_id = '%[1]s'
		) as organization_spaces
		ON dins.space_id = organization_spaces.id

		WHERE
		dins.updated_at BETWEEN '%[2]s' AND '%[3]s' AND dins.is_installed_in IS FALSE
		OR dins.is_installed_in IS TRUE
	), patient_lived_in_spaces_history AS (
		SELECT patient_id, space_id , organization_id, first_name, last_name, pins.updated_at AS patient_updated_at, is_living_in
		FROM patient_lived_spaces AS pins
		JOIN patients_v2
		ON pins.patient_id = patients_v2.id
		AND organization_id = '%[1]s'
		WHERE pins.space_id IN (
			SELECT space_id FROM device_installed_in_spaces_history
		)
		AND pins.updated_at BETWEEN '%[2]s'
		AND '%[3]s' AND pins.is_living_in IS TRUE
		ORDER BY pins.updated_at DESC
	)
	SELECT
		dsh.device_id,
		dsh.space_id,
		dsh.branch,
		dsh.room,
		dsh.bed,
		psh.patient_id,
		psh.first_name,
		psh.last_name,
		psh.is_living_in,
		psh.patient_updated_at,
		dsh.is_installed_in,
		dsh.device_updated_at

	FROM device_installed_in_spaces_history AS dsh
	JOIN patient_lived_in_spaces_history AS psh
	ON psh.space_id = dsh.space_id
`

func (s *statisticsRepo) listSpacesWithHistoricPatientDevice(orgID uuid.UUID, startAt time.Time, endAt time.Time) ([]*SpacePatientDeviceRegistry, error) {
	var records []*SpacePatientDeviceRegistry
	res := s.db.Raw(fmt.Sprintf(listHistoricSpacePatientDeviceSqlScript,
		orgID.String(),
		startAt.Format(time.RFC3339),
		endAt.Format(time.RFC3339))).Scan(&records)

	if res.Error != nil {
		return nil, res.Error
	}

	if res.RowsAffected == 0 {
		return nil, ErrNoData
	}

	return records, nil
}


```

### statistical repository integration test

```go
package repository

import (
	"fmt"
	"testing"
	"time"

	"github.com/google/uuid"
	"github.com/stretchr/testify/require"
	"go.uber.org/zap"
	"gorm.io/gorm"
	"jubo.health/jubo-space-backend/backend/deviceconfig/configkeys"
	"jubo.health/jubo-space-backend/backend/envconfig"
	"jubo.health/jubo-space-backend/pb"
)

type mockSmartbed struct {
	id                 uuid.UUID
	device_id          uuid.UUID
	occurred_at        time.Time
	created_at         time.Time
	disalarmed_at      time.Time
	emitted_at         time.Time
	option             string
	severity           string
	patientState       int
	patientStateDetail int
	delayAlert         bool
}

func NewMockStatisticRepo(db *gorm.DB) StatsRepo {
	return &statisticsRepo{db}
}

const genSmartbedAlertScript = `
INSERT INTO events(id, device_id, occurred_at, created_at, patient_state, patient_state_detail)
VALUES (
	'%[1]s', '%[2]s', '%[3]s', '%[4]s', %[8]d, %[9]d
);

INSERT INTO smartbed_alerts(data_id, created_at, disalarmed_at, option, severity)
VALUES (
	'%[1]s', '%[4]s', NULL, '%[6]s', '%[7]s'
);
`

func generateMockSmartbedAlert(db *gorm.DB,
	id, device_id uuid.UUID,
	occurred_at, created_at, disalarmed_at time.Time,
	option, severity string,
	patientState, patientStateDetail int,
) error {
	return db.Exec(fmt.Sprintf(genSmartbedAlertScript,
		id, device_id, occurred_at.Format(time.RFC3339), created_at.Format(time.RFC3339), disalarmed_at.Format(time.RFC3339), option, severity, patientState, patientStateDetail)).Error
}

const genSmartbedDelayAlertScript = `
INSERT INTO events(id, device_id, occurred_at, created_at, patient_state, patient_state_detail)
VALUES (
	'%[1]s', '%[2]s', '%[3]s', '%[4]s', %[8]d, %[9]d
);

INSERT INTO smartbed_delay_alerts(data_id, created_at, disalarmed_at, option, severity, device_id, should_emit_at, emitted_at)
VALUES (
	'%[1]s', '%[4]s', NULL, '%[6]s', '%[7]s', '%[2]s', '%[4]s', '%[5]s'
);
`

func generateMockSmartbedDelayAlert(db *gorm.DB,
	id, device_id uuid.UUID,
	occurred_at, created_at, emitted_at time.Time,
	patient_state, patient_state_detail int,
	option, severity string,
) error {
	return db.Exec(fmt.Sprintf(genSmartbedDelayAlertScript,
		id, device_id, occurred_at.Format(time.RFC3339), created_at.Format(time.RFC3339), emitted_at.Format(time.RFC3339), option, severity, patient_state, patient_state_detail)).Error
}

type mockHeartBreath struct {
	id          uuid.UUID
	device_id   uuid.UUID
	occurred_at time.Time
	created_at  time.Time
	rpm         int
	bpm         int
	threshhold  int
	option      string
	severity    string
}

const genBreathAlertScript = `
INSERT INTO heart_breaths(id, device_id, occurred_at, created_at, rpm, bpm)
VALUES (
	'%[1]s', '%[2]s', '%[3]s', '%[4]s', %[6]d, %[7]d
);

INSERT INTO breath_rate_alerts(data_id, created_at, disalarmed_at, option, severity, threshhold)
VALUES (
	'%[1]s', '%[4]s', NULL, '%[9]s', '%[10]s', %[8]d
);
`

func generateMockBreathAlert(db *gorm.DB,
	id, device_id uuid.UUID,
	occurred_at, created_at time.Time,
	disalarmed_at *time.Time,
	rpm, bpm, threshhold int,
	option, severity string,
) error {
	return db.Exec(fmt.Sprintf(genBreathAlertScript,
		id, device_id, occurred_at.Format(time.RFC3339), created_at.Format(time.RFC3339), disalarmed_at, rpm, bpm, threshhold, option, severity)).Error
}

func setupTestStatsRepo(t *testing.T) (*statisticsRepo, *gorm.DB, *zap.Logger) {
	t.Helper()
	logger := zap.NewNop()
	env, err := envconfig.New()
	require.NoError(t, err)
	db, err := ConnectPostgres(env.DB_DSN, env.Debug)
	require.NoError(t, err)
	s := &statisticsRepo{
		db: db,
	}
	return s, db, logger
}

func Test_Integration_StatisticsRepo_Calculate_Sleep_Duration_Summation(t *testing.T) {
	repo, db, _ := setupTestStatsRepo(t)
	devices := []string{
		"06b2ae5e-2d1c-11ed-b6b7-000000000000",
		"06b2ae5e-2d1c-11ed-b6b7-111111111111",
		"06b2ae5e-2d1c-11ed-b6b7-222222222222",
		"06b2ae5e-2d1c-11ed-b6b7-333333333333",
	}
	var deviceUUIDs []uuid.UUID
	for _, device := range devices {
		uuid, err := uuid.Parse(device)
		require.NoError(t, err)
		deviceUUIDs = append(deviceUUIDs, uuid)

	}
	var eventUUIDs []uuid.UUID
	for i := 0; i < 10; i++ {
		uuid, err := uuid.NewUUID()
		require.NoError(t, err)
		eventUUIDs = append(eventUUIDs, uuid)
	}
	now := time.Now()
	tests := []struct {
		name         string
		giveStartAt  time.Time
		giveEndAt    time.Time
		giveDeviceID uuid.UUID
		giveEvents   []*mockSmartbed
		wantSums     []*sumData
		wantErr      error
	}{
		{
			name:         "Integration_Test_Calculate_Sleep_Duration_Summation_Out_of_Range_No_Data",
			giveStartAt:  time.Now().Add(-24 * time.Hour),
			giveEndAt:    time.Now().Add(24 * time.Hour),
			giveDeviceID: deviceUUIDs[2],
			giveEvents: []*mockSmartbed{
				{
					id:                 eventUUIDs[6],
					device_id:          deviceUUIDs[2],
					occurred_at:        time.Date(now.Year()+15, now.Month(), now.Day(), 1, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_SLEEP_ON_BED),
					patientStateDetail: int(pb.PatientStateDetail_LAY_ON_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[7],
					device_id:          deviceUUIDs[2],
					occurred_at:        time.Date(now.Year()+15, now.Month(), now.Day(), 1, 30, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         false,
				},
			},
			wantSums: []*sumData{(*sumData)(nil)},
			wantErr:  ErrNoData,
		},
		{
			name:         "Integration_Test_Calculate_Sleep_Duration_Summation_Reverse_SLEEP_LEAVE_BED_Time_Entries",
			giveStartAt:  time.Now().Add(-24 * time.Hour),
			giveEndAt:    time.Now().Add(24 * time.Hour),
			giveDeviceID: deviceUUIDs[3],
			giveEvents: []*mockSmartbed{
				{
					id:                 eventUUIDs[8],
					device_id:          deviceUUIDs[3],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 1, 30, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_SLEEP_ON_BED),
					patientStateDetail: int(pb.PatientStateDetail_LAY_ON_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[9],
					device_id:          deviceUUIDs[3],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 1, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         false,
				},
			},
			wantSums: []*sumData{(*sumData)(nil)},
			wantErr:  ErrNoData,
		},
		{
			name:         "Integration_Test_Calculate_Sleep_Duration_Summation_Multiple_Entries",
			giveStartAt:  time.Now().Add(-24 * time.Hour),
			giveEndAt:    time.Now().Add(24 * time.Hour),
			giveDeviceID: deviceUUIDs[1],
			giveEvents: []*mockSmartbed{
				{
					id:                 eventUUIDs[2],
					device_id:          deviceUUIDs[1],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 1, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_SLEEP_ON_BED),
					patientStateDetail: int(pb.PatientStateDetail_LAY_ON_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[3],
					device_id:          deviceUUIDs[1],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 1, 30, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[4],
					device_id:          deviceUUIDs[1],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 2, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_SLEEP_ON_BED),
					patientStateDetail: int(pb.PatientStateDetail_LAY_ON_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[5],
					device_id:          deviceUUIDs[1],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 3, 30, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         false,
				},
			},
			wantSums: []*sumData{
				{
					DeviceID: &deviceUUIDs[1],
					Sum:      1800 + 3600 + 1800,
				},
			},
			wantErr: nil,
		},
		{
			name:         "Integration_Test_Calculate_Sleep_Duration_Summation_Single_Sleep_Leave_Bed",
			giveStartAt:  time.Now().Add(-24 * time.Hour),
			giveEndAt:    time.Now().Add(24 * time.Hour),
			giveDeviceID: deviceUUIDs[0],
			giveEvents: []*mockSmartbed{
				{
					id:                 eventUUIDs[0],
					device_id:          deviceUUIDs[0],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 1, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_SLEEP_ON_BED),
					patientStateDetail: int(pb.PatientStateDetail_LAY_ON_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[1],
					device_id:          deviceUUIDs[0],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 1, 30, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_layOnBed),
					severity:           string(configkeys.SeverityKey_Normal),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         false,
				},
			},
			wantSums: []*sumData{
				{
					DeviceID: &deviceUUIDs[0],
					Sum:      1800,
				},
			},
			wantErr: nil,
		},
	}
	for _, tc := range tests {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
			for _, event := range tc.giveEvents {
				if event.delayAlert {
					require.NoError(t, generateMockSmartbedDelayAlert(db, event.id, event.device_id, event.occurred_at, event.created_at, event.emitted_at, event.patientState, event.patientStateDetail, event.option, event.severity))

				} else {
					require.NoError(t, generateMockSmartbedAlert(db, event.id, event.device_id, event.occurred_at, event.created_at, event.disalarmed_at, event.option, event.severity, event.patientState, event.patientStateDetail))
				}
			}
			var summations []*sumData

			sum, err := repo.calcSleepDurationSum(tc.giveDeviceID, tc.giveStartAt, tc.giveEndAt)
			if err != nil {
				require.Equal(t, tc.wantErr, err)
			}
			summations = append(summations, sum)
			require.Equal(t, tc.wantSums, summations)
		})
	}
}

func Test_Integration_StatisticRepo_Count_Away_From_Bed(t *testing.T) {
	repo, db, _ := setupTestStatsRepo(t)
	devices := []string{
		"05b2ae5e-2d1c-11ed-b6b7-000000000000",
		"05b2ae5e-2d1c-11ed-b6b7-111111111111",
		"05b2ae5e-2d1c-11ed-b6b7-222222222222",
		"05b2ae5e-2d1c-11ed-b6b7-333333333333",
	}
	var deviceUUIDs []uuid.UUID
	for _, device := range devices {
		uuid, err := uuid.Parse(device)
		require.NoError(t, err)
		deviceUUIDs = append(deviceUUIDs, uuid)

	}
	var eventUUIDs []uuid.UUID
	for i := 0; i < 10; i++ {
		uuid, err := uuid.NewUUID()
		require.NoError(t, err)
		eventUUIDs = append(eventUUIDs, uuid)
	}
	now := time.Now()
	tests := []struct {
		name        string
		giveStartAt time.Time
		giveEndAt   time.Time
		giveEvents  []*mockSmartbed
		wantCounts  []*countData
		wantErr     error
	}{
		{
			name:        "Integration_Test_Valid_Count_Away_From_Bed",
			giveStartAt: time.Now().Add(-24 * time.Hour),
			giveEndAt:   time.Now().Add(24 * time.Hour),
			giveEvents: []*mockSmartbed{
				{
					id:                 eventUUIDs[0],
					device_id:          deviceUUIDs[0],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 20, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_awayFromBed),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[1],
					device_id:          deviceUUIDs[0],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 5, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_awayFromBed),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         true,
				},
				{
					id:                 eventUUIDs[2],
					device_id:          deviceUUIDs[0],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 12, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_awayFromBed),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[3],
					device_id:          deviceUUIDs[1],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 18, 0, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_awayFromBed),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         true,
				},
				{
					id:                 eventUUIDs[4],
					device_id:          deviceUUIDs[1],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 17, 59, 59, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_awayFromBed),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[5],
					device_id:          deviceUUIDs[1],
					occurred_at:        time.Date(now.Year(), now.Month(), now.Day(), 6, 1, 0, 0, time.UTC),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_awayFromBed),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_LEAVE_BED),
					patientStateDetail: int(pb.PatientStateDetail_AWAY_FROM_BED),
					delayAlert:         true,
				},
			},
			wantCounts: []*countData{
				{
					DeviceID: &deviceUUIDs[0],
					Count:    2,
				},
				{
					DeviceID: &deviceUUIDs[1],
					Count:    1,
				},
			},
			wantErr: nil,
		},
	}
	for _, tc := range tests {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
			for _, event := range tc.giveEvents {
				if event.delayAlert {
					require.NoError(t, generateMockSmartbedDelayAlert(db, event.id, event.device_id, event.occurred_at, event.created_at, event.emitted_at, event.patientState, event.patientStateDetail, event.option, event.severity))

				} else {
					require.NoError(t, generateMockSmartbedAlert(db, event.id, event.device_id, event.occurred_at, event.created_at, event.disalarmed_at, event.option, event.severity, event.patientState, event.patientStateDetail))
				}
			}
			counts, err := repo.countAwayFromBed(deviceUUIDs, tc.giveStartAt, tc.giveEndAt)
			if err != nil {
				require.Equal(t, tc.wantErr, err)
			}
			require.Equal(t, tc.wantCounts, counts)
			require.ElementsMatch(t, tc.wantCounts, counts)
		})
	}
}

func Test_Integration_StatisticsRepo_Count_Long_Lying(t *testing.T) {
	repo, db, _ := setupTestStatsRepo(t)
	devices := []string{
		"04b2ae5e-2d1c-11ed-b6b7-000000000000",
		"04b2ae5e-2d1c-11ed-b6b7-111111111111",
		"04b2ae5e-2d1c-11ed-b6b7-222222222222",
		"04b2ae5e-2d1c-11ed-b6b7-333333333333",
	}
	var deviceUUIDs []uuid.UUID
	for _, device := range devices {
		uuid, err := uuid.Parse(device)
		require.NoError(t, err)
		deviceUUIDs = append(deviceUUIDs, uuid)
	}
	var eventUUIDs []uuid.UUID
	for i := 0; i < 10; i++ {
		uuid, err := uuid.NewUUID()
		require.NoError(t, err)
		eventUUIDs = append(eventUUIDs, uuid)
	}
	tests := []struct {
		name        string
		giveStartAt time.Time
		giveEndAt   time.Time
		giveEvents  []*mockSmartbed
		wantCounts  []*countData
		wantErr     error
	}{
		{
			name:        "Integration_Test_Valid_Long_Lying_Count_From_Smartbed_Alert_And_Smartbed_Delay_Alert",
			giveStartAt: time.Now().Add(-time.Hour),
			giveEndAt:   time.Now().Add(time.Hour),
			giveEvents: []*mockSmartbed{
				{
					id:                 eventUUIDs[0],
					device_id:          deviceUUIDs[0],
					occurred_at:        time.Now(),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_longLying),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_SLEEP_ON_BED),
					patientStateDetail: int(pb.PatientStateDetail_LAY_ON_BED),
					delayAlert:         false,
				},
				{
					id:                 eventUUIDs[1],
					device_id:          deviceUUIDs[0],
					occurred_at:        time.Now(),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_longLying),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_SLEEP_ON_BED),
					patientStateDetail: int(pb.PatientStateDetail_LAY_ON_BED),
					delayAlert:         true,
				},
				{
					id:                 eventUUIDs[2],
					device_id:          deviceUUIDs[1],
					occurred_at:        time.Now(),
					created_at:         time.Now(),
					disalarmed_at:      time.Now(),
					emitted_at:         time.Now(),
					option:             string(configkeys.OptionKey_Smartbed_longLying),
					severity:           string(configkeys.SeverityKey_Severe),
					patientState:       int(pb.PatientState_SLEEP_ON_BED),
					patientStateDetail: int(pb.PatientStateDetail_LAY_ON_BED),
					delayAlert:         false,
				},
			},
			wantCounts: []*countData{
				{
					DeviceID: &deviceUUIDs[0],
					Count:    2,
				},
				{
					DeviceID: &deviceUUIDs[1],
					Count:    1,
				},
			},
			wantErr: nil,
		},
		{
			name:        "Integration_Test_Long_Lying_With_Delay_Alert_Emitted_At_Is_Null",
			giveStartAt: time.Now().Add(time.Hour),
			giveEndAt:   time.Now().Add(time.Hour),
			giveEvents: []*mockSmartbed{
				{},
			},
			wantCounts: nil,
			wantErr:    ErrNoData,
		},
	}
	for _, tc := range tests {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
			for _, event := range tc.giveEvents {
				if event.delayAlert {
					require.NoError(t, generateMockSmartbedDelayAlert(db, event.id, event.device_id, event.occurred_at, event.created_at, event.emitted_at, event.patientState, event.patientStateDetail, event.option, event.severity))

				} else {
					require.NoError(t, generateMockSmartbedAlert(db, event.id, event.device_id, event.occurred_at, event.created_at, event.disalarmed_at, event.option, event.severity, event.patientState, event.patientStateDetail))
				}
			}
			counts, err := repo.countLongLying(deviceUUIDs, tc.giveStartAt, tc.giveEndAt)
			if err != nil {
				require.Equal(t, tc.wantErr, err)
			}
			require.Equal(t, tc.wantCounts, counts)
		})
	}
}

func Test_Integration_StatisticRepo_Count_Abnormal_Breath(t *testing.T) {
	repo, db, _ := setupTestStatsRepo(t)
	devices := []string{
		"03b2ae5e-2d1c-11ed-b6b7-000000000000",
		"03b2ae5e-2d1c-11ed-b6b7-111111111111",
		"03b2ae5e-2d1c-11ed-b6b7-222222222222",
		"03b2ae5e-2d1c-11ed-b6b7-333333333333",
	}
	var deviceUUIDs []uuid.UUID
	for _, device := range devices {
		d, err := uuid.Parse(device)
		require.NoError(t, err)
		deviceUUIDs = append(deviceUUIDs, d)
	}
	var eventUUIDs []uuid.UUID
	for i := 0; i < 10; i++ {
		e, err := uuid.NewUUID()
		require.NoError(t, err)
		eventUUIDs = append(eventUUIDs, e)
	}

	tests := []struct {
		name        string
		giveStartAt time.Time
		giveEndAt   time.Time
		giveEvents  []*mockHeartBreath
		wantCounts  []*countData
		wantErr     error
	}{
		{
			name:        "Integration_Test_Empty_Abnormal_Breath_Count_Case",
			giveStartAt: time.Now().Add(-49 * time.Hour),
			giveEndAt:   time.Now().Add(-48 * time.Hour),
			giveEvents:  []*mockHeartBreath{},
			wantCounts:  nil,
			wantErr:     ErrNoData,
		},
		{
			name:        "Integration_Test_Abnormal_Breath_Count_Out_Of_Time_Range_Case",
			giveStartAt: time.Now().Add(-25 * time.Hour),
			giveEndAt:   time.Now().Add(-22 * time.Hour),
			giveEvents: []*mockHeartBreath{
				{
					id:          eventUUIDs[4],
					device_id:   deviceUUIDs[2],
					occurred_at: time.Now().Add(-26 * time.Hour),
					created_at:  time.Now(),
					rpm:         20,
					bpm:         10,
					threshhold:  15,
					option:      string(configkeys.OptionKey_BreathRate_rapidBreathRate),
				},
				{
					id:          eventUUIDs[5],
					device_id:   deviceUUIDs[2],
					occurred_at: time.Now().Add(-27 * time.Hour),
					created_at:  time.Now(),
					rpm:         20,
					bpm:         10,
					threshhold:  15,
					option:      string(configkeys.OptionKey_BreathRate_rapidBreathRate),
				},
				{
					id:          eventUUIDs[6],
					device_id:   deviceUUIDs[3],
					occurred_at: time.Now().Add(-23 * time.Hour),
					created_at:  time.Now(),
					rpm:         20,
					bpm:         10,
					threshhold:  15,
					option:      string(configkeys.OptionKey_BreathRate_rapidBreathRate),
				},
				{
					id:          eventUUIDs[7],
					device_id:   deviceUUIDs[3],
					occurred_at: time.Now().Add(-23 * time.Hour),
					created_at:  time.Now(),
					rpm:         20,
					bpm:         10,
					threshhold:  15,
					option:      string(configkeys.OptionKey_BreathRate_rapidBreathRate),
				},
			},
			wantCounts: []*countData{
				{
					DeviceID: &deviceUUIDs[3],
					Count:    2,
				},
			},
			wantErr: nil,
		},
		{
			name:        "Integration_Test_Valid_Abnormal_Breath_Count_Case_No_Option",
			giveStartAt: time.Now().Add(-time.Hour),
			giveEndAt:   time.Now().Add(time.Hour),
			giveEvents: []*mockHeartBreath{
				{
					id:          eventUUIDs[0],
					device_id:   deviceUUIDs[0],
					occurred_at: time.Now(),
					created_at:  time.Now(),
					rpm:         20,
					bpm:         10,
					threshhold:  15,
				},
				{
					id:          eventUUIDs[1],
					device_id:   deviceUUIDs[0],
					occurred_at: time.Now(),
					created_at:  time.Now(),
					rpm:         20,
					bpm:         10,
					threshhold:  15,
					option:      string(configkeys.OptionKey_BreathRate_slowBreathRate),
				},
				{
					id:          eventUUIDs[2],
					device_id:   deviceUUIDs[1],
					occurred_at: time.Now().Add(-2 * time.Hour),
					created_at:  time.Now().Add(-2 * time.Hour),
					rpm:         20,
					bpm:         10,
					threshhold:  15,
					option:      string(configkeys.OptionKey_BreathRate_slowBreathRate),
				},
				{
					id:          eventUUIDs[3],
					device_id:   deviceUUIDs[1],
					occurred_at: time.Now().Add(-2 * time.Minute),
					created_at:  time.Now().Add(-2 * time.Minute),
					rpm:         20,
					bpm:         10,
					threshhold:  15,
					option:      string(configkeys.OptionKey_BreathRate_slowBreathRate),
				},
			},
			wantCounts: []*countData{
				{
					DeviceID: &deviceUUIDs[0],
					Count:    1,
				},
				{
					DeviceID: &deviceUUIDs[1],
					Count:    1,
				},
			},
			wantErr: nil,
		},
	}
	for _, tc := range tests {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
			for _, event := range tc.giveEvents {
				require.NoError(t, generateMockBreathAlert(db, event.id, event.device_id, event.occurred_at, event.created_at, nil, event.rpm, event.bpm, event.threshhold, event.option, event.severity))
			}

			counts, err := repo.countAbnormalBreath(deviceUUIDs, tc.giveStartAt, tc.giveEndAt)
			if err != nil {
				require.Equal(t, tc.wantErr, err)
			}
			require.Equal(t, tc.wantCounts, counts)
		})
	}
}


```