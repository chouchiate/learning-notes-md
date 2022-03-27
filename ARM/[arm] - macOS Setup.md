## [ARM] - macOS GCC Setup

### Eclipse
    -
    -
    -

### XPM install
```bash
npm install --global xpm@latest
```

#### Using homebrew
* Install brew cask
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
```

* Install gcc-arm-embedded with following:

```bash

$ brew install --cask gcc-arm-embedded
```

* Package Version: Package name is gcc-arm-none-eabi-10-2020-q4-major-mac

#### Download Official Package

* Choose Mac OS X 64-bit Package (Signed and notarized)
* [GNU Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)

#### Check arm-none-eabi-gdb version

```bash
$ arm-none-eabi-gdb --version
```

### Install FSF/GNU binutils for cross-compiling to arm-linux for MAC with homebrew
```bash
$ brew install arm-linux-gnueabihf-binutils
```

#### external
* [link](https://brewinstall.org/install-gcc-arm-embedded-mac-osx/)