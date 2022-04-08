## [Golang] - Go Mod 學習筆記

#### Create new Module

```bash
# create new module, initializing go.mod
$ go mod init
```

#### Build and Test
```bash
# package building command
$ go build
# 
```


#### Remove Unused dependencies
```bash
# list go.mod
$ go list -m all
# clean up un-used dependencies
$ go mod tidy
$ go list -m all
# 
$ cat go.mod
#
$ go test
  ... [ no test files ]

```



#### Add dependency



####
