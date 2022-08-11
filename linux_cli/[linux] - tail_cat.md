## [linux] - tail / cat

### 查看檔案前10行
```bash
$ head -n10 /var/log/auth.log

```

### 查看檔案最後10行
```bash
$ tail -n10 /var/log/auth.log
```

### 查看檔案 10~15 行的內容
```bash
$ cat -n 15 /var/log/auth.log | tail -n 5

```

### 將內容重新定向至新擋
```bash
#將檔案前10行輸出至 /tmp/auth.log
head -n 10 /var/log/auth.log >> /tmp/auth.log

#將檔案最後10行輸出至 /tmp/auth.log
tail -n 10 /var/log/auth.log >> /tmp/auth.log
```