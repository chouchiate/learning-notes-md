### Restore Ownership of HOME and subfolders to USER

```bash
$ sudo chown -R $USER: $HOME
```

### Ubuntu Terminal Commands:

* remove folder

  * -r : recursive
  * -f: force

  ```bash
  $ sudo rm -r -f /path/
  ```

### Find PID occupying Port

* -n:
* -l:
* -p:
* grep:

```bash
$ sudo netstat -nlp | grep :80
```

### Find PID with list

* a

```bash
$ sudo ps -faux
```

### List folder with permission (read/write/exec)

* -l: show permission
* -a: show hidden

```
$ ls -la ./
```

### Verify Process Bound to Port

* -t:

* -u:

* -l:

* -p:

* -n

  ```
  $ sudo netstat -tulpn | grep :1883
  ```

  

