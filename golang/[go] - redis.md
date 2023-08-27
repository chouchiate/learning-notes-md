## [Golang] - Redis 學習

1. Install Go-redis
```bash
$ go get github.com/go-redis/redis/v8
```

2. Install Go Client for RedisJSON
```bash
$ go get github.com/nitishm/go-rejson/v4
```

### connection

```go
package cache

import (
	"context"
	"fmt"

	"github.com/go-redis/redis/v8"
)

func ConnectRedis(host, port string, dbNum int) (*redis.Client, error) {
	rdb := redis.NewClient(&redis.Options{
		Addr: host + ":" + port,
		DB:   dbNum,
	})

	if _, err := rdb.Ping(context.Background()).Result(); err != nil {
		return nil, fmt.Errorf("failed to ping redis: %w", err)
	}

	return rdb, nil
}

```

### SET Command
* Set key to hold the string value. If key already holds a value, it is overwritten, regardless of its type. Any previous time to live associated with the key is discarded on successful SET operation.
* [SET](https://redis.io/commands/set/)
### prototype
```go
/**
*
*
*/
func (c Tx) Set(ctx context.Context, key string, value interface{}, expiration time.Duration) *StatusCmd
```

### SETNX Command
* short for "SET if Not eXists".
* When key already holds a value, no operation is performed
* If key does not exist, it is equal to SET.
* [SETNX](https://redis.io/commands/setnx/)
#### Prototype
```go
/** SETNX
* @returns
* 1 if the key was set
* 0 if the key was not set
*/
func (c Tx) SetNX(ctx context.Context, key string, value interface{}, expiration time.Duration) *BoolCmd
```
#### Example
```go

func setNXExample(inf interface{})
	bytes, err := json.Marshal(info)
	if err != nil {
		return err
	}
	_, err = n.rdb.SetNX(ctx, infoID, bytes, expiry).Result()
	if err != nil {
		return fmt.Errorf("add info err: %w", err)
	}
	return nil
```

### ZADD Command
* sorted set (有序集合)
* adds all members with scores to sorted set stored at "key"
* 將一個或多個成員元素和其分數加入到有序集合中
* 如果有序集合 key 不存在 創建一個空的有序集並執行 ZADD 操作
* 如果 key 存在但不是一個有序集類型 返回錯誤
*

#### redis cli
```bash
redis 127.0.0.1:6379> ZADD runoobkey 1 redis
(integer) 1
redis 127.0.0.1:6379> ZADD runoobkey 2 mongodb
(integer) 1
redis 127.0.0.1:6379> ZADD runoobkey 3 mysql
(integer) 1
redis 127.0.0.1:6379> ZADD runoobkey 3 mysql
(integer) 0
redis 127.0.0.1:6379> ZADD runoobkey 4 mysql
(integer) 0
# list runoobkey from 0 to 10 with scores
redis 127.0.0.1:6379> ZRANGE runoobkey 0 10 WITHSCORES
1) "redis"
2) "1"
3) "mongodb"
4) "2"
5) "mysql"
6) "4"
```

#### Prototype
```go
type Z struct {
	Score  float64
	Member interface{}
}

func (c Client) ZAdd(ctx context.Context, key string, members ...*Z) *IntCmd
// ZAdd Redis `ZADD key score member [score member ...]` command.
```

#### Example


