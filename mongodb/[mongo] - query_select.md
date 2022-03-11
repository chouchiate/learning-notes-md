## Query with Projection
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

## Query Object within Object then Flatten by Projection
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

## Get Counts
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

## Query resporitory rate
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
