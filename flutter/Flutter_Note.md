## Flutter_Note

### Flutter Pad

```
https://dartpad.dev/flutter?
```

### 環境檢測 :

```
$ flutter doctor -v
```

![Image for post](https://miro.medium.com/max/60/1*0cCdt20uzLYaBzX12-M2gQ.png?q=20)

### 查詢版本：

```
$ flutter --version
```

### 更新Flutter：

```
$ flutter upgrade
```

### 查詢分支：

```
$ flutter channel
```

### 切換分支：

```
$ flutter channel dev
```

### 列出Flutter版本：

```
$ flutter version
```

### 切换到特定版本的 Flutter：

```
$ flutter version x.x.x
```

## 建立專案

建立專案時指定平台語言，iOS平台選擇Swift、Android平台選擇Kotlin。

```
$ flutter create --androidx --org your_organization -i swift -a kotlin myapp$ cd myapp
$ flutter run
```

## 語法說明：

- your_organization：使用反域名命名規範，全部使用小寫字母，例如：com.microprogram。
- myapp：App名稱使用小寫字母。

### 取得package：

```
$ flutter packages get
```

### 更新package：

```
$ flutter packages upgrade
```

### Widget Build：

```
class MyApp extends StatelessWidget {
	Widget build (BuildContext ctx){		// build function returns a Widget with input of BuildContext
		...
		return MaterialApp( );		// MaterialApp is a Widget class
	}
}
```

### Format Document

```
Shift + Option + F
```

### Setting.json

```
cmd + shift + p >> Preference/Configure Language Specific Setting
```

### Refactor from stateless to stateful widget

```
ctrl + shift + R
```



### final Vs const vs var





## 限制螢幕方向

```
class MyAPP extends StatelessWidget {  @override  Widget build(BuildContext context) {    SystemChrome.setPreferredOrientations(    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);    return MaterialApp(
```

# VSCode快速鍵

1. fn + F2 全局重新命名
2. Cmd + Shift + N 開啟編輯器新視窗
3. Cmd + Shift + P 開啟命令選擇區
4. Cmd + Shift + M 開啟問題顯示區
5. Cmd + Shift + O 尋找標籤區域
6. Cmd + Shift + S 另存新檔
7. Cmd + K, Cmd + 0 摺疊所有程式碼
8. Cmd + K, Cmd + J 取消摺疊所有程式碼
9. Cmd + Shift + L 一次選取檔案內所有相同的文字
10. Shift + Option + Up/Down Copy Line Up/Down


### Editor Key Bindings
* Ctrl+T (macOS: Cmd+T) - Show Workspace Symbols
* Ctrl+Shift+O (macOS: Cmd+Shift+O) - Show Document Symbols
* Ctrl+Shift+P (macOS: Cmd+Shift+P) - Open Command Palette
* Ctrl+Space (macOS: Option + Esc) - Open Code Completion
* Ctrl+. (macOS: Cmd+.) - Open Quick Fixes
* F2 - Rename Symbol
* Shift+Alt+F (macOS: Shift+Option+F) - Format Document
* F12 - Go To Definition
* Shift+F12 - Find References
* Alt+Shift+O - Organize Directives
* F4 - Show Type Hierarchy
### Debug Key Bindings
* Ctrl+Alt+D - Launch Dart DevTools
* F5 - Start Debugging
* Ctrl+F5 - Start Without Debugging
* Shift+F5 - Stop Debugging
* Ctrl+Shift+F5 (macOS: Cmd+Shift+F5) - Restart Debugging (or Hot Restart when debugging * Flutter apps)
* Ctrl+F5 - Hot Reload when debugging Flutter apps
* F9 - Toggle Breakpoint
* F10 - Step Over
* F11 - Step In
* Shift+F11 - Step Out