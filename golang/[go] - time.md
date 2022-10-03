## [go] - time


### Difference time.After vs time.Sleep

> The two will both pause the current goroutine execution for a certain duration. The difference is the function call time.Sleep(d) will let the current goroutine enter **sleeping** sub-state, but still stay in running state, whereas, the channel receive operation <-time.After(d) will let the current goroutine enter **blocking** state.

[source](https://go101.org/article/unofficial-faq.html#time-sleep-after)

### add rand to time.Sleep for each go-routine waking different time

```go
	go func() {
		for {
            rand.Seed(time.Now().UnixNano())
            n := rand.Int63n(1000)
            time.Sleep((time.Duration(periodSecond)*time.Second + time.Duration(n)))
            // ... do some works
        }
    }()

```

### duration.truncate
* usage: 查找將規定的持續時間 d 朝零捨入到 m 持續時間的倍數的結果
```go
func (d Duration) Truncate(m Duration) Duration
```

```go
   tr, _:= time.ParseDuration("45m32.67s")

    // Prints truncated duration
    fmt.Printf("Truncated duration is:%s",
                 tr.Truncate(2*time.Second))
	// 45m32s
```

```go
    // Defining duration of Truncate method
    tr, _:= time.ParseDuration("7m11.0530776s")

    // Array of m
    t:= []time.Duration{
        time.Microsecond,
        time.Second,
        4 * time.Second,
        11 * time.Minute,
    }

    // Using for loop and range to
    // iterate over an array
    for _, m:= range t {

        // Prints rounded d of all
        // the items in an array
        fmt.Printf("Truncated(%s) is:%s\n",
                           m, tr.Truncate(m))
    }

	/*
		Truncated(1µs) is:7m11.053077s
		Truncated(1s) is:7m11s
		Truncated(4s) is:7m8s
		Truncated(11m0s) is:0s
	*/
```

### handling timezone from query range and truncate postgreql
```go

// usage
func usage() {

	// current design define evening hour range from 6pm to 6am
	timeQueryStr := buildDailyTimeQueryFromRange(startedAt, endedAt, _6PM, _6AM)
    // ...
	var g errgroup.Group
	g.Go(func() error {
		awayFromBedCounts, err = s.countAwayFromBed(deviceIDs, timeQueryStr)
		if err != nil {
			return err
		}
		return nil
	})
	g.Go(func() error {
		sleepDurationSummations, err = s.calcSleepDurationSum(deviceIDs, timeQueryStr)
		if err != nil {
			return err
		}
		return nil
	})
}


func buildDailyTimeQueryFromRange(startedAt, endedAt time.Time, startHour, endHour int) string {
	_, offsetSecond := startedAt.Zone()
	offsetHour := offsetSecond / (60 * 60)

	// add query string timezone offset to selected startHour and endHour
	var offsetStartHour, offsetEndHour int
	if startHour+offsetHour >= _24h00mHour {
		offsetStartHour = startHour + offsetHour - _24h00mHour
	} else if startHour+offsetHour < _0h00mHour {
		offsetStartHour = startHour + offsetHour + _24h00mHour
	} else {
		offsetStartHour = startHour + offsetHour
	}

	if endHour+offsetHour >= _24h00mHour {
		offsetEndHour = endHour + offsetHour - _24h00mHour
	} else if endHour+offsetHour < _0h00mHour {
		offsetEndHour = _24h00mHour + endHour + offsetHour
	} else {
		offsetEndHour = endHour + offsetHour
	}

	dailyFrom := startedAt
	dailyTo := startedAt
	if offsetStartHour > offsetEndHour {
		// select hour range day-crossing through midnight
		// first dailyFrom begin from previous day's offsetStartHour
		dailyFrom = dailyFrom.Add(-24 * time.Hour)
	}
	dailyFrom = time.Date(dailyFrom.Year(), dailyFrom.Month(), dailyFrom.Day(), offsetStartHour, 0, 0, 0, time.UTC)
	dailyTo = time.Date(dailyTo.Year(), dailyTo.Month(), dailyTo.Day(), offsetEndHour, 0, 0, 0, time.UTC)

	var timeQuery string
	for dailyTo.Before(endedAt.Add(24 * time.Hour)) {

		timeQuery += fmt.Sprintf(`(occurred_at BETWEEN '%[1]s' AND '%[2]s')`, dailyFrom.Format(time.RFC3339), dailyTo.Format(time.RFC3339))
		dailyFrom = dailyFrom.Add(24 * time.Hour)
		dailyTo = dailyTo.Add(24 * time.Hour)

		if dailyTo.Before(endedAt.Add(24 * time.Hour)) {
			timeQuery += ` OR `
		}
	}
	return timeQuery
}

// sql handler

const countAwayFromBedSqlScript = `
	SELECT device_id , COUNT(patient_state)
	FROM events
	WHERE device_id IN @DEVICE_IDS
	AND events.patient_state = %[2]d
	AND (%[1]s)
	GROUP BY device_id;
`

func (s *statisticsRepo) countAwayFromBed(deviceIDs []uuid.UUID, timeQuery string) ([]countData, error) {
	var counts []countData

	res := s.db.Raw(fmt.Sprintf(countAwayFromBedSqlScript,
		timeQuery, int(pb.PatientState_LEAVE_BED)),
		sql.Named("DEVICE_IDS", deviceIDs)).Scan(&counts)
	if res.RowsAffected == 0 {
		return nil, ErrNoData
	}

	if res.Error != nil {
		return nil, res.Error
	}

	return counts, nil
}


const selectAscendingBedEventsWithinTimeSqlScript = `
	SELECT * FROM events
	WHERE device_id IN @DEVICE_IDS
	AND (events.patient_state = %[2]d)
	AND (%[1]s)
	ORDER BY device_id, occurred_at ASC
`

func (s *statisticsRepo) calcSleepDurationSum(deviceIDs []uuid.UUID, timeQueryStr string) ([]sumData, error) {
	var sums []sumData
	var selectedSleepOnBeds []*schema.Event
	var selectedLeaveBeds []*schema.Event
	resSleep := s.db.Raw(fmt.Sprintf(selectAscendingBedEventsWithinTimeSqlScript,
		timeQueryStr,
		int(pb.PatientState_SLEEP_ON_BED)),
		sql.Named("DEVICE_IDS", deviceIDs)).Scan(&selectedSleepOnBeds)

	if resSleep.Error != nil {
		return nil, resSleep.Error
	}

	if resSleep.RowsAffected == 0 {
		// no single sleep on bed record to calculate sleep duration sum, early return with empty sumData
		return []sumData{}, nil
	}

	resLeave := s.db.Raw(fmt.Sprintf(selectAscendingBedEventsWithinTimeSqlScript,
		timeQueryStr,
		int(pb.PatientState_LEAVE_BED)),
		sql.Named("DEVICE_IDS", deviceIDs)).Scan(&selectedLeaveBeds)

	if resLeave.Error != nil {
		return nil, resLeave.Error
	}

	if resLeave.RowsAffected == 0 {
		// no single leave bed record to calculate sleep duration sum, early return with empty sumData
		return []sumData{}, nil
	}

	// selectedSleepOnBeds and selectedLeaveBeds are sorted by device_id and occurred_at in ASC order
	// group sorted set by device_id
	groupedSleepOnBeds := make(map[uuid.UUID][]*schema.Event)
	groupedLeaveBeds := make(map[uuid.UUID][]*schema.Event)

	for _, sleeps := range selectedSleepOnBeds {
		groupedSleepOnBeds[sleeps.DeviceID] = append(groupedSleepOnBeds[sleeps.DeviceID], sleeps)
	}

	for _, leaveBeds := range selectedLeaveBeds {
		groupedLeaveBeds[leaveBeds.DeviceID] = append(groupedLeaveBeds[leaveBeds.DeviceID], leaveBeds)
	}

	var currSleep, currLeave *schema.Event
	scanSleep, scanLeave := 0, 0
	var currAccumulator *sumData

	for bed, sleeps := range groupedSleepOnBeds {
		for i := scanSleep; i < len(sleeps); i++ {
			currSleep = sleeps[i]
			if currAccumulator == nil {
				currAccumulator = &sumData{
					DeviceID: currSleep.DeviceID,
					Sum:      0,
				}
			}

			if currLeave != nil {
				if currLeave.OccurredAt.After(currSleep.OccurredAt) {
					// find next currSleep if behind currLeave event
					continue
				}
			}

			for j := scanLeave; j < len(groupedLeaveBeds[bed]); j++ {
				currLeave = groupedLeaveBeds[bed][j]
				scanLeave = j
				if currLeave.OccurredAt.Before(currSleep.OccurredAt) {
					// find nearest currLeave after currentSleep
					continue
				}
				// calculate time difference when first post occurrence found
				currAccumulator.Sum += currLeave.OccurredAt.Sub(currSleep.OccurredAt).Seconds()
				break
			}
		}
		// aggregate previous sumData and continue accumulating with next bed
		sums = append(sums, *currAccumulator)
		currAccumulator = &sumData{
			DeviceID: currSleep.DeviceID,
			Sum:      0,
		}
		scanSleep, scanLeave = 0, 0
		currSleep, currLeave = nil, nil
	}

	return sums, nil
}


```