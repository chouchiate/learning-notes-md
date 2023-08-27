## [pg] - TIMESTAMP functions

```sql
-- table_arrival
id	departure	arrival
1	2018-03-25 12:00:00	2018-04-05 07:30:00
2	2019-09-12 15:50:00	2019-10-23 10:30:30
3	2018-07-14 16:15:00	2018-07-14 20:40:30
4	2018-01-05 08:35:00	2019-01-08 14:00:00
```

### difference in days, hours, minutes, and seconds
```sql
SELECT
  id,
  departure,
  arrival,
  arrival - departure AS difference
FROM travel;
```

### difference in years, months, days, hours, minutes, and seconds
```sql
SELECT
  id,
  departure,
  arrival,
  AGE(arrival, departure) AS difference
FROM travel;
```


### difference in seconds
```sql
SELECT
  id,
  departure,
  arrival,
  EXTRACT(EPOCH FROM (arrival - departure)) AS difference
FROM travel;
```