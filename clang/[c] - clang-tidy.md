## [c] - Clang-Tidy

### Ubuntu Install
```bash
$ sudo apt-get install clang-tidy
```

### MacOs Install
```bash
$ brew install fmenezes/tap/clang-tidy

==> cmake -S /private/tmp/clang-tidy-20220719-4825-1v02br6/llvm-project-14.0.0.src/llvm -B build -DLLVM_ENABLE_PROJECTS=clang;clang-tools-extra
==> cmake --build build --target clang-tidy
...

$ clang-tidy
    OPTIONS:
    Generic Options:
        --help
        --version
    ...

```


### Install clang-tidy extendsion in vscode
(clang-tidy notskm.clang-tidy)

### Edit setting.json

```json
"clang-tidy.checks": [

]

```

### List available checks in terminal
```bash
clang-tidy --list-checks -checks='*'
```


### external
* [doc](https://clang.llvm.org/extra/clang-tidy/)