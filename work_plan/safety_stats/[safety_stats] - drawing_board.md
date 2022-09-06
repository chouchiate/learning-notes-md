## [JUSPACE-312] - 床墊統計資訊呈現 (([JUSPACE-272] - 住民跟未來野生人都關心的優先做))

### 評估需求合理性
* 根據 PM 或需求提出方的隻字片語，探索出真實的需求

* 向 stakeholders 簡述此任務的需求、目標、客戶價值等


---
### 系統設計-高層次的元件互動示意

> 此步將根據前一步對需求的理解來進一步思考 著重在清楚描述各「元件 (noun)」如何「互動 (verb)」

### API Design

* METHOD: GET
* API URLs:
  * `https://space.ngrk.health/api/statistics/{organizationID}/?start={RFC3339 timestamp}&end={RFC3339 timestamp}`
  * `https://space.ngrk.health/api/statistics/{patientID}/?start={RFC3339 timestamp}&end={RFC3339 timestamp}`


1. 夜間離床計算平均次數 (週)
    * 設計 Db Query: 從 events table select COUNT distinct patientId with patient state = 1 in time range (week).
        + repository.statistics.CountAwayFromBedWithinTimeIn(deviceIDs []*uuid.UUID, startAt, endAt time.Time)

2. 夜間臥床少於 6 小時 (週)
    * 設計 Db Query: 從 events table query
    * 從 events table select patient state = 0 列出每日睡眠時間
    * 從 events table select patient state = 2 || = 1 列出每日起床時間
    * 計算後回傳
        + repository.statistics.CountSleepLessThan(deviceIDs []*uuid.UUID, startAt, endAt time.Time)

3. 久臥超過三次
    * 設計 Db Query: 從 smartbed_delay_alerts 中 query
        + repository.statistics.CountLongLying(deviceIDs []*uuid.UUID, startAt, endAt time.Time)

4. 呼吸異常超過 6 次
    * 設計 Db Query: 從 breath_rate_alerts table query
        + repository.statistics.CountAbnormalBreathing(deviceIDs []*uuid.UUID, startAt, endAt time.Timer)

##### API Template
```json
Statistics: {
    "eveningAwayFromBedAvg": {
        "PatientID_1": 1,           // 次數
        "PatientID_2": 1,           // 次數
        "PatientID_5": 3,           // 次數

    },
    "eveningSleepLessThanAvg": {
        "PatientID_1": 2.5,         // 小時
        "PatientID_2": 1.3,         // 小時
        "PatientID_3": 4.8,         // 小時
    },
    "dailyLongLying": {
        "PatientID_1": 2,           // 次數
        "PatientID_2": 1,           // 次數
        "PatientID_6": 3,           // 次數
    },
    "dailyAbnormalBreath": {
        "PatientID_1": 4,           // 次數
        "PatientID_2": 2,           // 次數
        "PatientID_9": 3,           // 次數
    }
},
```

### networking 的路線圖
![](https://i.imgur.com/ZANjJ6S.png)
### data 的流向、資料的「讀」與「寫」路徑有清晰的分野



### 程式碼應添加哪些改動, 既有程式碼將會如何更動




### 系統設計-資料儲存示意

#### 設計選取 時間範圍內 設備空間住民清單, 含已搬遷/移房 (Many-toMany)
  * ListSpaceWithHistoricPatientDevice(orgID uuid.UUID, startAt, endAt time.Time)
  * 結合 spaces_v2, device_installed_in_spaces, patient_lived_spaces 產生
  * 輸出 []*SpacePatientDeviceRegistry inherit SpaceWithPatientDevice 含時間範圍:

##### Schema Structure
```go
type SpacePatientDeviceRegistry struct {
    SpaceWithPatientDevice,
    patientUpdatedAt, deviceUpdatedAt time.Time
    isLivingIn, isInstalledIn bool
}
```

##### SQL Query Design (Tested in DEV)
```sql
WITH device_installed_in_spaces_history AS (
	SELECT space_id, device_id, branch, room, bed, organization_id, dins.updated_at AS device_updated_at, is_installed_in
	FROM device_installed_in_spaces AS dins

	JOIN (
		SELECT * FROM spaces_v2 WHERE organization_id = 'f850d373-c326-4602-8b92-dba408302e47'-- 'b67fa1c4-1ec5-4bb1-84a4-0368235c10f0'
	) as organization_spaces
	ON dins.space_id = organization_spaces.id

	WHERE
	dins.updated_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-24 00:00:00' AND dins.is_installed_in IS FALSE   -- check un_installed event within query time range
	OR dins.is_installed_in IS TRUE
), patient_lived_in_spaces_history AS (
	SELECT patient_id, space_id , organization_id, first_name, last_name, pins.updated_at AS patient_updated_at, is_living_in
	FROM patient_lived_spaces AS pins
	JOIN patients_v2
	ON pins.patient_id = patients_v2.id
	AND organization_id = 'f850d373-c326-4602-8b92-dba408302e47'--'b67fa1c4-1ec5-4bb1-84a4-0368235c10f0'
	WHERE pins.space_id IN (
		SELECT space_id FROM device_installed_in_spaces_history
	)
	AND pins.updated_at BETWEEN '2022-08-15 00:00:00'
	AND '2022-08-24 00:00:00' AND pins.is_living_in IS FALSE -- check moved_out event within query time range
	OR pins.is_living_in IS TRUE
	ORDER BY pins.updated_at DESC
)
SELECT
	dsh.organization_id,
	dsh.device_id,
	dsh.space_id,
	psh.patient_id,
	psh.first_name,
	psh.last_name,
	psh.is_living_in,
	psh.patient_updated_at,
	dsh.is_installed_in,
	dsh.device_updated_at

FROM device_installed_in_spaces_history AS dsh
JOIN patient_lived_in_spaces_history AS psh
ON psh.space_id = dsh.space_id

```
##### EXPLAIN ANALYZE (Tested on DEV)
```sql
"Hash Join  (cost=308.61..312.47 rows=47 width=92) (actual time=7.373..7.476 rows=19 loops=1)"
"  Hash Cond: (pins.space_id = dsh.space_id)"
"  CTE device_installed_in_spaces_history"
"    ->  Hash Join  (cost=52.90..57.95 rows=23 width=65) (actual time=0.708..0.768 rows=17 loops=1)"
"          Hash Cond: (dins.space_id = spaces_v2.id)"
"          ->  Seq Scan on device_installed_in_spaces dins  (cost=0.00..4.73 rows=122 width=41) (actual time=0.023..0.060 rows=75 loops=1)"
"                Filter: (((updated_at >= '2022-08-15 00:00:00+00'::timestamp with time zone) AND (updated_at <= '2022-08-24 00:00:00+00'::timestamp with time zone) AND (is_installed_in IS FALSE)) OR (is_installed_in IS TRUE))"
"                Rows Removed by Filter: 38"
"          ->  Hash  (cost=48.60..48.60 rows=344 width=40) (actual time=0.668..0.669 rows=344 loops=1)"
"                Buckets: 1024  Batches: 1  Memory Usage: 33kB"
"                ->  Seq Scan on spaces_v2  (cost=0.00..48.60 rows=344 width=40) (actual time=0.014..0.538 rows=344 loops=1)"
"                      Filter: (organization_id = 'f850d373-c326-4602-8b92-dba408302e47'::uuid)"
"                      Rows Removed by Filter: 1464"
"  ->  Sort  (cost=249.91..250.43 rows=209 width=67) (actual time=6.550..6.578 rows=221 loops=1)"
"        Sort Key: pins.updated_at DESC"
"        Sort Method: quicksort  Memory: 56kB"
"        ->  Hash Join  (cost=123.65..241.86 rows=209 width=67) (actual time=3.433..6.353 rows=221 loops=1)"
"              Hash Cond: (pins.patient_id = patients_v2.id)"
"              ->  Seq Scan on patient_lived_spaces pins  (cost=0.52..113.31 rows=2058 width=41) (actual time=0.051..1.913 rows=1579 loops=1)"
"                    Filter: (((hashed SubPlan 2) AND (updated_at >= '2022-08-15 00:00:00+00'::timestamp with time zone) AND (updated_at <= '2022-08-24 00:00:00+00'::timestamp with time zone) AND (is_living_in IS FALSE)) OR (is_living_in IS TRUE))"
"                    Rows Removed by Filter: 2066"
"                    SubPlan 2"
"                      ->  CTE Scan on device_installed_in_spaces_history  (cost=0.00..0.46 rows=23 width=16) (actual time=0.001..0.005 rows=17 loops=1)"
"              ->  Hash  (cost=118.97..118.97 rows=333 width=26) (actual time=3.365..3.365 rows=333 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 28kB"
"                    ->  Seq Scan on patients_v2  (cost=0.00..118.97 rows=333 width=26) (actual time=0.016..3.225 rows=333 loops=1)"
"                          Filter: (organization_id = 'f850d373-c326-4602-8b92-dba408302e47'::uuid)"
"                          Rows Removed by Filter: 2945"
"  ->  Hash  (cost=0.46..0.46 rows=23 width=57) (actual time=0.804..0.804 rows=17 loops=1)"
"        Buckets: 1024  Batches: 1  Memory Usage: 10kB"
"        ->  CTE Scan on device_installed_in_spaces_history dsh  (cost=0.00..0.46 rows=23 width=57) (actual time=0.715..0.791 rows=17 loops=1)"
"Planning Time: 1.422 ms"
"Execution Time: 7.662 ms"
```


#### 設計 夜間離床計算平均次數 (週/日)
##### Schema Structure
```go

```
##### SQL Query Design (Tested in DEV)

```sql
SELECT device_id , COUNT(patient_state)
FROM events
WHERE device_id IN (    -- 模擬 SpacePatientDeviceRegistry Results
'3ab2cdd8-1f50-47f3-ab1a-856b95481305','488327c3-47d0-451b-b82b-4982c04988a8','de430736-4be5-409f-80fb-2afcd1b3b87e','36aae508-3f67-4e21-b76b-713753f8c280','2e7a4a78-ecb4-4fb2-98f2-ea62b9d7d8be','74d69e32-ed9c-4813-8d08-6c701c227936','efc326e3-0c8c-4601-9a51-50c6075f0a10','6a69d2c6-9cf0-4885-a791-2510260c1b0b','5a1ffb43-1311-43ca-ae84-6b99eaa4abe5'
)

AND occurred_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-22 00:00:00'
AND (EXTRACT(HOUR from events.occurred_at) >= 20 OR EXTRACT(HOUR FROM events.occurred_at) < 6)
AND events.patient_state = 1
GROUP BY device_id;
```
##### Query Results
```sql
"81e4dc66-972f-43b8-833f-3276310f2d3d"	10
"d8788976-cbd7-4b9a-9f77-318113b929ab"	4
```
##### EXPLAIN ANALYZE (Tested on DEV)
```sql
"GroupAggregate  (cost=1112.22..1113.20 rows=42 width=24) (actual time=0.209..0.213 rows=2 loops=1)"
"  Group Key: device_id"
"  ->  Sort  (cost=1112.22..1112.41 rows=75 width=20) (actual time=0.199..0.201 rows=14 loops=1)"
"        Sort Key: device_id"
"        Sort Method: quicksort  Memory: 26kB"
"        ->  Bitmap Heap Scan on events  (cost=40.48..1109.89 rows=75 width=20) (actual time=0.086..0.184 rows=14 loops=1)"
"              Recheck Cond: ((device_id = ANY ('{81e4dc66-972f-43b8-833f-3276310f2d3d,d8788976-cbd7-4b9a-9f77-318113b929ab,7d75fe04-47f3-49ac-b187-d8717de7c9f5,14957446-297e-4140-a762-698505c42649,6a4056ea-a288-4a09-a30f-775c52112cd8,8b92eb0c-7a5e-4306-8b49-41a11550fc07,f8a8ddb8-31ea-44c1-bd52-8eabcce0dfb2,79c34af8-f799-4a4d-a7cb-1ab6202447fe}'::uuid[])) AND (occurred_at >= '2022-08-15 00:00:00+00'::timestamp with time zone) AND (occurred_at <= '2022-08-22 00:00:00+00'::timestamp with time zone))"
"              Filter: ((patient_state = 1) AND ((date_part('hour'::text, occurred_at) >= '20'::double precision) OR (date_part('hour'::text, occurred_at) < '6'::double precision)))"
"              Rows Removed by Filter: 75"
"              Heap Blocks: exact=16"
"              ->  Bitmap Index Scan on idx_events_device_id_occurred_at  (cost=0.00..40.46 rows=410 width=0) (actual time=0.067..0.068 rows=89 loops=1)"
"                    Index Cond: ((device_id = ANY ('{81e4dc66-972f-43b8-833f-3276310f2d3d,d8788976-cbd7-4b9a-9f77-318113b929ab,7d75fe04-47f3-49ac-b187-d8717de7c9f5,14957446-297e-4140-a762-698505c42649,6a4056ea-a288-4a09-a30f-775c52112cd8,8b92eb0c-7a5e-4306-8b49-41a11550fc07,f8a8ddb8-31ea-44c1-bd52-8eabcce0dfb2,79c34af8-f799-4a4d-a7cb-1ab6202447fe}'::uuid[])) AND (occurred_at >= '2022-08-15 00:00:00+00'::timestamp with time zone) AND (occurred_at <= '2022-08-22 00:00:00+00'::timestamp with time zone))"
"Planning Time: 0.487 ms"
"Execution Time: 0.490 ms"
```

#### 設計 夜間臥床少於 6 小時 (週 / 日)
##### Schema Structure
```go

```
##### SQL Query Design (Tested in DEV)
```sql
-- EXPLAIN ANALYZE

WITH RECURSIVE
selected_sleep_on_bed AS
(
	SELECT *
	FROM events
	WHERE
	occurred_at BETWEEN '2022-08-24 00:00:00' AND '2022-08-31 00:00:00'
	AND (EXTRACT(HOUR from events.occurred_at) >= 20 OR EXTRACT(HOUR FROM events.occurred_at) < 6)
	AND (events.patient_state = 0)
	AND
	device_id IN
	(    -- 模擬 SpacePatientDeviceRegistry Results
		'091a97cf-eb30-4605-939f-ee2901665688'
	)
	ORDER BY device_id, occurred_at DESC
),
selected_leave_bed AS
(
	SELECT *
	FROM events
	WHERE
	occurred_at BETWEEN '2022-08-24 00:00:00' AND '2022-08-31 00:00:00'
	AND (EXTRACT(HOUR from events.occurred_at) >= 20 OR EXTRACT(HOUR FROM events.occurred_at) < 6)
	AND (events.patient_state = 1)
	AND
	device_id IN
	(    -- 模擬 SpacePatientDeviceRegistry Results
		'091a97cf-eb30-4605-939f-ee2901665688'
	)
	ORDER BY device_id, occurred_at DESC
),
final_results AS (
	(
 		SELECT
		lb.id AS leave_id,
		sob.id AS sleep_id,
		lb.device_id,
		lb.patient_state AS leave_ps,
		sob.patient_state AS sleep_ps,
		lb.occurred_at AS leave_occurred_at,
		sob.occurred_at AS sleep_occurred_at,
		EXTRACT(EPOCH FROM(lb.occurred_at - sob.occurred_at)) AS diff
		FROM selected_leave_bed AS lb
		LEFT JOIN selected_sleep_on_bed as sob
		ON lb.device_id = sob.device_id
 		WHERE lb.occurred_at > sob.occurred_at
		LIMIT 1

	) -- seed query for recursive union all
	UNION ALL
	SELECT iterative_result.* FROM final_results, LATERAL
	(
		SELECT
		lb.id AS leave_id,
		sob.id AS sleep_id,
		lb.device_id,
		lb.patient_state AS leave_ps,
		sob.patient_state AS sleep_ps,
		lb.occurred_at AS leave_occurred_at,
		sob.occurred_at AS sleep_occurred_at,
		EXTRACT(EPOCH FROM(lb.occurred_at - sob.occurred_at)) AS diff
		FROM selected_leave_bed AS lb
		LEFT JOIN selected_sleep_on_bed as sob
		ON lb.device_id = sob.device_id
 		WHERE
		lb.occurred_at < final_results.leave_occurred_at
		AND lb.occurred_at < final_results.sleep_occurred_at
		AND sob.occurred_at < final_results.sleep_occurred_at
		AND lb.occurred_at > sob.occurred_at
		LIMIT 1

	) AS iterative_result
)

SELECT
 *
--  	SUM(device_id)

FROM final_results AS sase


```
##### EXPLAIN ANALYZE (Tested on DEV)
```sql
"CTE Scan on final_results sase  (cost=50797.85..50799.87 rows=101 width=80) (actual time=384.600..910.992 rows=2544 loops=1)"
"  CTE selected_sleep_on_bed"
"    ->  Gather Merge  (cost=23973.24..24637.12 rows=5690 width=52) (actual time=39.857..41.693 rows=5168 loops=1)"
"          Workers Planned: 2"
"          Workers Launched: 2"
"          ->  Sort  (cost=22973.22..22980.33 rows=2845 width=52) (actual time=20.209..20.413 rows=1723 loops=3)"
"                Sort Key: events.occurred_at DESC"
"                Sort Method: quicksort  Memory: 556kB"
"                Worker 0:  Sort Method: quicksort  Memory: 154kB"
"                Worker 1:  Sort Method: quicksort  Memory: 162kB"
"                ->  Parallel Seq Scan on events  (cost=0.00..22810.00 rows=2845 width=52) (actual time=0.020..19.470 rows=1723 loops=3)"
"                      Filter: ((occurred_at >= '2022-08-24 00:00:00'::timestamp without time zone) AND (occurred_at <= '2022-08-31 00:00:00'::timestamp without time zone) AND (patient_state = 0) AND (device_id = '091a97cf-eb30-4605-939f-ee2901665688'::uuid) AND ((date_part('hour'::text, occurred_at) >= '20'::double precision) OR (date_part('hour'::text, occurred_at) < '6'::double precision)))"
"                      Rows Removed by Filter: 331611"
"  CTE selected_leave_bed"
"    ->  Gather Merge  (cost=23972.79..24635.04 rows=5676 width=52) (actual time=344.711..346.440 rows=5021 loops=1)"
"          Workers Planned: 2"
"          Workers Launched: 2"
"          ->  Sort  (cost=22972.77..22979.86 rows=2838 width=52) (actual time=261.618..261.791 rows=1674 loops=3)"
"                Sort Key: events_1.occurred_at DESC"
"                Sort Method: quicksort  Memory: 485kB"
"                Worker 0:  Sort Method: quicksort  Memory: 207kB"
"                Worker 1:  Sort Method: quicksort  Memory: 208kB"
"                ->  Parallel Seq Scan on events events_1  (cost=0.00..22810.00 rows=2838 width=52) (actual time=2.875..259.535 rows=1674 loops=3)"
"                      Filter: ((occurred_at >= '2022-08-24 00:00:00'::timestamp without time zone) AND (occurred_at <= '2022-08-31 00:00:00'::timestamp without time zone) AND (patient_state = 1) AND (device_id = '091a97cf-eb30-4605-939f-ee2901665688'::uuid) AND ((date_part('hour'::text, occurred_at) >= '20'::double precision) OR (date_part('hour'::text, occurred_at) < '6'::double precision)))"
"                      Rows Removed by Filter: 331660"
"  CTE final_results"
"    ->  Recursive Union  (cost=0.00..1525.69 rows=101 width=80) (actual time=384.585..909.137 rows=2544 loops=1)"
"          ->  Limit  (cost=0.00..15.01 rows=1 width=80) (actual time=384.583..384.585 rows=1 loops=1)"
"                ->  Nested Loop  (cost=0.00..807850.56 rows=53827 width=80) (actual time=384.582..384.583 rows=1 loops=1)"
"                      Join Filter: ((lb.occurred_at > sob.occurred_at) AND (lb.device_id = sob.device_id))"
"                      Rows Removed by Join Filter: 1"
"                      ->  CTE Scan on selected_leave_bed lb  (cost=0.00..113.52 rows=5676 width=44) (actual time=344.712..344.712 rows=1 loops=1)"
"                      ->  CTE Scan on selected_sleep_on_bed sob  (cost=0.00..113.80 rows=5690 width=44) (actual time=39.860..39.861 rows=2 loops=1)"
"          ->  Nested Loop  (cost=0.00..150.87 rows=10 width=80) (actual time=0.204..0.204 rows=1 loops=2544)"
"                ->  WorkTable Scan on final_results  (cost=0.00..0.20 rows=10 width=16) (actual time=0.000..0.000 rows=1 loops=2544)"
"                ->  Limit  (cost=0.00..15.05 rows=1 width=80) (actual time=0.204..0.204 rows=1 loops=2544)"
"                      ->  Nested Loop  (cost=0.00..90008.96 rows=5982 width=80) (actual time=0.204..0.204 rows=1 loops=2544)"
"                            Join Filter: ((lb_1.occurred_at > sob_1.occurred_at) AND (lb_1.device_id = sob_1.device_id))"
"                            Rows Removed by Join Filter: 1"
"                            ->  CTE Scan on selected_leave_bed lb_1  (cost=0.00..141.90 rows=1892 width=44) (actual time=0.101..0.101 rows=1 loops=2544)"
"                                  Filter: ((occurred_at < final_results.leave_occurred_at) AND (occurred_at < final_results.sleep_occurred_at))"
"                                  Rows Removed by Filter: 2547"
"                            ->  CTE Scan on selected_sleep_on_bed sob_1  (cost=0.00..128.03 rows=1897 width=44) (actual time=0.101..0.102 rows=2 loops=2543)"
"                                  Filter: (occurred_at < final_results.sleep_occurred_at)"
"                                  Rows Removed by Filter: 2574"
"Planning Time: 2.430 ms"
"Execution Time: 913.854 ms"
```

#### 設計 久臥超過三次 (週 / 日)
##### Schema Structure
```go

```
##### SQL Query Design (Tested in DEV)
```sql
WITH long_lying_events AS (
	SELECT
		sba.data_id,
		events.device_id,
		sba.option,
		sba.created_at AS emitted_at

	FROM smartbed_alerts AS sba

	LEFT JOIN events
	ON sba.data_id = events.id

	WHERE sba.option = 'longLying' AND
		events.device_id IN @DEVICE_IDS

	UNION

	SELECT
		sbda.data_id,
		sbda.device_id,
		sbda.option,
		sbda.emitted_at
	FROM smartbed_delay_alerts AS sbda
	WHERE sbda.option = 'longLying' AND sbda.emitted_at IS NOT NULL
	AND sbda.device_id IN @DEVICE_IDS
)

SELECT
	device_id,
	COUNT(device_id)
FROM long_lying_events
WHERE emitted_at BETWEEN '%[1]s' AND '%[2]s'
GROUP BY device_id
```
##### EXPLAIN ANALYZE (Tested on DEV)
```sql

```

#### 設計 呼吸異常超過 6 次 (週 / 日)
##### Schema Structure
```go

```
##### SQL Query Design (Tested in DEV)
```sql

```
##### EXPLAIN ANALYZE (Tested on DEV)
```sql

```

### 系統設計-程式碼介面 (interface) 設計


### 具體實作階段 (Pair programming)

#### 持續同步實作細節方向的變化


#### 避免決策疲乏


### 完成階段 (Code Review)

#### 向 stakeholders 簡述完成了什麼

