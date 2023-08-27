## 建立測試 Table


####

```sql
  DROP TABLE IF EXISTS test;
  CREATE TABLE test (
    id integer,
    user_id text,
    ts float,
    PRIMARY KEY (id)
  );
  ---
  INSERT INTO test
  SELECT 
    id, 
    floor(RANDOM() * 21) + 1 as user_id,
    RANDOM() * id as ts
  FROM generate_series(1, 1000000) as id;
  /*
  最多 21 個 user_id
  總共 1000000 個資料點
  */
  ---
  SELECT * 
  FROM test
  LIMIT 10
```


#### How to query distinct id's largest/latest row
  * try DISTINCT keyword
```sql
EXPLAIN ANALYZE
SELECT DISTINCT ON (user_id) *
FROM test
ORDER BY user_id ASC, ts DESC
/*
找出每個 user_id 中，最大的 ts 的那筆 record
大約 7000ms

[[ Query Plan ]]
"Unique  (cost=132154.34..137154.34 rows=21 width=14) (actual time=6307.757..7013.374 rows=21 loops=1)"
"  ->  Sort  (cost=132154.34..134654.34 rows=1000000 width=14) (actual time=6307.754..6933.987 rows=1000000 loops=1)"
"        Sort Key: user_id, ts DESC"
"        Sort Method: external merge  Disk: 25496kB"
"        ->  Seq Scan on test  (cost=0.00..15406.00 rows=1000000 width=14) (actual time=0.025..58.021 rows=1000000 loops=1)"
"Planning Time: 2.075 ms"
"JIT:"
"  Functions: 1"
"  Options: Inlining false, Optimization false, Expressions true, Deforming true"
"  Timing: Generation 0.232 ms, Inlining 0.000 ms, Optimization 0.113 ms, Emission 2.193 ms, Total 2.538 ms"
"Execution Time: 7023.005 ms"
*/
```

```sql
/*
"Unique  (cost=132154.34..137154.34 rows=21 width=14) (actual time=2255.270..3007.997 rows=21 loops=1)"
"  ->  Sort  (cost=132154.34..134654.34 rows=1000000 width=14) (actual time=2255.267..2900.312 rows=1000000 loops=1)"
"        Sort Key: user_id, ts DESC"
"        Sort Method: external merge  Disk: 25496kB"
"        ->  Seq Scan on test  (cost=0.00..15406.00 rows=1000000 width=14) (actual time=0.011..100.401 rows=1000000 loops=1)"
"Planning Time: 0.197 ms"
"Execution Time: 3013.220 ms"
*/
```
