## [go] - embed package

* 關鍵字: go:embed

#### Sample #1
```go

// 引用
package main

import (
	"embed"
)

//go:embed hello.txt
var s string

//go:embed hello.txt
var b []byte

//go:embed hello.txt
var f embed.FS

func main() {
	print(s)
	print(string(b))
	data, _ := f.ReadFile("hello.txt")
	print(string(data))
}
```
* 透過註解就可以將靜態檔案直接使用在開發上面

#### Sample2

```go
//go:embed oauth-access-token.json
var tokenBytes []byte

//go:embed oauth-client.json
var saBytes []byte
```


* 引用多個檔案或多個目錄
```go
package server

import "embed"

// content holds our static web server content.
//go:embed image/* template/*
//go:embed html/index.html
var content embed.FS
```