## [pg] - create table insert data


### Create table with numeric columns (precise floating point)
```sql
CREATE TABLE Vehicles (
     Vehicle_ID int NOT NULL,
     Vehicle_Type VARCHAR(255) NOT NULL,
     Model_name VARCHAR(255) NOT NULL,
     Engine_Size int NOT NULL,
     Vehicle_Condition VARCHAR(255) NOT NULL,
     --price is numeric, not float, because the precision and scale are specified.
     Price numeric(9,2) NOT NULL,
     PRIMARY KEY (Vehicle_ID)
);
```

### 創建 random number table
```sql
DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id uuid,
    a integer,
    b integer,
)
```

### generate fake data
```sql
DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id uuid,
    a integer,
    b integer,
	PRIMARY KEY (id)
);

INSERT INTO test
SELECT
	gen_random_uuid() as id,
	floor(RANDOM() * 6) AS a,
	floor(RANDOM() * 5) AS b
FROM  generate_series(1,10) as id;
```

### 建立測試用 random data 100,000 筆, 3 種 patient_state, 6 種 patient_state_detail, occurred_at 範圍 (2022-01-10 10:00:00 ~ 2022-01-20 20:00:00)
```sql
DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id integer,
    device_id uuid,
    patient_state integer,
    patient_state_detail integer,
    occurred_at timestamp,
    PRIMARY KEY (id)
);

---
INSERT INTO test
SELECT
    id,
    gen_random_uuid() as device_id,
    floor(RANDOM() * 3) as patient_state,
    floor(RANDOM() * 6) as patient_state_detail,
    timestamp '2022-01-10 20:00:00' +
       random() * (timestamp '2022-01-20 20:00:00' -
                   timestamp '2022-01-10 10:00:00') as occurred_at

FROM generate_series(1, 100000) as id;
```

---
### create a events table with random event series for testing purposes
* 3 種 patient_state, 6 種 patient_state_detail
* more than one week of time series data
```sql
DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    device_id uuid,
	patient_state integer,
	patient_state_detail integer,
	occurred_at timestamp,
	count_of_events integer
);
---
INSERT INTO test
SELECT
	gen_random_uuid() as id,
	gen_random_uuid() as device_id,
	floor(RANDOM() * 3) as patient_state,
	floor(RANDOM() * 6) as paitnet_state_detail,
    timestamp '2022-01-10 20:00:00' +
       random() * (timestamp '2022-01-20 20:00:00' -
                   timestamp '2022-01-10 10:00:00') as occurred_at

FROM generate_series(1, 100000) as count_of_events;

```

```sql
INSERT INTO test
SELECT
    id,
    gen_random_uuid() as device_id,
    floor(RANDOM() * 1) as patient_state,
    floor(RANDOM() * 1) as patient_state_detail,
    timestamp '2022-01-15 10:00:00' +
       random() * (timestamp '2022-01-15 20:00:00' -
                   timestamp '2022-01-15 10:00:00') as occurred_at

FROM generate_series(1, 30000) as id;
```

### Generate random md5
```sql
SELECT generate_series(1,10) AS id, md5(random()::text) AS descr;
```

### 建立測試用 100,000 筆 random ts 給 21 個 user_id

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
```
