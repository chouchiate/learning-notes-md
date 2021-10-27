## [GOlang] - Beginner  學習筆記



#### Uninstall Old GO

```bash
$ which go
# eg. /usr/local/go/bin/go
# To Uninstall
$ sudo rm -rf /usr/local/go
$ sudo rm /etc/paths.d/go

```



#### Install GO with Homebrew

```bash
$ brew update && brew install golang
```



#### Setup Workspace

```bash
### Start Go Project

$ mkdir -p some/directory
$ cd some/directory
$ go mod init myApp.go

# Format your source code
$ go fmt myApp.go

# Run static analysis tool
$ golint myApp.go

# Build project to binary
$ go build myApp.go

```

#### Setup Environment

```bash
$ code ~/.bashrc
# edit .bashrc with
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

$ source ~/.bashrc
$ go version

```



#### Go Version Manager (GVM) - Run Multiple Version of Go

* Reference: https://github.com/moovweb/gvm

```bash
# Un-tested
$ bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
# List all go versions
$ gvm listall
# Use GVM to install go 
$ gvm install go1.16.2
$ gvm use go1.16.2 [--default]
```



#### Install Air

```bash
$ go get -u github.com/cosmtrek/air

# add to /.bashrc
$ which air
# /Users/xxx/go/bin/air
$ code ~/.bashrc
$ alias air=$HOME/go/bin/air
```



### Start Go Project

```bash
$ mkdir -p some/directory
$ cd some/directory
$ go mod init myApp.go

# Format your source code
$ go fmt myApp.go

# Run static analysis tool
$ golint myApp.go

# Build project to binary
$ go build myApp.go

```

