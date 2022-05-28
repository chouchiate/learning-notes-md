## [Golang] - Go Mod 學習筆記

### go.mod file
* root of dependency management in Golang
  - all modules needed are maintained in go.mod file

### go.sum file
* is a generated file (do have to edit or modify this file)

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
