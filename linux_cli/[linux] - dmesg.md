## [linux] - dmesg note

> display message

* kernel saves startup message in 'ring buffer'.
* readable with dmesg.
* saved in /var/log

### parameters
* read-clear: -c, display message and clear ring buffer
* --buffer-size, -s <buffer size>, default: 8196, size of ring buffer
* -n set log message level

### save log to file
```bash
#  //查看当前所在目录
$ pwd
> /home/hnlinux/
# //将开机信息保存到 boot.msg文件中
$ dmesg > boot.msg
# //显示当前目录文件
$ ls
> boot.msg
```

### external
[manual](http://https://man7.org/linux/man-pages/man1/dmesg.1.html)