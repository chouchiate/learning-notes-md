Mongodb_Timeseries Implementation



1. Per-data-point bucketing

   * as name described

     ```json
     {
       "_id" : ObjectId("5b4690e047f49a04be523cbd"),
       "p" : 56.56,
       "symbol" : "MDB",
       "d" : ISODate("2018-06-30T00:00:01Z")
     },
     {
       "_id" : ObjectId("5b4690e047f49a04be523cbe"),
       "p" : 56.58,
       "symbol" : "MDB",
       "d" : ISODate("2018-06-30T00:00:02Z")
     },
     ...
     ```

     

2. Time-based bucketing

   * One document per minute

     ```json
     {
         "_id" : ObjectId("5b5279d1e303d394db6ea0f8"), 
         "p" : {
             "0" : 56.56,
             "1" : 56.56,
             "2" : 56.58,
             …
             "59" : 57.02
         },
        "symbol" : "MDB",
        "d" : ISODate("2018-06-30T00:00:00Z")
     },
        {
         "_id" : ObjectId("5b5279d1e303d394db6ea134"), 
         "p" : {
             "0" : 69.47,
             "1" : 69.47,
             "2" : 68.46,
             ...
            "59" : 69.45
         },
         "symbol" : "TSLA",
         "d" : ISODate("2018-06-30T00:01:00Z")
     },
     ...
     ```

     

3. Size-base bucketing  and/or Per-day bucketing 

   * Whichever comes first

   * Schema Example

     ```json
     {
         _id: ObjectId(),
         deviceid: 1234,
         sensorid: 3,
         nsamples: 5,
         day: ISODate("2018-08-29"),
         first:1535530412,
         last: 1535530432,
         samples : [
            { val: 50, time: 1535530412},
            { val: 55, time : 1535530415},
            { val: 56, time: 1535530420},
            { val: 55, time : 1535530430}, 
            { val: 56, time: 1535530432}
        ]
     }
     
     ```

     

