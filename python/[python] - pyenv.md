## [python] - pyenv notes

### install with homebrew
```bash
$ brew update
$ brew install pyenv
$ brew install openssl readline sqlite3 xz zlib
```

### 安裝目錄
* Home Folder
    - .pyenv 的資料夾，其中包含
        + versions (放置下載的所有 Python 版本),
        + shims (pyenv 用於截取使用者呼叫 python 的相關指令),
        + plugins (pyenv 相關的插件如管理虛擬環境的 pyenv-virtualenv、檢查安裝環境需求是否有誤的 pyenv-doctor 等),

versions 資料夾會放置下載的所有 Python 版本


### commands

* get pyenv installed versions
    ```bash
    $ pyenv versions
    ```

* pyenv install specific version
    ```bash
    $ pyenv install -v 3.7.2
    ```

* pyenv check where pip installed
    ```bash
    $ pyenv which pip
        /opt/homebrew/bin/pip
    ```

* pyenv set global python version
    ```bash
    $ pyenv global 3.10.4
    ```

* pyenv set local (application specific) python version
    ```bash
    $ pyenv local 2.7.18
    ```

* pyenv set shell specific python version
    ```bash
    $ pyenv shell 3.10.1
    ```

![](https://files.realpython.com/media/pyenv-pyramid.d2f35a19ded9.png)

* list all available cpython versions v3.6 through v3.8

    ```bash
    $ pyenv install --list | grep " 3\.[678]"
    3.6.0
    3.6-dev
    3.6.1
    3.6.2
    3.6.3
    3.6.4
    3.6.5
    3.6.6
    3.6.7
    3.6.8
    3.6.9
    3.6.10
    3.6.11
    3.6.12
    3.6.13
    3.6.14
    3.6.15
    3.7.0
    3.7-dev
    3.7.1
    3.7.2
    3.7.3
    3.7.4
    3.7.5
    3.7.6
    3.7.7
    3.7.8
    3.7.9
    3.7.10
    3.7.11
    3.7.12
    3.7.13
    3.8.0
    3.8-dev
    3.8.1
    3.8.2
    3.8.3
    3.8.4
    3.8.5
    3.8.6
    3.8.7
    3.8.8
    3.8.9
    3.8.10
    3.8.11
    3.8.12
    3.8.13

    ```


### External
* [real-python](https://realpython.com/intro-to-pyenv/)
* [pyenv-github](https://github.com/pyenv/pyenv)