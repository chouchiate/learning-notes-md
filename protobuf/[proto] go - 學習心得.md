## [protobuf] Go - 學習心得

#### Installation

```bash
$ brew install protobuf
$ brew upgrade protobuf
$ protoc --version
## libprotoc 3.17.3, Ensure compiler version is 3+

# 安裝 grpc-go
$ go get -u google.golang.org/grpc

# 安裝 protoc-gen-go
$ go get github.com/golang/protobuf/protoc-gen-go    # v1.22.0
$ protoc-gen-go --version      # 檢視版本

```

## Compile Proto 檔

```bash
# 進到有 proto 檔的資料夾
$ cd internal/grpc/proto/

# compile 出 .pb.go 檔
$ protoc --go_out=plugins=grpc:. *.proto --go_opt=paths=source_relative
```

