## [go] - envconfig

### setup

```go
// config.go
import "github.com/kelseyhightower/envconfig"

type (
    Env struct {
        Debug bool `envconfig:"DEBUG" default:"false"`
    }
    Redis struct {
        Host string `envconfig:"REDIS_HOST" default:"localhost"`
    }
)

func Process(env *Env) error {
	return envconfig.Process("", env)
}

func New() (*Env, error) {
	var env Env
	if err := Process(&env); err != nil {
		return nil, err
	}
	return &env, nil
}
```

### main usage
```go

var env envconfig.Env

func main() {
    if err = envconfig.Process(&env); err != nil {
        logger.Fatal("failed to load config from env vars", zap.Error(err))
    }
}
```

