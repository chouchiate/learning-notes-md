### 讀取 Table 所有的 Index

```sql
SELECT
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    tablename = 'detections';
```

### 讀取 'c' 開頭名稱 Table 的所有 Index
```sql
SELECT
    tablename,
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    tablename LIKE 'c%'
ORDER BY
    tablename,
    indexname;
```

### 刪除 Table 的 Index
```sql
DROP INDEX title_idx;
```

### 建立 composite index 在 detection table 的 device_id, box_device_id, patient_id 和 updated_at DESC 排序
```sql
CREATE INDEX idx_composite ON detections (device_id, box_device_id, patient_id, updated_at DESC);
```

### 建立 Random Series Test Table
```sql
DROP TABLE IF EXISTS test;
CREATE TABLE IF NOT EXISTS test (
	id integer,
	group_id text,
	ts float,
	PRIMARY KEY (id)
);
---
INSERT INTO test
SELECT
	id,
	floor(random() * 21) + 1 as group_id,
	random() * id as ts
FROM generate_series(1, 100000) as id;
```
### 使用 EXPLAIN 分析 Query 效能
* [圖形顯示](https://explain.dalibo.com/plan/vaJ)
```sql
                                    QUERY PLAN
---------------------------------------------------------------------------------
Sort  (cost=3568329.64..3568329.90 rows=101 width=642)
  Sort Key: res.device_id, res.occurred_at DESC
  CTE res
    ->  Recursive Union  (cost=34551.87..3568324.26 rows=101 width=1101)
          ->  Limit  (cost=34551.87..34551.99 rows=1 width=1101)
                ->  Gather Merge  (cost=34551.87..56484.41 rows=187980 width=1101)
                      Workers Planned: 2
                      ->  Sort  (cost=33551.85..33786.82 rows=93990 width=1101)
                            Sort Key: detections.device_id, detections.occurred_at DESC
                            ->  Parallel Seq Scan on detections  (cost=0.00..33081.90 rows=93990 width=1101)
          ->  Nested Loop  (cost=35337.66..353377.02 rows=10 width=1101)
                ->  WorkTable Scan on res res_1  (cost=0.00..0.20 rows=10 width=16)
                ->  Limit  (cost=35337.66..35337.66 rows=1 width=1101)
                      ->  Sort  (cost=35337.66..35525.64 rows=75192 width=1101)
                            Sort Key: base.device_id, base.occurred_at DESC
                            ->  Seq Scan on detections base  (cost=0.00..34961.70 rows=75192 width=1101)
                                  Filter: (device_id > res_1.device_id)
  ->  CTE Scan on res  (cost=0.00..2.02 rows=101 width=642)
```

### `WITH` query 與 `WITH RECURSIVE` query 的差別
***`WITH` query***
`WITH` query 用來產生暫時的 table(s)，輔助主要 query 的查詢。

:::info:information_source: `WITH` quries 在官方文件中又稱為 **Common Table Expression (CTE)**。以下會使用 CTE 來表示一段會輸出 temporary table 的語句。
:::
```sql=
WITH regional_sales AS (
    SELECT region, SUM(amount) AS total_sales
    FROM orders
    GROUP BY region
), top_regions AS (
    SELECT region
    FROM regional_sales
    WHERE total_sales > (SELECT SUM(total_sales)/10 FROM regional_sales)
)
SELECT region,
       product,
       SUM(quantity) AS product_units,
       SUM(amount) AS product_sales
FROM orders
WHERE region IN (SELECT region FROM top_regions)
GROUP BY region, product;
```

***`WITH RECURSIVE` query***

而 `WITH RECURSIVE` query 的目的也是產生一個 temporary table，**但運作原理是採用迭代的方式**。語法為：
```sql
WITH RECURSIVE cte_name AS (
    CTE_query_non_recursive -- non-recursive term
    UNION [ALL]
    CTE_query_recursive     -- recursive term
)
SELECT *
FROM cte_name;
```

***`LATERAL` subquery***

而 `LATERAL` subquery 則是 for loop 一張 outer-table 的 rows，並在迭代中執行 subquery，最後將每一個 subquery 的結果與 outer-table 的 row JOIN 起來。

*(完整的例子可參考 [Understanding LATERAL joins in PostgreSQL](https://www.cybertec-postgresql.com/en/understanding-lateral-joins-in-postgresql/))*

`LATERAL` subquery 會 loop `t_wishlist` 每一個 row 作為參考，執行 `LATERAL (...)` 內的 subquery。所以以此例來說 LATERAL 內的 subquery 會被執行 3 次，每次執行時 `w.desired_price` 參考到的值分別是 450, 60 與 1500。

## 維護性更佳的實務建議

**以「撈出每一個組別最新的資料」這個需求來說**
是否有更好的 schema/table design 來避開使用 `DISTINCT ON`、或上述維護性較差的語法來 query？是否能避免 OLTP 系統有大海撈針的行為？

:::success
> You probably don't want to hear this, but the best option to speed up `SELECT DISTINCT` is to **avoid** `DISTINCT` to begin with. In many cases (not all!) it can be avoided with ***better database-design*** or ***better queries***.


*Erwin Brandstetter, [How to speed up select distinct?](https://dba.stackexchange.com/a/93159)*
:::

- 針對 `latest_records` 加 cache layer
    - 但還是得記得考慮是否有 cache penetration, cache avalanche 與 cache stampede 的問題 ([good overview article](https://kkc.github.io/2020/03/27/cache-note/))
- 剖析需求，加入適當的 `WHERE`/`LIMIT`/`OFFSET` 條件來避免存取不必要的資料

:::info
:information_source: [OLAP vs. OLTP: What’s the Difference?](https://www.ibm.com/cloud/blog/olap-vs-oltp)
我們的商業模式雖然不是 B2C、流量也還不大，但就性質上應比較接近 OLTP、而非 OLAP。故我們仍然要對 query 讀取效率有較高的自我要求。
:::

###
 * PostgreSQL provides the index methods B-tree, hash, GiST, SP-GiST, and GIN. Users can also define their own index methods, but that is fairly complicated.

#### B-tree



#### Hash


#### GiST


#### SP-GiST



#### GIN

#### Create Index
  * create index for table detections at column device_id with name idx_detection_d_id
```sql
  CREATE INDEX idx_detections_d_id ON detections (device_id);
```

```sql
CREATE INDEX idx_detections_d_id
     ON public.detections USING btree
	 (device_id ASC NULLS LAST)
     TABLESPACE pg_default;
```
