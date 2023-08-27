# [python] - venv setup for vs code

## Install virtualenv globally

* Create Terminal
  - ctrl + shift + p
```bash
$ pip3 install virtualenv
```

## create local venv in new project

* create and go to new folder
* create .venv
```bash
$ virtualenv .venv
```

* new .venv folder should be created
* turn off old vscode terminal
* Ctrl + shift + p >> Python: Select Interpreter
  - select './.venv/script/python within .venv folder
* Ctrl + shift + p >> Python: Create Terminal
* Local Python .venv is selected

## Remove local python venv
```bash
$ rm-rf .venv

```



