## Golang Initial Project and Air.toml 學習筆記

#### 安裝

```bash
$ go get -u github.com/cosmtrek/air
```

#### First Program

* Choose Module Path

* Create a go.mod file

  ```bash
  $ mkdir <project_folder> && cd <project_folder>
  $ go mod init <module_path> # jubo.health/jubo-space-backend
  
  
  ```

#### Run project with auto-reload using Air.

```bash
$ air init
```

#### Use Go-tool to Install your program

```bash
# Build and Install with go-tool
# at path ../sample-go-project
$ go install example.com/sample-go-project
# or exec with current directory
go install .
# or exec with no path given
go install
# Run program
$ sample-go-project
```

#### Import Package from remote modules

```bash
# import remote module 
import (
	...
  "github.com/google/go-cmp/cmp"
)

# add missing and remove unused modules
$ go mod tidy
```

#### Remove all downloaded modules, pas -modcache flag to go clean

```bash
$ go clean -modcache
```

#### 使用 go env 更改 GOBIN

```bash
$ go env -w GOBIN=/somewhere/else/bin
```

#### 回歸原始 GOBIN 設定

```bash
$ go env -u GOBIN
```

#### Go Testing

* go test command and testing package

* create file ending with _test.go

* contains functions aimed TestXXX with func (t *testing.T)

* run go test

  





