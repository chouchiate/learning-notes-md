## [go] - SQL

> generic SQL package

### sql.Named
* Named provides a more concise way to create NamedArg values.
![](https://cs.opensource.google/go/go/+/refs/tags/go1.19:src/database/sql/sql.go;l=110)
```go
db.ExecContext(ctx, `
    delete from Invoice
    where
        TimeCreated < @end
        and TimeCreated >= @start;`,
    sql.Named("start", startTime),
    sql.Named("end", endTime),
)
```

### Combine with GORM

```go
const realtimeAlertQuery = `
SELECT data_id, created_at, created_at as emitted_at, option, severity
FROM %[2]s as alert_table JOIN
	(
		SELECT id FROM %[1]s as data_table WHERE data_table.device_id IN (?) AND data_table.occurred_at >= @START
		 AND data_table.occurred_at < @END
	) AS data_table
ON alert_table.data_id = data_table.id
ORDER BY alert_table.created_at DESC
`

func (h *historyRepo) ListPatientFalldownAlerts(deviceIDs []uuid.UUID, startTime, endTime time.Time) ([]AlertData, error) {
	var records []AlertData
	if err := h.db.
		Raw(
			fmt.Sprintf(realtimeAlertQuery, "events", "falldown_alerts"), deviceIDs,
			sql.Named("START", startTime), sql.Named("END", endTime)).Scan(&records).Error; err != nil {
		return nil, err
	}
	return records, nil
}

```