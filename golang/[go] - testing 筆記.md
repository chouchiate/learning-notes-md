## [go] - Testing


### Mocking

* mocking db

* mocking backend


### Test single function
```bash
go test -run TestMyFunction ./.../path/to/package
```

### Testify
[testify-require](https://pkg.go.dev/github.com/stretchr/testify@v1.7.0/require)

```go
import (
  "testing"
  "github.com/stretchr/testify/require"
)

func TestSomething(t *testing.T) {

  var a string = "Hello"
  var b string = "Hello"

  require.Equal(t, a, b, "The two words should be the same.")

}
```


### Test Parallel with Zap Logger


```go
func Test_some_function_with_cases(t *testing.T) {
	tests := []struct {
		name string
    wantVal int
	}{
		{
			"name of the test.....",
      1,
		},
	}
	for _, tc := range tests {
		tt := tc
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			zapCore, logs := observer.New(zap.DebugLevel)
			logger := zap.New(zapCore)

			repo := setupTestRepo(t, __someCollection)

			m := newMockBackend()
			p := someHandler(logger, repo, m)

			now := time.Now().Truncate(time.Second)
			device := t.Name() + "_" + uuid.NewString()
			p.Process(device, now, now)

			require.Eventually(t, func() bool {
				return m.offlineCnt == 1
			}, _totalWaitFor, _tickInterval)

			require.Eventually(t, func() bool {
				return logs.FilterMessage("save offline result").Len() == 1
			}, _totalWaitFor, _tickInterval, `should hit the last log ("save offline result")`)

			require.Equal(t, 0, logs.FilterLevelExact(zap.ErrorLevel).Len(), "should not found any error level logs after we have checked the 'save result' has been logged")
		})
	}
}

```

### Dynamic creating mocking object for test cases

```go
// implementation interface

type StatisticsRepo interface {
	GetOrgMattressStats(orgID uuid.UUID, startAt, endAt time.Time) (*MattressStatsQueryResult, error)
	CountAwayFromBed(deviceIDs []uuid.UUID, startAt, endAt time.Time) ([]*CountData, error)
	CalcSleepDuration(deviceIDs []uuid.UUID, startAt, endAt time.Time) ([]*CountData, error)
	CountLongLying(deviceIDs []uuid.UUID, startAt, endAt time.Time) ([]*CountData, error)
	CountAbnormalBreath(deviceIDs []uuid.UUID, startAt, endAt time.Time) ([]*CountData, error)
	ListSpacesWithHistoricPatientDevice(orgID uuid.UUID, startAt, endAt time.Time) ([]*SpacePatientDeviceRegistry, error)
}

// mocking repository interface
type mockStatisticsRepo struct {
	organizationID       uuid.UUID
	deviceList           []*uuid.UUID
	awayFromBedCounts    []*repository.CountData
	sleepDurations       []*repository.CountData
	longLyingCounts      []*repository.CountData
	abnormalBreathCounts []*repository.CountData
	registry             []*repository.SpacePatientDeviceRegistry
	statisticsResponse   contracts.OrganizationStatisticsResponse
}

func (s *mockStatisticsRepo) GetOrgMattressStats(orgID uuid.UUID, startAt, endAt time.Time) (*repository.MattressStatsQueryResult, error) {
	var mockDeviceIDs []uuid.UUID
	x, _ := s.ListSpacesWithHistoricPatientDevice(orgID, startAt, endAt)
	a, _ := s.CountAwayFromBed(mockDeviceIDs, startAt, endAt)
	b, _ := s.CalcSleepDuration(mockDeviceIDs, startAt, endAt)
	l, _ := s.CountLongLying(mockDeviceIDs, startAt, endAt)
	ab, _ := s.CountAbnormalBreath(mockDeviceIDs, startAt, endAt)

	return &repository.MattressStatsQueryResult{
		Registry:            x,
		CountAwayFromBed:    a,
		SleepDuration:       b,
		CountLongLying:      l,
		CountAbnormalBreath: ab,
	}, nil
}

func (s *mockStatisticsRepo) CountAwayFromBed(deviceIDs []uuid.UUID, startAt, endAt time.Time) (counts []*repository.CountData, err error) {

	return s.awayFromBedCounts, nil
}
func (s *mockStatisticsRepo) CalcSleepDuration(deviceIDs []uuid.UUID, startAt, endAt time.Time) (average []*repository.CountData, err error) {

	return s.sleepDurations, nil
}
func (s *mockStatisticsRepo) CountLongLying(deviceIDs []uuid.UUID, startAt, endAt time.Time) (counts []*repository.CountData, err error) {

	return s.longLyingCounts, nil
}
func (s *mockStatisticsRepo) CountAbnormalBreath(deviceIDs []uuid.UUID, startAt, endAt time.Time) (counts []*repository.CountData, err error) {

	return s.abnormalBreathCounts, nil
}
func (s *mockStatisticsRepo) ListSpacesWithHistoricPatientDevice(orgID uuid.UUID, startAt, endAt time.Time) ([]*repository.SpacePatientDeviceRegistry, error) {

	return s.registry, nil
}

// Test Functions
func Test_Organization_Weekly_Statistics_Response(t *testing.T) {
	org := "de430736-4be5-409f-80fb-2afcd1b3b87e"
	numberOfDevices := 10
	var deviceLists []*uuid.UUID
	var spaceLists []*uuid.UUID
	for i := 0; i < numberOfDevices; i++ {
		// create mock devices
		deviceID, _ := uuid.NewUUID()
		spaceID, _ := uuid.NewUUID()
		deviceLists = append(deviceLists, &deviceID)
		spaceLists = append(spaceLists, &spaceID)
	}

	tests := []struct {
		name                     string
		query                    string
		giveAwayFromBedCounts    []*repository.CountData
		giveSleepDuration        []*repository.CountData
		giveLongLyingCounts      []*repository.CountData
		giveAbnormalBreathCounts []*repository.CountData
		giveSpaceRegistry        []*repository.SpacePatientDeviceRegistry
		wantResponse             contracts.OrganizationStatisticsResponse
	}{
		{
			name:  "valid_statistics_aggregation_response",
			query: "/api/statistics/organization/de430736-4be5-409f-80fb-2afcd1b3b87e?start=2022-08-22T00:00:00Z&end=2022-08-28T00:00:00Z",
			giveAwayFromBedCounts: func() []*repository.CountData {
				var afbc []*repository.CountData
				// create mocking query results
				for i := 0; i < numberOfDevices; i++ {
					afbc = append(afbc, &repository.CountData{
						DeviceID: deviceLists[i],
						Count:    rand.Intn(10),
					})
				}
				return afbc
			}(),
			giveSleepDuration: func() []*repository.CountData {
				var sd []*repository.CountData
				// create mocking query results
				for i := 0; i < numberOfDevices; i++ {
					sd = append(sd, &repository.CountData{
						DeviceID: deviceLists[i],
						Count:    rand.Intn(55),
					})
				}
				return sd
			}(),
			giveLongLyingCounts: func() []*repository.CountData {
				var llc []*repository.CountData
				// create mocking query results
				for i := 0; i < numberOfDevices; i++ {
					llc = append(llc, &repository.CountData{
						DeviceID: deviceLists[i],
						Count:    rand.Intn(15),
					})
				}
				return llc
			}(),
			giveAbnormalBreathCounts: func() []*repository.CountData {
				var abc []*repository.CountData
				for i := 0; i < numberOfDevices; i++ {
					abc = append(abc, &repository.CountData{
						DeviceID: deviceLists[i],
						Count:    rand.Intn(15),
					})
				}
				return abc
			}(),
			giveSpaceRegistry: func() []*repository.SpacePatientDeviceRegistry {
				var sr []*repository.SpacePatientDeviceRegistry
				// create mocking registries
				for i := 0; i < numberOfDevices; i++ {
					patientID, _ := uuid.NewUUID()
					sr = append(sr, &repository.SpacePatientDeviceRegistry{
						SpaceWithPatientDevice: repository.SpaceWithPatientDevice{
							SpaceID:   *spaceLists[i],
							Branch:    "",
							Room:      "",
							Bed:       "",
							PatientID: patientID,
							DeviceID:  *deviceLists[i],
						},
						PatientUpdatedAt: time.Now(),
						DeviceUpdatedAt:  time.Now(),
						IsLivingIn:       true,
						IsInstalledIn:    true,
					})
				}
				return sr
			}(),
		},
	}
	for _, tc := range tests {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
			logger := zap.NewNop()
			engine := gin.New()
			noAuth := engine.Group("")
			w := httptest.NewRecorder()
			orgID, err := uuid.Parse(org)
			require.NoError(t, err)
			registerStatisticsRouters(noAuth,
				logger,
				&mockStatisticsRepo{
					organizationID:       orgID,
					deviceList:           deviceLists,
					awayFromBedCounts:    tc.giveAwayFromBedCounts,
					sleepDurations:       tc.giveSleepDuration,
					longLyingCounts:      tc.giveLongLyingCounts,
					abnormalBreathCounts: tc.giveAbnormalBreathCounts,
					registry:             tc.giveSpaceRegistry,
					statisticsResponse:   tc.wantResponse,
				})
			req, err := http.NewRequest(http.MethodGet, tc.query, nil)
			require.NoError(t, err)
			engine.ServeHTTP(w, req)

		})
	}
}

```
