## Golang Initial Project with Air 學習筆記

#### 安裝  as of (1.40.4, built with Go 1.18.3)

```bash
$ go get -u github.com/cosmtrek/air

# binary will be $(go env GOPATH)/bin/air
$ curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

# or install it into ./bin/
$ curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s

$ air -v
```

#### Add Air to zshrc or
```bash
# open .zshrc with vscode
$ code ~/.zshrc
## add this line
alias air='$(go env GOPATH)/bin/air'
# update to env
$ source ~/.zshrc
```

#### First Program

* Choose Module Path

* Create a go.mod file

  ```bash
  $ mkdir <project_folder> && cd <project_folder>
  $ go mod init <module_path> # thudercat.health/thudercat-space-backend


  ```

#### Generate .air.toml at project directory

```bash
# This will generate a .air.toml file with the following output:
$ air init

```

#### Get detail info by reading the  [air_example.toml](https://github.com/cosmtrek/air/blob/master/air_example.toml)

```yml
# .air.toml default template
root = "."
testdata_dir = "testdata"
tmp_dir = "tmp"

[build]
  bin = "./tmp/main"
  cmd = "go build -o ./tmp/main ."
  delay = 1000
  exclude_dir = ["assets", "tmp", "vendor", "testdata"]
  exclude_file = []
  exclude_regex = ["_test.go"]
  exclude_unchanged = false
  follow_symlink = false
  full_bin = ""
  include_dir = []
  include_ext = ["go", "tpl", "tmpl", "html"]
  kill_delay = "0s"
  log = "build-errors.log"
  send_interrupt = false
  stop_on_error = true

[color]
  app = ""
  build = "yellow"
  main = "magenta"
  runner = "green"
  watcher = "cyan"

[log]
  time = false

[misc]
# to true will delete tmp folder when exit air
  clean_on_exit = false

[screen]
  clear_on_rebuild = false

```

Run the air command by passing the config using -c option:

```bash
$ air -c .air.toml
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

#### Go Testing

* go test command and testing package

* create file ending with _test.go

* contains functions aimed TestXXX with func (t *testing.T)

* run go test

  ```go
  // in package folder
  package <package>
  import ("testing")
  func TestFunction (t *testing.T){
    if(testresult == false || err != nil){
      t.Fatalf(`test result fatal message`)
    }
  }

  // in package folder
  $ go test
  $ go test -v	// get verbose output that lists all tests and results
  ```

### Compile and Install Application

* At project folder

  ```bash
  $ go build	# or
  $ go build .
  ```

* Execute program

  ```bash
  # On Linux or Mac
  $ ./program
  # On Window
  ~ program.exe

  ```

* Discover GO Install Path

  ```bash
  $ go list -f '{{.Target}}'
  ```

* Add Go Install Directory to system shell path

  ```bash
  # On Linux or Mac
  $ export PATH=$PATH:/path/to/your/install/directory
  # On Window
  $ set PATH=%PATH%;C:\path\to\your\install\directory
  ```



#### alternatively, 使用 go env 更改 GOBIN

* Change Install Target by setting the GOBIN variable

```bash
# Linux or Mac
$ go env -w GOBIN=/somewhere/else/bin
# Window
$ go env -w GOBIN=C:\path\to\your\bin
```

#### 回歸原始 GOBIN 設定

```bash
$ go env -u GOBIN
```

####

當設定好 shell ENV path

```bash
go install
# program can then be execute at any path (open new terminal to try)
```





