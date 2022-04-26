## [git] - Aliases

> Examples
```bash
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
```

> Goodies
```bash
# git status 
$ git config --global alias.gs status --untracked-files
# git add and commit
$ git config --global alias.gac git add . && git commit -m '

```

## Remove Alias
```bash
$ git config --global --unset alias.<alias_name>
```

## List Alias
```bash
# windows / powershell
$ git config --get-regexp alias

# osx / linux
$ git config --list | grep alias
```
