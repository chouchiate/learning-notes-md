# SQL_WORK_IN_PROGRESS


## ListSpaceWithHistoricPatientDevice

---
### With Device Installed in Space in period of Time
> 取已搬遷物件和仍安裝物件 在時間範圍內 單一公司
* inputs
  * orgID,
  * startAt
  * endAt

```sql
SELECT space_id, device_id, branch, room, bed, organization_id, dins.updated_at AS device_updated_at, is_installed_in
FROM device_installed_in_spaces AS dins

JOIN (
	SELECT * FROM spaces_v2 WHERE organization_id = 'b67fa1c4-1ec5-4bb1-84a4-0368235c10f0'
) as organization_spaces
ON dins.space_id = organization_spaces.id

WHERE
dins.updated_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-22 00:00:00' AND dins.is_installed_in IS FALSE
OR dins.is_installed_in IS TRUE

"f5fd0c8c-019c-4b33-88ff-e560600da730"	"25ac5d95-e22c-4548-8ed1-b91937dad549"	"3"	"松柏320"	"B"	"b67fa1c4-1ec5-4bb1-84a4-0368235c10f0"	"2022-07-25 03:15:11.012176+00"	true
"d75bc396-7e4b-4ec3-afae-63484bcd50c8"	"f6055836-9058-4b8b-9fa4-edb58b37406e"	"3"	"松柏320"	"C"	"b67fa1c4-1ec5-4bb1-84a4-0368235c10f0"	"2022-07-25 03:15:11.3897+00"	true
"5d7eb066-188a-4b1c-8021-af00505961e2"	"4b5f88b0-50f0-4bd2-a534-966852ab3ae5"	"3"	"松柏32A"	"C"	"b67fa1c4-1ec5-4bb1-84a4-0368235c10f0"	"2022-07-27 15:15:14.526024+00"	true
"6973fcad-7876-48d6-8c52-e781161566c6"	"899cfa71-1891-4aec-bb8a-c25f3c8266a1"	"3"	"松柏32A"	"A"	"b67fa1c4-1ec5-4bb1-84a4-0368235c10f0"	"2022-07-27 15:15:14.966975+00"	true
"684c56eb-8d69-4246-b68d-bb89316c2d6a"	"4b3e170a-01fd-46a3-a6b9-a5afac4e66bf"	"3"	"松柏32A"	"B"	"b67fa1c4-1ec5-4bb1-84a4-0368235c10f0"	"2022-07-27 15:15:15.789363+00"	true

```

### With Patient Lived in Space in period of Time
```sql


```

---
### JOIN Device_Installed_in_Space_History and Patient_Lived_in_Space_History
* inputs
  * orgID,
  * query startAt
  * query endAt
  *
```sql
WITH device_installed_in_spaces_history AS (
	SELECT space_id, device_id, branch, room, bed, organization_id, dins.updated_at AS device_updated_at, is_installed_in
	FROM device_installed_in_spaces AS dins

	JOIN (
		SELECT * FROM spaces_v2 WHERE organization_id = 'b67fa1c4-1ec5-4bb1-84a4-0368235c10f0'
	) as organization_spaces
	ON dins.space_id = organization_spaces.id

	WHERE
	dins.updated_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-22 00:00:00' AND dins.is_installed_in IS FALSE -- check move_out during query period
	OR dins.is_installed_in IS TRUE
), psh AS (
	SELECT patient_id, space_id , organization_id, first_name, last_name, pins.updated_at AS patient_updated_at, is_living_in
	FROM patient_lived_spaces AS pins
	JOIN patients_v2
	ON pins.patient_id = patients_v2.id
	AND organization_id = 'b67fa1c4-1ec5-4bb1-84a4-0368235c10f0'
	WHERE pins.space_id IN (
		SELECT space_id FROM device_installed_in_spaces_history
	)
	AND pins.updated_at BETWEEN '2022-08-15 00:00:00'
	AND '2022-08-22 00:00:00' AND pins.is_living_in IS FALSE -- check move_out during query period
	OR pins.is_living_in IS TRUE
	ORDER BY pins.updated_at DESC
)
SELECT
	dsh.organization_id,
	dsh.device_id,
	dsh.space_id,
	(SELECT patient_id FROM psh WHERE psh.space_id = dsh.space_id LIMIT 1) AS patient_id,
	(SELECT first_name FROM psh WHERE psh.space_id = dsh.space_id LIMIT 1) AS first_name,
	(SELECT last_name FROM psh WHERE psh.space_id = dsh.space_id LIMIT 1) AS last_name,
	(SELECT is_living_in FROM psh WHERE psh.space_id = dsh.space_id LIMIT 1) AS is_living_in,
	(SELECT patient_updated_at FROM psh WHERE psh.space_id = dsh.space_id LIMIT 1) AS patient_updated_at,
	dsh.is_installed_in,
	dsh.device_updated_at

FROM device_installed_in_spaces_history AS dsh

```

---
### Final (List both is_living_in / is_installed_in and has_moved_out)
```sql
WITH device_installed_in_spaces_history AS (
	SELECT space_id, device_id, branch, room, bed, organization_id, dins.updated_at AS device_updated_at, is_installed_in
	FROM device_installed_in_spaces AS dins

	JOIN (
		SELECT * FROM spaces_v2 WHERE organization_id = 'f850d373-c326-4602-8b92-dba408302e47'-- 'b67fa1c4-1ec5-4bb1-84a4-0368235c10f0'
	) as organization_spaces
	ON dins.space_id = organization_spaces.id

	WHERE
	dins.updated_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-24 00:00:00' AND dins.is_installed_in IS FALSE
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
	AND '2022-08-24 00:00:00' AND pins.is_living_in IS FALSE -- check move_out in period
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

---
### query result
```sql

"f850d373-c326-4602-8b92-dba408302e47"	"f6ee2122-a7ab-43f8-8774-9c85188d5c3c"	"cd04926c-a389-48c9-95b5-73baeed1c9e5"	"ea8b2224-112a-43c1-8851-3d6a5f73ed0d"	"SG Test"	"Space"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-08-12 02:15:06.966045+00"
"f850d373-c326-4602-8b92-dba408302e47"	"81e4dc66-972f-43b8-833f-3276310f2d3d"	"52e3b0e0-2c35-4bde-96a9-e788dba47a67"	"bb2cab48-a8bc-4c11-92bc-828980317a21"	"小燕 (休息室床墊)"	"陳"	false	"2022-08-23 03:00:05.988321+00"	true	"2022-07-20 06:15:05.611804+00"
"f850d373-c326-4602-8b92-dba408302e47"	"7d75fe04-47f3-49ac-b187-d8717de7c9f5"	"45f68bc9-2a85-4810-9bcf-6e15c7b51153"	"fe1c6303-bcca-477e-95d3-10d841a9f646"	"曉燕分靈"	"Space測試"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-04-25 10:15:06.228391+00"
"f850d373-c326-4602-8b92-dba408302e47"	"14957446-297e-4140-a762-698505c42649"	"8dd0aa93-6429-46d2-9029-ebda49a9dadc"	"e21516db-ce4c-4da2-af5a-5e3a2518a05c"	"Marcie"	"(內湖展示)Brown"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-03-04 08:15:07.122107+00"
"f850d373-c326-4602-8b92-dba408302e47"	"6a4056ea-a288-4a09-a30f-775c52112cd8"	"8dd0aa93-6429-46d2-9029-ebda49a9dadc"	"e21516db-ce4c-4da2-af5a-5e3a2518a05c"	"Marcie"	"(內湖展示)Brown"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-03-04 08:15:04.061618+00"
"f850d373-c326-4602-8b92-dba408302e47"	"8b92eb0c-7a5e-4306-8b49-41a11550fc07"	"595e86ad-e502-4cba-85f7-e77310731f05"	"60234912-fdbb-452a-9a24-b301cb7d4502"	"Alu"	"Liu"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-04-06 17:15:04.016973+00"
"f850d373-c326-4602-8b92-dba408302e47"	"78f6ece2-7d18-4017-b50c-377a30eca88b"	"595e86ad-e502-4cba-85f7-e77310731f05"	"60234912-fdbb-452a-9a24-b301cb7d4502"	"Alu"	"Liu"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-03-25 07:15:06.350126+00"
"f850d373-c326-4602-8b92-dba408302e47"	"d8788976-cbd7-4b9a-9f77-318113b929ab"	"006ed2c2-ed56-4d5c-855f-52492139aca4"	"c9b16660-e226-4198-bf31-ee7ecd551606"	"John (佳德座位)"	"Smith"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-07-05 07:15:05.331942+00"
"f850d373-c326-4602-8b92-dba408302e47"	"6a51d748-eacb-4f39-99e2-22e3fd742fd0"	"3d164fee-123a-4f84-aa6e-6354262b6e24"	"d5737814-4e89-41b5-a4a4-6636a6a912ef"	"座位分靈"	"Space測試"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-04-25 10:15:05.473325+00"
"f850d373-c326-4602-8b92-dba408302e47"	"4e611cbf-ad78-45b3-888c-bb62659fba5a"	"0c17f9c3-91d5-41ec-913f-f745fbb14bb4"	"e4dbf86a-7baa-4e2f-b697-e11cc6bd21d6"	"Andy"	"Space"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-05-10 03:15:06.018803+00"
"f850d373-c326-4602-8b92-dba408302e47"	"630b43e3-59e1-45cd-92c6-69b09df71b57"	"70f86b61-1b74-4ad0-bd7a-72f3a703e1dd"	"a682a5f8-2274-4290-b020-5b75637297d8"	"建宏"	"Space"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-05-04 04:15:08.25875+00"
"f850d373-c326-4602-8b92-dba408302e47"	"79c34af8-f799-4a4d-a7cb-1ab6202447fe"	"3ba76754-ea58-4f1b-8903-e09dccdd660c"	"2b225398-04b1-4fbd-8fb3-c6fe923efd17"	"可可"	"林"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-03-04 08:15:17.089827+00"
"f850d373-c326-4602-8b92-dba408302e47"	"f8a8ddb8-31ea-44c1-bd52-8eabcce0dfb2"	"3ba76754-ea58-4f1b-8903-e09dccdd660c"	"2b225398-04b1-4fbd-8fb3-c6fe923efd17"	"可可"	"林"	true	"2022-08-23 03:00:05.988321+00"	true	"2022-03-04 08:15:16.780758+00"
"f850d373-c326-4602-8b92-dba408302e47"	"79c34af8-f799-4a4d-a7cb-1ab6202447fe"	"3ba76754-ea58-4f1b-8903-e09dccdd660c"	"5849943f-cbea-4083-8ac9-843f8c8ef128"	"Henry"	"Lee"	false	"2022-08-23 03:00:05.988321+00"	true	"2022-03-04 08:15:17.089827+00"
"f850d373-c326-4602-8b92-dba408302e47"	"f8a8ddb8-31ea-44c1-bd52-8eabcce0dfb2"	"3ba76754-ea58-4f1b-8903-e09dccdd660c"	"5849943f-cbea-4083-8ac9-843f8c8ef128"	"Henry"	"Lee"	false	"2022-08-23 03:00:05.988321+00"	true	"2022-03-04 08:15:16.780758+00"
"f850d373-c326-4602-8b92-dba408302e47"	"79c34af8-f799-4a4d-a7cb-1ab6202447fe"	"3ba76754-ea58-4f1b-8903-e09dccdd660c"	"a988c41e-5660-4b68-82a9-36de558ffca3"	"爺爺"	"陳"	true	"2022-08-18 05:00:05.049179+00"	true	"2022-03-04 08:15:17.089827+00"
"f850d373-c326-4602-8b92-dba408302e47"	"f8a8ddb8-31ea-44c1-bd52-8eabcce0dfb2"	"3ba76754-ea58-4f1b-8903-e09dccdd660c"	"a988c41e-5660-4b68-82a9-36de558ffca3"	"爺爺"	"陳"	true	"2022-08-18 05:00:05.049179+00"	true	"2022-03-04 08:15:16.780758+00"
"f850d373-c326-4602-8b92-dba408302e47"	"79c34af8-f799-4a4d-a7cb-1ab6202447fe"	"3ba76754-ea58-4f1b-8903-e09dccdd660c"	"b3360d7a-3a35-4d40-b2c7-43473cf854bb"	"太郎"	"花"	true	"2022-06-20 06:00:03.907852+00"	true	"2022-03-04 08:15:17.089827+00"
"f850d373-c326-4602-8b92-dba408302e47"	"f8a8ddb8-31ea-44c1-bd52-8eabcce0dfb2"	"3ba76754-ea58-4f1b-8903-e09dccdd660c"	"b3360d7a-3a35-4d40-b2c7-43473cf854bb"	"太郎"	"花"	true	"2022-06-20 06:00:03.907852+00"	true	"2022-03-04 08:15:16.780758+00"

```

---
## 夜間離床計算平均次數 (週)

---
### Listing Single Device from Date Range in night shift

```sql
SELECT *
FROM events
WHERE occurred_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-22 00:00:00'
AND (EXTRACT(HOUR from occurred_at) >= 20 OR EXTRACT(HOUR FROM occurred_at) < 6)
AND device_id = '0025656b-f320-4daa-ab2f-16c2ae9aed84'

--- table
```

---
### COUNTING Test 1
* Outer range: 7 days (1 week) range
* Inner range: night shifts per day
```sql
SELECT device_id, COUNT(patient_state)
FROM events
WHERE occurred_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-22 00:00:00'
AND (EXTRACT(HOUR from occurred_at) >= 20 OR EXTRACT(HOUR FROM occurred_at) < 6)
AND device_id = '0025656b-f320-4daa-ab2f-16c2ae9aed84'
AND patient_state = 1
GROUP BY device_id;

--- 16
```

---
### COUNTING Test 2 with ANY (ARRAY[data1, data2...])

```sql
SELECT * --device_id --, COUNT(patient_state)
FROM events
WHERE device_id = ANY (ARRAY[
	'81e4dc66-972f-43b8-833f-3276310f2d3d'::uuid,
	'7d75fe04-47f3-49ac-b187-d8717de7c9f5'::uuid,
	'14957446-297e-4140-a762-698505c42649'::uuid,
	'6a4056ea-a288-4a09-a30f-775c52112cd8'::uuid,
	'8b92eb0c-7a5e-4306-8b49-41a11550fc07'::uuid
])

AND occurred_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-22 00:00:00'
AND (EXTRACT(HOUR from events.occurred_at) >= 20 OR EXTRACT(HOUR FROM events.occurred_at) < 6)
AND events.patient_state = 1
GROUP BY id, device_id;
```

---
### COUNTING Test 3 with IN operator(data1, data2, data3...)
```sql
SELECT device_id , COUNT(patient_state)
FROM events
WHERE device_id IN (
	'81e4dc66-972f-43b8-833f-3276310f2d3d',
	'd8788976-cbd7-4b9a-9f77-318113b929ab',
	'7d75fe04-47f3-49ac-b187-d8717de7c9f5',
	'14957446-297e-4140-a762-698505c42649',
	'6a4056ea-a288-4a09-a30f-775c52112cd8',
	'8b92eb0c-7a5e-4306-8b49-41a11550fc07',
	'f8a8ddb8-31ea-44c1-bd52-8eabcce0dfb2',
	'79c34af8-f799-4a4d-a7cb-1ab6202447fe'
)

AND occurred_at BETWEEN '2022-08-15 00:00:00' AND '2022-08-22 00:00:00'
AND (EXTRACT(HOUR from events.occurred_at) >= 20 OR EXTRACT(HOUR FROM events.occurred_at) < 6)
AND events.patient_state = 1
GROUP BY device_id;
```
```sql
"81e4dc66-972f-43b8-833f-3276310f2d3d"	10
"d8788976-cbd7-4b9a-9f77-318113b929ab"	4
```

---
### TRY TSTZRANGE
* Following is not working properly; noted
```sql
WITH night_shifts AS (
	SELECT TSTZRANGE('2022-08-15 00:00:00', '2022-08-22 00:00:00') *
	TSTZRANGE('2022-08-15 00:00:00'::date + time '23:00', '2022-08-22 00:00:00'::date + time '06:00')
	FROM events
)
SELECT
	device_id,
	COUNT(patient_state)
FROM events
WHERE patient_state = 1 AND device_id = '0025656b-f320-4daa-ab2f-16c2ae9aed84'

GROUP BY device_id

```

---
#### create a smartbed_delay_alerts table with random alert series for testing purposes
```sql
Create or replace function random_string(length integer) returns text as
$$
declare
  chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
  result text := '';
  i integer := 0;
begin
  if length < 0 then
    raise exception 'Given length cannot be less than 0';
  end if;
  for i in 1..length loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  end loop;
  return result;
end;
$$ language plpgsql;

DROP TABLE IF EXISTS smartbed_delay_alerts;
CREATE TABLE smartbed_delay_alerts (
	data_id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
	created_at timestamp,
	disalarmed_at timestamp,
	option text,
	severity text,
	event text,
	delay_period bigint,
	device_id uuid,
	should_emit_at timestamp,
	canceled_at timestamp,
	emitted_at timestamp
);
---
INSERT INTO smartbed_delay_alerts
SELECT
	gen_random_uuid() as data_id,
timestamp '2022-08-24 00:00:00' + random() * (timestamp '2022-09-01 00:00:00' -
	timestamp '2022-08-24 00:00:00') as created_at,
timestamp '2022-08-24 00:00:00' + random() * (timestamp '2022-09-01 00:00:00' -
    timestamp '2022-08-24 00:00:00') as disalarmed_at,
'longLying' as option,
random_string(15) as severity,
random_string(15) as event,
floor(RANDOM() * 10) as delay_period,
(array[
	'6b9a898a-638e-46ec-a070-1d774b4e24e0'::uuid,
	'7cadec86-c516-4b74-8e1d-1e6122b460c4'::uuid,
	'55a0fb18-8457-4152-8606-046b91fa5df5'::uuid,
	'1b26e15d-05c5-48eb-b589-419206636302'::uuid,
	'5077d253-6562-4947-b99a-2eabd524ae38'::uuid,
	'73031bb9-eec4-4b28-9f59-d450750de396'::uuid,
	'82ed1b77-7a6a-4346-a1d4-c40fc2e87e90'::uuid,
	'091a97cf-eb30-4605-939f-ee2901665688'::uuid,
	'38c697ff-bfaf-45c1-82f2-8541def0d89a'::uuid,
	'5c85dfc0-1a57-4c8d-b868-c4e975e013f4'::uuid,
	'1a64f461-6d79-4c49-9cfb-c72dda00114a'::uuid,
	'9afcad4b-6bac-4ff9-8555-c1142bfbb079'::uuid,
	'b313b8c8-4888-40af-a86f-157ce3b32b26'::uuid,
	'6f64c988-1bb3-4088-8268-d2d015b3238f'::uuid,
	'8f840182-4814-498c-9c0e-0fd2698d622e'::uuid,
	'19156b85-59bd-40d3-b0c7-41aea29c1a5b'::uuid,
	'e9a4fefa-4bfd-49a8-831d-32eb4ce97ed9'::uuid,
	'01443c0d-3df4-4906-822b-9b6726c57b69'::uuid,
	'ac04d72d-ed2f-46bb-827b-57d56db3138c'::uuid,
	'a4fa03cf-ec44-4451-85d6-756e027d8b9d'::uuid,
	'08184e54-3e87-435a-bb30-604032fa30b1'::uuid
])[floor(random() * 20 + 1)] as device_id,
timestamp '2022-08-24 00:00:00' + random() * (timestamp '2022-09-01 00:00:00' -
                   timestamp '2022-08-24 00:00:00') as should_emit_at,
timestamp '2022-08-24 00:00:00' + random() * (timestamp '2022-09-01 00:00:00' -
                   timestamp '2022-08-24 00:00:00') as canceled_at,
timestamp '2022-08-24 00:00:00' + random() * (timestamp '2022-09-01 00:00:00' -
                   timestamp '2022-08-24 00:00:00') as emitted_at
FROM generate_series(1, 1000) as num_of_items;


```

---
### create a breath_rate_alerts table with random alert series for test purposes
```sql
DROP TABLE IF EXISTS breath_rate_alerts;
CREATE TABLE breath_rate_alerts (
	data_id DEFAULT gen_random_uuid() PRIMARY KEY,
	created_at timestamp,
	disalarmed_at timestamp,
	option text,
	severity text,
	threshold int
);
---
INSERT INTO breath_rate_alerts
SELECT
	gen_random_uuid() as id,
    timestamp '2022-08-24 00:00:00' +
       random() * (timestamp '2022-09-01 00:00:00' -
                   timestamp '2022-08-24 00:00:00') as occurred_at,
    timestamp '2022-08-24 00:00:00' +
       random() * (timestamp '2022-09-01 00:00:00' -
                   timestamp '2022-08-24 00:00:00') as occurred_at,
	slowHeartRate as option,
	severe as severity,
	floor(RANDOM() * 60) as threshold
FROM generate_series(1, 10000) as num_of_items;

```

---
#### create a events table with random event series for testing purposes
* 3 種 patient_state, 6 種 patient_state_detail
* more than one week of time series data

```sql
DROP TABLE IF EXISTS events;
CREATE TABLE events (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    device_id uuid,
	patient_state integer,
	patient_state_detail integer,
	occurred_at timestamp,
	num_of_items integer
);
---
INSERT INTO events
SELECT
	num_of_items,
	gen_random_uuid() as id,
	(
		array[
				'3ab2cdd8-1f50-47f3-ab1a-856b95481305'::uuid,
				'488327c3-47d0-451b-b82b-4982c04988a8'::uuid,
				'de430736-4be5-409f-80fb-2afcd1b3b87e'::uuid,
				'36aae508-3f67-4e21-b76b-713753f8c280'::uuid,
				'2e7a4a78-ecb4-4fb2-98f2-ea62b9d7d8be'::uuid,
				'74d69e32-ed9c-4813-8d08-6c701c227936'::uuid,
				'efc326e3-0c8c-4601-9a51-50c6075f0a10'::uuid,
				'6a69d2c6-9cf0-4885-a791-2510260c1b0b'::uuid,
				'5a1ffb43-1311-43ca-ae84-6b99eaa4abe5'::uuid
			  ]
	)[floor(random() * 9 + 1)] as device_id,
	floor(RANDOM() * 3) as patient_state,
	floor(RANDOM() * 6) as patient_state_detail,
    timestamp '2022-08-18 00:00:00' +
       random() * (timestamp '2022-08-27 00:00:00' -
                   timestamp '2022-08-18 00:00:00') as occurred_at

FROM generate_series(1, 100000) as num_of_items;
```

---

### device list generation
```
"device_ids_list":[
	"3ab2cdd8-1f50-47f3-ab1a-856b95481305","488327c3-47d0-451b-b82b-4982c04988a8","de430736-4be5-409f-80fb-2afcd1b3b87e","36aae508-3f67-4e21-b76b-713753f8c280","2e7a4a78-ecb4-4fb2-98f2-ea62b9d7d8be","74d69e32-ed9c-4813-8d08-6c701c227936","efc326e3-0c8c-4601-9a51-50c6075f0a10","6a69d2c6-9cf0-4885-a791-2510260c1b0b","5a1ffb43-1311-43ca-ae84-6b99eaa4abe5"]}

'3ab2cdd8-1f50-47f3-ab1a-856b95481305','488327c3-47d0-451b-b82b-4982c04988a8','de430736-4be5-409f-80fb-2afcd1b3b87e','36aae508-3f67-4e21-b76b-713753f8c280','2e7a4a78-ecb4-4fb2-98f2-ea62b9d7d8be','74d69e32-ed9c-4813-8d08-6c701c227936','efc326e3-0c8c-4601-9a51-50c6075f0a10','6a69d2c6-9cf0-4885-a791-2510260c1b0b','5a1ffb43-1311-43ca-ae84-6b99eaa4abe5'


'3ab2cdd8-1f50-47f3-ab1a-856b95481305',
'488327c3-47d0-451b-b82b-4982c04988a8',
'de430736-4be5-409f-80fb-2afcd1b3b87e',
'36aae508-3f67-4e21-b76b-713753f8c280',
'2e7a4a78-ecb4-4fb2-98f2-ea62b9d7d8be',
'74d69e32-ed9c-4813-8d08-6c701c227936',
'efc326e3-0c8c-4601-9a51-50c6075f0a10',
'6a69d2c6-9cf0-4885-a791-2510260c1b0b',
'5a1ffb43-1311-43ca-ae84-6b99eaa4abe5',

```

---
### non-working with SELECT CASE THEN END
```sql
WITH RECURSIVE final_results AS (

	VALUES(50)

)

SELECT device_id
 	, occurred_at
	, CASE WHEN a2 = 0 THEN a1 END AS activity
	, CASE WHEN a2 = 1 THEN a2 END AS next_activity
FROM (
	SELECT --n DISTINCT ON (device_id)
		device_id
		, occurred_at
		, LEAD(patient_state) OVER (PARTITION BY device_id ORDER BY occurred_at DESC) AS a1
		, patient_state AS a2
	FROM events
	WHERE (patient_state = 0 OR patient_state = 1)
	ORDER BY device_id, occurred_at DESC -- LIMIT 1
) subs;

```