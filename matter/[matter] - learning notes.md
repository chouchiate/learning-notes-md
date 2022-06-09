##[matter] - connectedhomeip notes


### Build Guide
* project_root > docs > guides > BUILDING.md

### macOS
```bash
$ export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:"/opt/homebrew/opt/openssl@3/lib/pkgconfig"
```

### build scripts for host system (macOS and Linux)
```bash
# This script takes care of downloading GN, ninja, and setting up a Python environment with libraries used
to build and test.
$ source scripts/activate.sh

gn gen out/host

ninja -C out/host
#
$ source scripts/bootstrap.sh
```


### external
* [github](https://github.com/project-chip/connectedhomeip/tree/test_event_7/examples/all-clusters-app/esp32)

