##


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
