## [pg] - inner join three table


### first of all, we create subquery and make sure it works
```sql
SELECT
u1.id as user_id, u1.organization_id,
u_p_s.notify_is_enabled, u_p_s.notify_is_repeated, u_p_s.notify_resend_interval


FROM users u1
INNER JOIN  user_preferences u_p_s
ON u1.id = u_p_s.user_id
ORDER BY u1.id;
```

### Then we work on the outer query to make sure it works

```sql
SELECT
DISTINCT d1.id as device_id,
d1.device_model_name,
p1.notify_is_enabled,
p1.notify_is_repeated,
p1.notify_resend_interval
FROM devices_v2 d1
INNER JOIN (
	SELECT
	u1.id as user_id, u1.organization_id,
	u_p_s.notify_is_enabled, u_p_s.notify_is_repeated, u_p_s.notify_resend_interval


	FROM users u1
	INNER JOIN  user_preferences u_p_s
	ON u1.id = u_p_s.user_id
	ORDER BY u1.id
) p1
ON p1.organization_id = uuid(d1.organization_id)
ORDER BY d1.device_model_name;

```

### check with EXPLAIN
```sql
-- query plan
"Unique  (cost=7.49..7.51 rows=1 width=78)"
"  ->  Sort  (cost=7.49..7.50 rows=1 width=78)"
"        Sort Key: d1.id, d1.organization_id, u_p_s.notify_is_enabled, u_p_s.notify_is_repeated, u_p_s.notify_resend_interval"
"        ->  Hash Join  (cost=7.16..7.48 rows=1 width=78)"
"              Hash Cond: (u1.organization_id = (d1.organization_id)::uuid)"
"              ->  Sort  (cost=4.32..4.38 rows=21 width=42)"
"                    Sort Key: u1.id"
"                    ->  Hash Join  (cost=1.47..3.86 rows=21 width=42)"
"                          Hash Cond: (u1.id = u_p_s.user_id)"
"                          ->  Seq Scan on users u1  (cost=0.00..2.30 rows=30 width=32)"
"                          ->  Hash  (cost=1.21..1.21 rows=21 width=26)"
"                                ->  Seq Scan on user_preferences u_p_s  (cost=0.00..1.21 rows=21 width=26)"
"              ->  Hash  (cost=2.83..2.83 rows=1 width=68)"
"                    ->  Seq Scan on devices_v2 d1  (cost=0.00..2.83 rows=1 width=68)"
"                          Filter: (device_model_name = '8CAAB5A12CB8'::text)"

```


### check with EXPLAIN ANALYZE
```sql
-- query plan
"Unique  (cost=8.76..9.03 rows=18 width=41) (actual time=1.285..1.378 rows=91 loops=1)"
"  ->  Sort  (cost=8.76..8.80 rows=18 width=41) (actual time=1.284..1.305 rows=183 loops=1)"
"        Sort Key: d1.device_model_name, d1.id, u_p_s.notify_is_enabled, u_p_s.notify_is_repeated, u_p_s.notify_resend_interval"
"        Sort Method: quicksort  Memory: 41kB"
"        ->  Hash Join  (cost=7.81..8.38 rows=18 width=41) (actual time=0.288..0.511 rows=183 loops=1)"
"              Hash Cond: (u1.organization_id = (d1.organization_id)::uuid)"
"              ->  Sort  (cost=4.32..4.38 rows=21 width=42) (actual time=0.153..0.159 rows=30 loops=1)"
"                    Sort Key: u1.id"
"                    Sort Method: quicksort  Memory: 27kB"
"                    ->  Hash Join  (cost=1.47..3.86 rows=21 width=42) (actual time=0.113..0.138 rows=30 loops=1)"
"                          Hash Cond: (u1.id = u_p_s.user_id)"
"                          ->  Seq Scan on users u1  (cost=0.00..2.30 rows=30 width=32) (actual time=0.004..0.010 rows=32 loops=1)"
"                          ->  Hash  (cost=1.21..1.21 rows=21 width=26) (actual time=0.021..0.021 rows=30 loops=1)"
"                                Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"                                ->  Seq Scan on user_preferences u_p_s  (cost=0.00..1.21 rows=21 width=26) (actual time=0.005..0.011 rows=30 loops=1)"
"              ->  Hash  (cost=2.66..2.66 rows=66 width=68) (actual time=0.116..0.117 rows=71 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 16kB"
"                    ->  Seq Scan on devices_v2 d1  (cost=0.00..2.66 rows=66 width=68) (actual time=0.009..0.025 rows=71 loops=1)"
"Planning Time: 0.261 ms"
"Execution Time: 1.452 ms"

```