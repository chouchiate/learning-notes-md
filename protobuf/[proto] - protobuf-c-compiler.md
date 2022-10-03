## [proto] - protobuf-c-compiler

### Homebrew install for MACOS

```bash
$ brew install protobuf-c
```

> for low-performance hardware, JSON parsing in C is a heavy load

### Usage Guide
* create a proto file
```bash
$ touch amessage.proto
```
* edit the proto file
```proto
syntax = "proto2";

message AMessage {
  required int32 a=1;
  optional int32 b=2;
}
```
* compile proto file to create source code
```bash
$ protoc-c --c_out=. amessage.proto
$ ls amessage.*
amessage.pb-c.c  amessage.pb-c.h  amessage.proto

```

### Add source file to  CMakeLists.txt
```makefile
set(component_srcs main.c amessage.pb-c.c)
```


### external

* [github](https://github.com/protobuf-c/protobuf-c)


