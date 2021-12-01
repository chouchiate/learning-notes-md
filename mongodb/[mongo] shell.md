## Mongo_Shell_Queries_Note



//jello world

```
$ mongo admin -u uname -p 'password' --authenticationDatabase admin
```

### getCollection

```
> db.getCollection('devices').find({
		deviceId: { $in: ['123','456','789','abc']}
	})
    .projection({})
    .sort({_id:-1})
    .limit(100)
```

