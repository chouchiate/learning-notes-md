## [Mac] - 使用筆記

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