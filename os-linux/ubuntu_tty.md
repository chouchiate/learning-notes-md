## Ubuntu ttyUSB

### Find and List USB

```
dmesg | grep tty
```

### Use setserial

```
//install:
$ sudo apt install setserial

//list serial port and devices:
$ setserial -g /dev/ttyUSB[0123]

```



### Ubuntu PuTTY

