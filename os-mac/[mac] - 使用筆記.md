## [Mac] - 使用筆記

#### 在 desktop 開啟 root/user 資料夾
* @ any desktop
* press cmd + shift + G
* @ goto: type Users/ + enter
* finder will enter Users/


#### 在 Finder 顯示隱藏夾 隱藏資料
```bash
    Command + Shift + . (Period)
```

#### 在 Terminal 顯示 隱藏夾 隱藏資料
```bash
$ defaults write com.apple.Finder AppleShowAllFiles true
$ killall Finder

```

#### 在 Terminal 隱藏 隱藏夾 隱藏資料
```bash
$ defaults write com.apple.Finder AppleShowAllFiles false
$ killall Finder
```

#### force quit mac shortcut
* On your keyboard, press and hold Command + Option + Esc.
* It will immediately bring up a “Force Quit Application” window.

#### Copy Folder
* -R 旗標會讓 cp 拷貝檔案夾和其內容。請注意，檔案夾名稱並不會以斜線結尾，那樣會更改 cp 拷貝檔案夾的方式。
```bash
cp -R ./esp-idf-template ./esp32_mqtt_led_display
```

#### Move Folder
* move one file

```bash
mv ~/Downloads/MyFile.txt ~/Documents/Work/MyFile.txt
```

* Move one file and rename
```bash
mv ~/Downloads/MyFile.txt ~/Documents/Work/NewFileName.txt
```