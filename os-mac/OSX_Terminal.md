## OSX_Terminal

### Live PID List

```bash
% top
// exit
ctrl+c
```



### Handle - zsh compinit: insecure directories

```bash
$ zsh compinit: insecure directories, run compaudit for list. 
$ Ignore insecure directories and continue [y] or abort compinit [n]? 
```

```bash
$ cd /usr/local/share/zsh 
$ sudo chmod -R 755 ./site-functions 
```

