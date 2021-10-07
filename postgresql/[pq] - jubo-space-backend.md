
#### Create ***Materialized View*** for **Latest Detections**

```sql
  CREATE MATERIALIZED VIEW detections_latest AS
SELECT 
	spa.organization_id,
	ld.*
FROM public.spaces AS spa
INNER JOIN (
SELECT DISTINCT ON (box_device_id)
	det.id,
	det.created_at,
	det.deleted_at,
    det.occurred_at,
	det.device_id,
    det.box_device_id,
	det.configs,
    det.event,
    det.message,
    det.detail,
    det.space_id,
    det.space_name,
    det.space_branch,
    det.space_room,
    det.space_bed,
    det.patient_id,
    det.patient_nis_id,
    det.patient_id_number,
    det.patient_first_name,
    det.patient_last_name

FROM public.detections AS det
ORDER BY box_device_id, occurred_at DESC
) AS ld

ON spa.id::text = ld.space_id

;
```


#### Create ***Materialized View*** for **Twenty_Four_Hour_Detections**
##### **Conditions**

```sql
CREATE MATERIALIZED VIEW detections_24h AS
SELECT *
FROM public.detections
WHERE occurred_at >= now() - INTERVAL '1 DAY';
```

#### Create ***Materialized View*** for **One_Month_Detections**
##### **Conditions**

```sql
CREATE MATERIALIZED VIEW detections_1M AS
SELECT *
FROM public.detections
WHERE occurred_at >= now() - INTERVAL '1 MONTH';
```


![](../assets/img/sql_004.png)

* Materialized 產生結果於 current_space_relics

```sql
CREATE MATERIALIZED VIEW current_space_relic AS
SELECT 
 dt.*
FROM public.detections AS dt
JOIN(
 SELECT
  rt.box_device_id AS bid,
  rt.space_id AS sid,
  rt.patient_id AS pid,
 MAX(rt.updated_at) AS last_updated_at
 FROM (
  SELECT *
  FROM public.detections 
  INNER JOIN (
   SELECT DISTINCT
    detections.box_device_id AS rel_box_device_id,
    detections.space_id AS rel_space_id
   FROM public.detections
   JOIN public.current_space_device
   ON current_space_device.box_device_id = detections.box_device_id
   AND current_space_device.space_id::text != detections.space_id
  ) AS relics
  ON relics.rel_space_id = detections.space_id
  AND relics.rel_box_device_id = detections.box_device_id
 ) as rt
 GROUP BY rt.box_device_id, rt.space_id, rt.patient_id
) as rl
ON rl.bid = dt.box_device_id
AND rl.sid = dt.space_id
AND rl.pid = dt.patient_id
AND rl.last_updated_at <= dt.updated_at
;
```

 #### **JOINING current_device with patients TABLE***

 ```sql
  CREATE MATERIALIZED VIEW current_space_device AS
  SELECT 
   current.*,
   patients.sex,
   patients.first_name,
   patients.last_name,
   patients.id_number,
   patients.status,
   patients.provider_patient_id
  FROM(  
   SELECT spaces.id AS space_id,
     spaces.name AS space_name,
     spaces.branch,
     spaces.room,
     spaces.bed,
     devices.id AS device_id,
     devices.box_device_id,
     devices.organization_id,
     devices.brand,
     devices.name AS device_name,
     devices.type,
     devices.description,
     devices.configuration
    FROM spaces
     INNER JOIN devices ON spaces.id = devices.space_id
    WHERE devices.state = 'Normal'::text
  ) AS current
   INNER JOIN patients ON
   status = 'present'::text AND
   current.branch = patients.branch AND
   current.room = patients.room AND
   current.bed = patients.bed AND
   current.organization_id = patients.organization_id;
   
 ```

