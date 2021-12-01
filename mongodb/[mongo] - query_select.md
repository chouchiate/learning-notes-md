


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