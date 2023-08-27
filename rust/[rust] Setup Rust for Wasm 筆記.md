## [rust] - Setup Rust for WebAssembly 筆記

### Run following in terminal
```bash
$ curl https://sh.rustup.rs -sSf | sh
```
### or in OSX
 ```bash
 $ brew install rustup
 $ rustup-init
 ```

### enable nightly-toolchain
 ```bash
 $ rustup default nightly
 ```

### Add wasm32 to target
 ```bash
 $ rustup target add wasm32-unknown-unknown
 ```

### Install wasm-pack using cargo
```bash
$ cargo install wasm-pack
```

### Install wasm-gc using cargo
```bash
$ cargo install wasm-gc
```
### Install https using cargo for a web-server
```bash
$ cargo install https
```


