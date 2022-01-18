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

### **List USB Ports**
```bash
$ ls /dev/tty.usb*
/dev/tty.usbserial-DO02K4IH
$ ls /dev/cu.*
zsh: no matches found: /dev/cu.*
```

### **Connect With Screen**

screen /dev/tty.usbserial-DO02K4IH **Baudrate**

> To Quit: the screen app, type CTRL-A, then CTRL-\.


### Output log to File in a Screen Session
```bash
script -a -t 0 out.txt screen /dev/tty.usbserial-DO02K4IH 115200
```
* script: A built-in application to "make a typescript of terminal session"
* -a: Append to output file
* -t 0: Time between writing to output file is 0 seconds, so out.txt is updated for every new character
* out.txt: Output file name
* screen /dev/ttyUSB0 115200: Command connecting to an external device via TTY
