## [go] - GOROOT and GOPATH

[]
### Quick fix encountering `go tool: no such tool "compile"` when running go build
* set GOROOT

```bash
# quick fix
export GOROOT=

# correct fix
The compile program should be in your go env GOTOOLDIR="/usr/local/go/pkg/tool/linux_amd64" directory. If not, download Go, delete /usr/local/go, and reinstall Go.

```


### set the GOPRIVATE variable, to avoid using the public servers to fetch private repositories

```bash
$ export GOPRIVATE=gitlab.namespace.com/private/repo
## export GOPRIVATE=gitlab.smart-aging.tech/devops/ms-go-kit

```
