## [go] - Mongo Package

> MongoDb Driver API for Go

### Client Creation & Connection
```go
  ctx, cancel := context.WithTimeout(context.Background(), 20*time.Second)
  defer cancel()
  client, err := mongo.Connect(ctx, options.Client().ApplyURI("mongodb://foo:bar@localhost:27017"))
  if err != nil { return err }
```

### Ping Connection
```go
	// Call Ping to verify that the deployment is up and the Client was
	// configured successfully. As mentioned in the Ping documentation, this
	// reduces application resiliency as the server may be temporarily
	// unavailable when Ping is called.
	if err = client.Ping(ctx/*context.TODO()*/, readpref.Primary()); err != nil {
		log.Fatal(err)
	}
```
#### Further study:
* [readpref](https://pkg.go.dev/go.mongodb.org/mongo-driver@v1.8.4/mongo/readpref)
* [options](https://pkg.go.dev/go.mongodb.org/mongo-driver@v1.8.4/mongo/options)


### Create Collections
* Create Collection
```go
func (db *Database) CreateCollection(ctx context.Context, name string, opts ...*options.CreateCollectionOptions) error
```
```go
  db.CreateCollection(ctx, "db-name", options.CreateCollection()...)
```

* Timeseries Option
```go
func (c *CreateCollectionOptions) SetTimeSeriesOptions(timeSeriesOpts *TimeSeriesOptions) *CreateCollectionOptions
```

```go
  SetTimeSeriesOptions(
    options.TimeSeries().
      SetGranularity("seconds").
      SetMetaField("metadata").
      SetTimeField("event_time"),
  )
```

