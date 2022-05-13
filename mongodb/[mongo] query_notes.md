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

### Aggregate Queries
* Sample documents
```doc
    #1. Type: "Like", value: 6, id: 123
    #2. Type: "Like", value: 7, id: 123
    #3. Type: "Like", value: 7, id: 123
    #4. Type: "Like", value: 8, id: 12345
    #5. Type: "Like", value: 7, id: 12345
    #6. Type: "Like", value: 6, id: 1234
    #7. Type: "Like", value: 2, id: 1234
    #7. Type: "Like", value: 2, id: 1234
    #7. Type: "Like", value: 2, id: 1234
```
* Expected output
```
1. id: 123
2. id: 12345
3. id: 1234
```
* query #1
```js
    db.data.aggregate([
        {$match: {value:{$gt:5}}},
        {$group: {'_id':"$id", num:{$sum:1}, avg:{$avg:"$value"}}},
        {$sort:{num:-1}}, { $limit : 50}
    ]);
```
* query #2
```js
db.getCollection('my_collection').aggregate([
    //Only include documents whose field named "value" is greater than 5
    {
        $match: {
            value: {
                $gt:5
            }
        }
    },
    //Using the documents gathered from the $match above, create a new set of
    // documents grouped by the "id" field, and use the "id" field as the "_id"
    // for the group. Make a new field called "num" that increments by 1 for
    // every matching document. Make a new field named "avg" that is the average
    // of the field named "value".
    {
        $group: {
            '_id' : "$id",
            num : {
                $sum : 1
            },
            avg : {
                $avg : "$value"
            }
        }//end $group
    },
    // -- //
    // Note: you could do another $match here, which would run on the new
    // documents created by $group.
    // -- //
    //Sort the new documents by the "num" field in descending order
    {
        $sort : {
            num : -1
        }
    },
    //Only return the first 3 of the new documents
    {
        $limit : 3
    }
])
Share
Improve this answer

```
