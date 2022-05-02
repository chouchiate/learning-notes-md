## [pg] - create table insert data



### 建立測試用 100,000 筆, 3 種 patient_state, 6 種 patient_state_detail,
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
