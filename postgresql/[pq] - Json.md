## [pqsql] - Handling JSON & JSONb

[doc](https://www.postgresql.org/docs/9.4/functions-json.html)

#### Query / Select Data inside JSON

* detail JSON
```json
{
  "status": 4,
  "heartRate": 0,
  "respiratoryRate": 0
}
```

```sql
SELECT *
	FROM public.detections
	WHERE box_device_id LIKE 'wis%'
	AND detail->>'status' = '4'
	AND detail->>'heartRate' = '0'
	ORDER BY occurred_at LIMIT 100;
```

