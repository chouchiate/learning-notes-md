## [node] - grpc.js M1 work around

### set npm config target to x86
```bash
$ npm_config_target_arch=x64 npm i grpc-tools
# do the rest
$ yarn install
```

### external
[stack-overflow](https://stackoverflow.com/questions/71420286/unable-to-install-grpc-tools-via-npm-or-yarn-on-mac-m1-chip)