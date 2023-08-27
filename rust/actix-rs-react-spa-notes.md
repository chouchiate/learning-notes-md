## Actix Web with React SPA 學習心得

##### 建立 前端, 新 React Project




##### 建立 Server, 新 Rust Project
```bash
#
cargo new project-folder
cd project-folder
```



##### 打開 Cargo.toml 增加以下 dependency (2021-05-23 latest dependencies)
```toml
[dependencies]
actix-web = "3"
futures = "0.3"
actix-files = "0.5"
bytes = "1"
env_logger = "0.8"
serde = "1.0.126"
serde_json = "1.0.64"
serde_derive = "1.0.126"
json = "0.12.0"
console = "0.14.0"
```

#### 官方網站
| Dependencies | Website URL | Description | 
| ------------ | ----------------- | ----------------- |
| actix-web    | https://actix.rs/ | |
| actix-identity | https://docs.rs/actix-identity/0.3.1/actix_identity/ | |
| actix-cors   | https://docs.rs/actix-cors/0.5.4/actix_cors/ | Cross Origin Resource Sharing control for Actix Web|
| actix-rt     | https://docs.rs/actix-rt/1.1.1/actix_rt/ | A runtime implementation that runs everything on the current thread. |
| actix-http   | https://docs.rs/actix-http/2.2.0/actix_http/ |  |
| actix-files  | https://docs.rs/actix-files/0.5.0/actix_files/ |  |
| chrono       | https://docs.rs/chrono/0.4.19/chrono/ | Date and Time for Rust  |
| futures      | https://github.com/rust-lang/futures-rs |   |
| bytes        | https://docs.rs/bytes/1.0.1/bytes/ |   |
| env_logger   | https://docs.rs/env_logger/0.8.3/env_logger/ |   |
| serde        | https://serde.rs/  |   |
| serde_json   | https://docs.serde.rs/serde_json/macro.json.html |   |
| serde_derive | https://serde.rs/derive.html |   |
| json         | https://docs.rs/json/0.12.4/json/ |   | 
| console      | https://docs.rs/console/0.14.1/console/ |    |
| rand         | | https://docs.rs/rand/0.8.3/rand/ | Random number generators and other randomness functionality. |


