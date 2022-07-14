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
