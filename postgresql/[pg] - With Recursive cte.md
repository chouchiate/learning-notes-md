## [pg] - WITH RECURSIVE (Common Table Expression)

###




### WITH QUERY and TIMESTAMP TIMEZONE RANGE type with night shift intersection
```sql
WITH night_shifts AS (
	SELECT TSTZRANGE('2022-08-15 00:00:00', '2022-08-22 00:00:00') *
	TSTZRANGE('2022-08-15 00:00:00'::date + time '23:00', '2022-08-22 00:00:00'::date + time '06:00')
)
SELECT
	device_id,
	COUNT(patient_state)
FROM events
WHERE patient_state = 1 AND device_id = '0025656b-f320-4daa-ab2f-16c2ae9aed84'

GROUP BY device_id


```