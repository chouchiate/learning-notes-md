## [zsh] - 學習筆記

#### 解決 zsh 下 brew install command 跳出 not writeable 
```bash
Error: The following directories are not writable by your user:
/usr/local/share/zsh
/usr/local/share/zsh/site-functions
```
#### 輸入以下command
```bash
# $(whoami) = currnet user
$ sudo chown -R $(whoami):admin /usr/local/* \ && sudo chmod -R g+rwx /usr/local/*

$ brew cleanup

$ source ~/.zshrc

$ brew install <cask_you_want_to_install>
```

