## [go] - buf

## Install Buf On Mac
```bash
	brew tap bufbuild/buf
	brew install buf

```

## Install protoc-gen-go
```bash
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

```

### buf.yaml
* [doc](https://docs.buf.build/configuration/v1beta1/buf-yaml)
```yaml
version: v1
build:
  excludes:
    - routes
breaking:
  use:
    - FILE
lint:
  use:
    - BASIC
    - FILE_LOWER_SNAKE_CASE

```

# tree for setup
.
├── LICENSE
├── pb
│   ├── *_grpc.pb.go
│   └── *.pb.go
├── proto
│   ├── buf.yaml
│   ├── buf.gen-go.yaml
│   └── *.proto
├── go.mod
├── go.sum
└── main.go

## generate go-pb
```make
gen-go
	rm -fr pb/
	buf generate \
		--config proto/buf.yaml \
		--template proto/buf.gen-go.yaml
	mv pb/proto/* pb/
	rmdir pb/proto/

```
