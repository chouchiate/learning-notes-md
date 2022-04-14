## [mongo] - Query Notes

[doc](https://www.mongodb.com/docs/manual/reference/operator/query/)

### Query with Projection

```js

db.getCollection("wis-eventseries").find({
    // vendorId: "201906450",
    timeSeries: {$elemMatch:{vendorId: "201906450", status:"0"}}

})
   .projection({
        timeSeries:1
   })
   .sort({_id:-1})
   .limit(100)
```

### Query Object within Object then Flatten by Projection
```js
db.getCollection("mwg-time-series").find({
    'metadata.vendorId': 'B8F009B55AB0'
})
   .projection({
       'metadata.vendorId': 1,
       'status': 2,
       'timestamp': 3,
   })
   .sort({timestamp:-1})
   .limit(100)
```

### Get Counts
```js
db.getCollection("mwg-time-series").find({
    'metadata.vendorId': 'B8F009B55AB0'
})
   .projection({
       'metadata.vendorId': 1,
       'status': 2,
       'timestamp': 3,
   })
   .count()

```

### Query resporitory rate
```js
db.getCollection("hum-time-series").find({
    "metadata.vendorId": "SPS2021PA000163",
    "rr": {$gte: 0}
})
   .projection({
       "rr": 1,
       "metadata.vendorId": 2,
       "restless": 3,
       "timestamp": 4,
       "status":5,
   })
   .sort({_id:-1})
   .limit(100)
```

### Query Time Range

```js
db.getCollection("grpc-time-series").find({
    "timestamp": {$gte: ISODate("2022-03-28T00:00:00Z"), $lt: ISODate("2022-03-29T01:00:00Z")}
})
   .projection({})
   .sort({_id:-1})
   .limit(100)
```

### Query Not Equal (Single and Multiple)
* Single Item
```js
db.getCollection("hum-time-series").find({
    "metadata.vendorId": "SPS2021PA000228",
    status: {$ne: 'ABNORMAL'},
})
   .projection({})
   .sort({_id:-1})
   .limit(100)
```
* Multiple Items
```js
db.getCollection("hum-time-series").find({
    "metadata.vendorId": "SPS2021PA000228",
    status: {$nin: ['ABNORMAL', 'NORMAL']}
})
   .projection({})
   .sort({_id:-1})
   .limit(100)
```

### Or Select
```js
    const event = await schema.findOne({ $or: [
      {
        "metadata.vendorId": vendorId,
        "brand": brand,
        "type": 'v2_event'
      },
      {
        "metadata.vendorId": vendorId,
        "brand": brand,
        "type": 'v2_status'
      },
    ]}
```



### Interfacing
> [github](https://github.com/tylerbrock/mongo-hacker)
```js
// may not work.. have to try
db.collection.find({ ... }).update({ ... }) -- multi update
db.collection.find({ ... }).replace({ ... }) -- single replacement
db.collection.find({ ... }).upsert({ ... }) -- single upsert
db.collection.find({ ... }).remove() -- multi remove
```