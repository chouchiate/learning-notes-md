## [go] - disassembling methods

### go assembly documentation
* [doc](https://go.googlesource.com/go/+/refs/heads/dev.regabi/doc/asm.html)

### go tool
```bash
$go tool objdump EXECUTABLE_FILE > ASSEMBLY_FILE

$go tool objdump -S EXECUTABLE_FILE

$go-objdump EXECUTABLE_FILE | less -R
```
* [discuss](https://stackoverflow.com/questions/23789951/easy-to-read-golang-assembly-output)

### otool (macOS with xcode only)
```bash
$otool -tV <executable>
## for example
$otool -tV ./tool/change_humetrics_wifi/bin/change_humetrics_wifi_m1 > ./bin/change_humetrics_wifi_m1.s
```

### delve

```bash
# Install the latest release:
$ go install github.com/go-delve/delve/cmd/dlv@latest

$ xcode-select --install

```

### GDB
> Note that Delve is a better alternative to GDB when debugging Go programs built with the standard toolchain. It understands the Go runtime, data structures, and expressions better than GDB. Delve currently supports Linux, OSX, and Windows on amd64. For the most up-to-date list of supported platforms, please see the Delve documentation.

### Ghidra
* [Reverse Engineering Go Binaries with Ghidra](https://cujo.com/reverse-engineering-go-binaries-with-ghidra/)

