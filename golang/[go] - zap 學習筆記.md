## [go] - Zap 筆記

* Config 屬性
 - Level:
 - Encoding:
 - EncoderConfig:
    * MessageKey
    * LevelKey
    * TimeKey
    * EncodeLevel
    * EncodeTime
 - OutputPaths:
 - ErrorOutputPaths

### Custom Config
```go
package main

import (
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

const (
	_stdout  string = "stdout"
	_stderr  string = "stderr"
	_path    string = "./logs/log"
	_patherr string = "./logs/err"
)

func main() {
	cfg := zap.Config{
		Level:    zap.NewAtomicLevelAt(zapcore.InfoLevel),
		Encoding: "console",
		EncoderConfig: zapcore.EncoderConfig{
			MessageKey:  "msg",
			LevelKey:    "level",
			TimeKey:     "time",
			EncodeLevel: zapcore.CapitalLevelEncoder,
			EncodeTime:  zapcore.TimeEncoderOfLayout("2006-01-02 15:04:05"),
		},
		OutputPaths:      []string{_stdout, _path},
		ErrorOutputPaths: []string{_stderr, _patherr},
	}

	logger, err := cfg.Build()
	if err != nil {
		panic(err)
	}

	f := zap.Int("amount", 100)
	logger.Debug("debug message", f)
	logger.Info("info message", f)
	logger.Error("error message", f)
	logger.Warn("warn message", f)
}

```

* 用 json or yaml 宣告配置 config,
```go
import (
    "encoding/json"
    "go.uber.org/zap"
)

func main() {

    rawJSON := []byte(`{
      "level": "info",
      "encoding": "console",
      "encoderConfig": {
        "messageKey": "msg",
        "levelKey": "level",
        "timeKey": "time",
        "levelEncoder": "capital",
        "timeEncoder": {
            "layout": "2006-01-02 15:04:05"
        }
      },
      "outputPaths": ["stdout", "./logs/log"],
      "errorOutputPaths": ["stderr"]
    }`)

    var cfg zap.Config
    if err := json.Unmarshal(rawJSON, &cfg); err != nil {
        panic(err)
    }

    logger, err := cfg.Build()
    if err != nil {
        panic(err)
    }
    defer logger.Sync()

    f := zap.Int("amount", 100)

    logger.Debug("debug message", f)
    logger.Info("info message", f)
    logger.Error("error message", f)
    logger.Warn("warn message", f)

}
```

### Mustrun

```go
func mustrun(msg string, err error, fields ...zapcore.Field) {
	logger.Info(msg, fields...)
	if err != nil {
		log.Fatalf("failed to run %s: %s", msg, err)
	}
}
```