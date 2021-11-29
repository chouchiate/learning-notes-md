** [pg] - optimization

## TL;DR - 優化 mview `detections_latest` 中最慢的 SQL query part

```sql
-- EXPLAIN
WITH RECURSIVE res AS (
   (  -- parentheses required
   SELECT d.*
   FROM   detections as d
   ORDER  BY d.box_device_id ASC, d.occurred_at DESC
   LIMIT  1
   )
   UNION ALL
   SELECT inner_loop.*
   FROM   res
   , LATERAL (
      SELECT d.*
      FROM   detections as d
      WHERE  d.box_device_id > res.box_device_id  -- lateral reference
      ORDER  BY d.box_device_id ASC, d.occurred_at DESC
      LIMIT  1
      ) inner_loop
)
SELECT *
FROM   res
ORDER BY occurred_at
```

# 如何找出每一個組別中，最新/最大的那筆數據？

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

## 普遍的解答

- `DISTINCT ON` (or GROUP BY)

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

## 第一次優化體驗：using composite index

```sql
CREATE INDEX idx_composite_user_id_ts ON test (user_id ASC, ts DESC);
---
EXPLAIN ANALYZE
SELECT DISTINCT ON (user_id) *
FROM test
ORDER BY user_id ASC, ts DESC
/*
Query plan 變成僅需要使用 Index Scan 就能定位到需要的 rows
大約 1000 ms

[[ Query Plan ]]
"Unique  (cost=0.42..54513.38 rows=21 width=14) (actual time=2.332..1117.640 rows=21 loops=1)"
"  ->  Index Scan using idx_composite_user_id_ts on test  (cost=0.42..52013.38 rows=1000000 width=14) (actual time=2.330..1010.092 rows=1000000 loops=1)"
"Planning Time: 14.841 ms"
"Execution Time: 1117.971 ms"
*/
```

## 進階優化技巧：

```sql
EXPLAIN ANALYZE
WITH RECURSIVE res AS (
	(SELECT * FROM test ORDER BY user_id ASC, ts DESC LIMIT 1)
	UNION ALL
	SELECT inner_loop.* FROM res, LATERAL (
		SELECT * FROM test AS next_itr
		WHERE next_itr.user_id > res.user_id
		ORDER BY next_itr.user_id ASC, next_itr.ts DESC
		LIMIT 1
	) inner_loop
)
SELECT *
FROM res
ORDER BY user_id ASC, ts DESC
/*
大約 0.5 ms 就執行完了，瓜張

[[ Query Plan ]]
"Sort  (cost=64.15..64.40 rows=101 width=44) (actual time=0.474..0.476 rows=21 loops=1)"
"  Sort Key: res.user_id, res.ts DESC"
"  Sort Method: quicksort  Memory: 25kB"
"  CTE res"
"    ->  Recursive Union  (cost=0.42..58.77 rows=101 width=14) (actual time=0.016..0.457 rows=21 loops=1)"
"          ->  Limit  (cost=0.42..0.48 rows=1 width=14) (actual time=0.016..0.016 rows=1 loops=1)"
"                ->  Index Scan using idx_composite_user_id_ts on test  (cost=0.42..52013.38 rows=1000000 width=14) (actual time=0.015..0.015 rows=1 loops=1)"
"          ->  Nested Loop  (cost=0.42..5.63 rows=10 width=14) (actual time=0.020..0.020 rows=1 loops=21)"
"                ->  WorkTable Scan on res res_1  (cost=0.00..0.20 rows=10 width=32) (actual time=0.000..0.000 rows=1 loops=21)"
"                ->  Limit  (cost=0.42..0.52 rows=1 width=14) (actual time=0.019..0.019 rows=1 loops=21)"
"                      ->  Index Scan using idx_composite_user_id_ts on test next_itr  (cost=0.42..32569.59 rows=333333 width=14) (actual time=0.019..0.019 rows=1 loops=21)"
"                            Index Cond: (user_id > res_1.user_id)"
"  ->  CTE Scan on res  (cost=0.00..2.02 rows=101 width=44) (actual time=0.017..0.463 rows=21 loops=1)"
"Planning Time: 0.349 ms"
"Execution Time: 0.507 ms"
*/
```

## Postgres 關鍵功能

### `LATERAL` Subqueries

- [7.2.1.5. LATERAL Subqueries](https://www.postgresql.org/docs/13/queries-table-expressions.html) - official doc
- [Understanding LATERAL joins in PostgreSQL](https://www.cybertec-postgresql.com/en/understanding-lateral-joins-in-postgresql/) - CYBERTEC blog
- NOTE: 用前一張表的 result set 當作 A results，然後以 A results 的 row 來 loop LATERAL 後面的那張表，最後再將結果 JOIN 起來

### `WITH RECURSIVE` CTE(Common Table Expressions)

- [7.8.1. SELECT in WITH](https://www.postgresql.org/docs/13/queries-with.html#QUERIES-WITH-SELECT): **Recursive Query Evaluation** - official doc
- [Learn PostgreSQL Recursive Query By Example](https://www.postgresqltutorial.com/postgresql-recursive-query/) - PostgreSQL tutorial

## Practical recommendation

- 對於前端需要取得最新狀態資訊的需求
    - app 在 write data 階段就將最新資料單獨儲存在另一張 latest_table
        - 觀念跟 materialized view 類似，都是一種 materialization 的手段
        - 但我們改變 update data 的時機，避免從大 table 做 re-computation 的操作
    - app 在 read 階段就直接從 latest_table 取資料就好
    - 可再針對 latest_table 做一層 cache (單純 in-memory 或 external memorystore，取決於應用情境的需求與限制條件)，來保證 UI/UX 對效能的要求

# Reference

Postgres `EXPLAIN` explained

- [Chapter 14. Performance Tips: 14.1. Using `EXPLAIN`](https://www.postgresql.org/docs/current/using-explain.html)
- [Reading a Postgres EXPLAIN ANALYZE Query Plan](https://thoughtbot.com/blog/reading-an-explain-analyze-query-plan) ([中譯](https://www.jianshu.com/p/10fe35fac2b0))
- [PgSQL · 最佳实践 · EXPLAIN 使用浅析](http://mysql.taobao.org/monthly/2018/11/06/)

Postgresql's loose index scan

- [https://wiki.postgresql.org/wiki/Loose_indexscan](https://wiki.postgresql.org/wiki/Loose_indexscan)

Stackoverflow 相關討論

- [https://stackoverflow.com/questions/3800551/select-first-row-in-each-group-by-group/7630564#7630564](https://stackoverflow.com/questions/3800551/select-first-row-in-each-group-by-group/7630564#7630564)
- [https://stackoverflow.com/questions/25536422/optimize-group-by-query-to-retrieve-latest-row-per-user/25536748#25536748](https://stackoverflow.com/questions/25536422/optimize-group-by-query-to-retrieve-latest-row-per-user/25536748#25536748)

PostgreSQL execution plan visualizer

- [https://explain.dalibo.com/](https://explain.dalibo.com/)