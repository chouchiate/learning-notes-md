## [Mac] - Terminal 使用筆記

### Live PID List

```bash
% top
// exit
ctrl+c
```

### 查詢目前使用中的 port 及 process id
```bash
lsof -n -i | grep LISTEN
```
### 查詢特定 port 的服務，以 80 port 為例
  * Old

  ```bash
  $ lsof -n -i:80 | grep LISTEN
  ```
  * Better

  ```bash
  $ sudo lsof -nP -iTCP:$PORT | grep LISTEN
  ```

### Kill Process by PID
  ```bash
  $ sudo kill -9 <pid>
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

