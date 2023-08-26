## Python and PIP

### Install pip2.7 raw
```bash
# install
$ wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
$ sudo python2.7 get-pip.py
$ which pip2.7

## uninstall
$ sudo pip2.7 uninstall pip
```

### Install python2.7 with pyenv
```bash
$ brew install pyenv
$ pyenv install 2.7.18

```
### check
```bash
#PATH
$ echo $PATH

#python2.7


#python3

```

### Use pip2.7 commands
```bash
python2.7 -m pip <commands>
```

### Upgrade pip
```bash
python -m pip install --upgrade pip
```
### List installed packages
```bash
$ pip list
$ pip freeze
```

### nrfutil
```bash
# v2.7
pip2.7 install nrfutil
# v3
pip install nrfutil
```

### esptool
* Install module with PIP3

  ```bash
  $ sudo pip3 install esptool
  ```

### Build from Gzipped Tarball (Linux)
```bash
$ wget https://www.python.org/ftp/python/3.7.18/Python-3.7.18.tgz

$ tar -zxvf Python-3.7.18.tgz

$ cd Python-3.7.18

$ ./configure --with-ssl

$ sudo make install

$ which python3
  /usr/bin/python3
```
```