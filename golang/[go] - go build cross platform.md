[go] - Go Cross Platform Build

### Compile for windows
```bash
# 64-bit
GOOS=windows GOARCH=amd64 go build -o bin/app-amd64.exe app.go

# 32-bit
GOOS=windows GOARCH=386 go build -o bin/app-386.exe app.go
```

### Compile for macOS
```bash
# 64-bit
GOOS=darwin GOARCH=amd64 go build -o bin/app-amd64-darwin app.go

# 32-bit
GOOS=darwin GOARCH=386 go build -o bin/app-386-darwin app.go
```

### Compile for linux
```bash
# 64-bit
GOOS=linux GOARCH=amd64 go build -o bin/app-amd64-linux app.go

# 32-bit
GOOS=linux GOARCH=386 go build -o bin/app-386-linux app.go
```

### Compile for other operating system
> refer to the Go docs to see the combinations of **GOOS** and **GOARCH**

### External Links
* [go-doc-env](https://go.dev/doc/install/source#environment)
* [tutorial](https://mileslin.github.io/2020/01/Golang/Go-%E7%94%A2%E7%94%9F%E4%B8%8D%E5%90%8C%E5%B9%B3%E5%8F%B0%E7%9A%84%E5%9F%B7%E8%A1%8C%E6%AA%94/)
* [digital-ocean](https://www.digitalocean.com/community/tutorials/how-to-build-go-executables-for-multiple-platforms-on-ubuntu-16-04)
* [freshman](https://freshman.tech/snippets/go/cross-compile-go-programs/)
* [環境變數介紹](https://ithelp.ithome.com.tw/articles/10254183)