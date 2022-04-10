## [go] - gRPC 學習筆記

### **Test Grpc with Grpcurl**
```bash
  brew install grpcurl

## 安裝好後:
## 檢查 grpc service
grpcurl -plaintext localhost:50051 list
## Jubox falldown V1 Grpc 假封包

grpcurl -d '{"transaction_no":"1", "device_id":"vay-falldet-000004", "timestamp":"2022-03-22T05:49:45.019Z", "eventType": "falldown"}' -plaintext localhost:50051 grpc.proto.jubox.Jubox.FallEventUpdate


grpcurl -d '{"basic": {"deviceModelName":"id_MzA6QUU6QTQ6RTM6RUI6MjQ","timestamp":1648099980,"deviceId":"a51e6d73-8e21-44d5-b044-84e392335fef"},"event" : 1}' -plaintext localhost:50051 DeviceService.AddFalldown

```

### **Install buf**
```make
# https://docs.buf.build/installation#homebrew
install-buf-on-mac:
	brew tap bufbuild/buf
	brew install buf
```

### **Install protoc-gen-go**
```make
# https://docs.buf.build/tour/generate-go-code#install-plugins
install-protoc-gen-go:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

```