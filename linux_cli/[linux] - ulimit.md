## [linux] - ulimit

> dial tcp 127.0.0.1:27017: socket: too many open files
###
```bash
# as regular user
$ ulimit -n 8192

# check updated setting
$ ulimit -a

-t: cpu time (seconds)              unlimited
-f: file size (blocks)              unlimited
-d: data seg size (kbytes)          unlimited
-s: stack size (kbytes)             8176
-c: core file size (blocks)         0
-v: address space (kbytes)          unlimited
-l: locked-in-memory size (kbytes)  unlimited
-u: processes                       2666
-n: file descriptors                1048575

```