## [ot-nrf] - NRF52833 Work Notes


### GNU Toolchain installation

```bash
lorem@lorems-MacBook-Pro  ~/Programming/ot/ot-nrf528xx   main  ./s
cript/bootstrap
++ dirname ./script/bootstrap
+ ./script/../openthread/script/bootstrap
+ main
+ install_packages
+ PM=source
+ command -v apt-get
+ command -v rpm
+ command -v opkg
+ command -v brew
/opt/homebrew/bin/brew
+ PM=brew
+ install_packages_brew
+ echo 'Installing toolchain dependencies...'
Installing toolchain dependencies...
+ brew install automake libtool cmake ninja shfmt shellcheck
Running `brew update --auto-update`...
==> Auto-updated Homebrew!
Updated 4 taps (bufbuild/buf, homebrew/core, homebrew/cask and mongodb/brew).
==> New Formulae
aws2-wrap
berkeley-db@5
burst
c2rust
cargo-crev
cargo-depgraph
censys
chain-bench
cpp-httplib
cql-proxy
create-api
crytic-compile
dsda-doom
dura
enex2notion
felinks
gaze
gcc@11
gcem
ghorg
git-delete-merged-branches
git-sync
go@1.18
gum
hyx
jupp
ksh93
libbpf
libeatmydata
libvatek
linux-headers@5.15
lucky-commit
mesheryctl
mongodb/brew/mongodb-community-shell@4.2
mongodb/brew/mongodb-community-shell@4.4
mongodb/brew/mongodb-community@5.0
mongodb/brew/mongodb-enterprise
mongodb/brew/mongodb-enterprise@4.2
mongodb/brew/mongodb-enterprise@4.4
mongodb/brew/mongodb-enterprise@5.0
mongodb/brew/mongodb-mongocryptd@5.0
nmrpflash
ocl-icd
onlykey-agent
open62541
openvi
ouch
page
pint
pkcs11-tools
pocl
prql-compiler
prr
purescript-language-server
pymupdf
rdb
ripsecrets
rush-parallel
sgr
slither-analyzer
smap
snapcast
solc-select
spr
svt-av1
swiftdraw
tere
tlsx
treefmt
tuntox
vile
vulkan-loader
x86_64-linux-gnu-binutils
==> New Casks
aliwangwang            httpie                 reverso
calhash                imhex                  shop-different
chromium-gost          iqmol                  tl-legacy
decentr                livebook               trunk-io
drawpile               micromamba             v2ray-unofficial
duckduckgo             moderndeck             ved
filen                  nanoem                 virtualbuddy
fresh                  playcover-community    workman
gittyup                polypad                yubihsm2-sdk
glance-chamburr        qspace-pro
goxel                  qwerty-fr

You have 37 outdated formulae and 1 outdated cask installed.
You can upgrade them with brew upgrade
or list them with brew outdated.

Warning: Treating cmake as a formula. For the cask, use homebrew/cask/cmake
Warning: automake 1.16.5 is already installed and up-to-date.
To reinstall 1.16.5, run:
  brew reinstall automake
Warning: libtool 2.4.7 is already installed and up-to-date.
To reinstall 2.4.7, run:
  brew reinstall libtool
cmake 3.23.2 is already installed but outdated (so it will be upgraded).
Warning: ninja 1.11.0 is already installed and up-to-date.
To reinstall 1.11.0, run:
  brew reinstall ninja
Warning: shfmt 3.5.1 is already installed and up-to-date.
To reinstall 3.5.1, run:
  brew reinstall shfmt
Warning: shellcheck 0.8.0 is already installed and up-to-date.
To reinstall 0.8.0, run:
  brew reinstall shellcheck
==> Downloading https://ghcr.io/v2/homebrew/core/cmake/manifests/3.24
#=#=#                                                                ##O#-#                                                               ######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/cmake/blobs/sha256:c
==> Downloading from https://pkg-containers.githubusercontent.com/ghc
#=#=#                                                                ##O#-#                                                                                                                                                                                                         #                                                                    ####                                                                 ##########                                                           #####################                                                ############################################                         #################################################################### ######################################################################## 100.0%
==> Upgrading cmake
  3.23.2 -> 3.24.1

==> Pouring cmake--3.24.1.arm64_monterey.bottle.tar.gz
==> Caveats
To install the CMake documentation, run:
  brew install cmake-docs

Emacs Lisp files have been installed to:
  /opt/homebrew/share/emacs/site-lisp/cmake
==> Summary
🍺  /opt/homebrew/Cellar/cmake/3.24.1: 3,106 files, 43.8MB
==> Running `brew cleanup cmake`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /opt/homebrew/Cellar/cmake/3.23.2... (3,043 files, 42.2MB)
Removing: /Users/lorem/Library/Caches/Homebrew/cmake--3.23.2... (14.1MB)
==> `brew cleanup` has not been run in the last 30 days, running now.
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /Users/lorem/Library/Caches/Homebrew/brotli--1.0.9... (993.3KB)
Removing: /Users/lorem/Library/Caches/Homebrew/c-ares--1.18.1_1... (156.7KB)
Removing: /Users/lorem/Library/Caches/Homebrew/ca-certificates--2022-04-26... (121.8KB)
Removing: /Users/lorem/Library/Caches/Homebrew/dfu-util--0.11... (53.9KB)
Removing: /Users/lorem/Library/Caches/Homebrew/gforth--0.7.3_3... (1MB)
Removing: /Users/lorem/Library/Caches/Homebrew/grpcurl--1.8.6... (11.6MB)
Removing: /Users/lorem/Library/Caches/Homebrew/icu4c--70.1... (28.0MB)
Removing: /Users/lorem/Library/Caches/Homebrew/kustomize--4.5.5... (6.2MB)
Removing: /Users/lorem/Library/Caches/Homebrew/libevent--2.1.12... (698.2KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libffi--3.4.2... (170.5KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libtasn1--4.18.0... (159.4KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libtool--2.4.7... (1MB)
Removing: /Users/lorem/Library/Caches/Homebrew/m4--1.4.19... (256.0KB)
Removing: /Users/lorem/Library/Caches/Homebrew/utf8proc--2.7.0... (175.8KB)
Removing: /Users/lorem/Library/Caches/Homebrew/xz--5.2.5... (414.8KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libuv_bottle_manifest--1.44.1... (6.3KB)
Removing: /Users/lorem/Library/Caches/Homebrew/grpcurl_bottle_manifest--1.8.6... (6.1KB)
Removing: /Users/lorem/Library/Caches/Homebrew/brotli_bottle_manifest--1.0.9... (8.5KB)
Removing: /Users/lorem/Library/Caches/Homebrew/ninja_bottle_manifest--1.10.2_1... (6.1KB)
Removing: /Users/lorem/Library/Caches/Homebrew/cmake_bottle_manifest--3.22.3... (10.3KB)
Removing: /Users/lorem/Library/Caches/Homebrew/m4_bottle_manifest--1.4.19... (7.0KB)
Removing: /Users/lorem/Library/Caches/Homebrew/utf8proc_bottle_manifest--2.7.0... (6.4KB)
Removing: /Users/lorem/Library/Caches/Homebrew/chuck_bottle_manifest--1.4.1.0... (6KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libnghttp2_bottle_manifest--1.47.0... (6.3KB)
Removing: /Users/lorem/Library/Caches/Homebrew/node_bottle_manifest--17.7.2... (13.4KB)
Removing: /Users/lorem/Library/Caches/Homebrew/openssl@1.1_bottle_manifest--1.1.1m... (7.6KB)
Removing: /Users/lorem/Library/Caches/Homebrew/tmux_bottle_manifest--3.2a_1... (8.5KB)
Removing: /Users/lorem/Library/Caches/Homebrew/go_bottle_manifest--1.18... (7.3KB)
Removing: /Users/lorem/Library/Caches/Homebrew/c-ares_bottle_manifest--1.18.1_1... (6.3KB)
Removing: /Users/lorem/Library/Caches/Homebrew/ca-certificates_bottle_manifest--2022-03-29... (1.8KB)
Removing: /Users/lorem/Library/Caches/Homebrew/go_cache... (9 files, 28.7KB)
Removing: /Users/lorem/Library/Caches/Homebrew/node_bottle_manifest--17.8.0-1... (13.4KB)
Removing: /Users/lorem/Library/Caches/Homebrew/ca-certificates_bottle_manifest--2022-03-18... (1.8KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libusb_bottle_manifest--1.0.25... (7.4KB)
Removing: /Users/lorem/Library/Caches/Homebrew/dfu-util_bottle_manifest--0.11... (8.5KB)
Removing: /Users/lorem/Library/Caches/Homebrew/openssl@1.1_bottle_manifest--1.1.1n... (7.6KB)
Removing: /Users/lorem/Library/Caches/Homebrew/gforth_bottle_manifest--0.7.3_3... (10.4KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libevent_bottle_manifest--2.1.12... (9.3KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libffi_bottle_manifest--3.4.2... (7.2KB)
Removing: /Users/lorem/Library/Caches/Homebrew/icu4c_bottle_manifest--70.1... (7.1KB)
Removing: /Users/lorem/Library/Caches/Homebrew/libtool_bottle_manifest--2.4.7... (7.0KB)
Removing: /Users/lorem/Library/Caches/Homebrew/Cask/gcc-arm-embedded--11.2-2022.02.pkg... (847.5MB)
Removing: /Users/lorem/Library/Logs/Homebrew/clang-format... (64B)
Removing: /Users/lorem/Library/Logs/Homebrew/clang-tidy... (8 files, 12.8MB)
+ echo 'Installing GNU Arm Embedded Toolchain...'
Installing GNU Arm Embedded Toolchain...
+ brew tap ArmMbed/homebrew-formulae
+ brew install armmbed/formulae/arm-none-eabi-gcc
Warning: armmbed/formulae/arm-none-eabi-gcc 10.3-2021.07 is already installed, it's just not linked.
To link this version, run:
  brew link arm-none-eabi-gcc
+ command -v gcc
/usr/bin/gcc
+ echo 'Installing pretty tools useful for code contributions...'
Installing pretty tools useful for code contributions...
+ CLANG_FORMAT_VERSION='clang-format version 9'
+ command -v clang-format-9
+ command -v clang-format
/opt/homebrew/bin/clang-format
+ clang-format --version
+ grep -q 'clang-format version 9'
+ brew install llvm@9
llvm@9: The x86_64 architecture is required for this software.
Error: llvm@9: An unsatisfied requirement failed this build.
++ brew --prefix llvm@9
+ sudo ln -s /opt/homebrew/opt/llvm@9/bin/clang-format /usr/local/bin/clang-format-9
Password:
+ python3 -m pip install yapf
Collecting yapf
  Downloading yapf-0.32.0-py2.py3-none-any.whl (190 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 190.2/190.2 KB 1.1 MB/s eta 0:00:00
Installing collected packages: yapf
Successfully installed yapf-0.32.0
WARNING: You are using pip version 22.0.4; however, version 22.2.2 is available.
You should consider upgrading via the '/Users/lorem/.pyenv/versions/3.10.4/bin/python3 -m pip install --upgrade pip' command.
+ echo 'bootstrap completed successfully.'
bootstrap completed successfully.
 lorem@lorems-MacBook-Pro  ~/Programming/ot/ot-nrf528xx   main 
```


### Build Sample Project

```bash
$ ./script/build nrf52833 UART_trans

```

#### Navigate to the directory with the OpenThread RCP binary, and convert it to hex format
```bash
$ cd ~/src/ot-nrf528xx/build/bin
$ arm-none-eabi-objcopy -O ihex ot-rcp ot-rcp.hex

```
