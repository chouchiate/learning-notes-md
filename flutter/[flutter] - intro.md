## 什麼是 Flutter ?

Flutter 是由 Google 主導的開源跨平台軟體框架 (Framework)，使用的程式語言為 Dart ，單一套程式可以同時運行在目前最火紅的雙行動平台 Android 和 iOS 上，是一件很值得投資學習的程式語言與架構。

## Flutter v.s React Native

| 框架 | Flutter | React Native |
| - | - | - |
| Hot Reload |支援	|支援
| 發展時間 | 2017年 | 2015年 |
| Component | 由Google Team開發 | 預設的較少,基本上需要第三方支援 |
| 程式語言 | Dart | JavaScript
| 文件 | 非常詳細易讀 | 第三方Library文件品質不一
| 社群 | 發展中 | 成熟
| 效能 | 直接轉成native code| 需透過Bridge與平台溝通
| App大小 | 較小| 較大

### Native Code

原生語言運行效能最好，但每個平台皆需各維護一套程式語言。

![Native Code](https://i.imgur.com/yqnQEUK.png)

### Reactive

圖中 Bridge 指的是 Reactive SDK，因為要透過 Bridge 來跟平台溝通導致整體運行效能上較差。

![Reactive](https://i.imgur.com/MO2BDzT.png)

### Flutter

Flutter 革命性的變化，就是將 Widget 拉到 SDK 這一層，透過 Dart 虛擬機器，不用還要透過 Bridge 轉換才能繪製出，按鈕、文字框…等畫面，大幅提升運行效能。

![Native Code](https://i.imgur.com/8Qhzuuh.png)

## Flutter 先修班

- [Dart官方文件](https://dart.dev/docs)
- [Dart中文學習資料](https://tw-hkt.blogspot.com/2019/08/2019-dart-83.html)

## Flutter 學習資源

- [Flutter官方文件](https://flutter.dev/docs)
- [Flutter中文學習資料](http://tw-hkt.blogspot.com/2019/11/2019-flutter-30-1117.html)
- [Flutter Youtube 教學](https://www.youtube.com/c/TheFlutterWay)

## Hello World

```Dart
// 載入 material 函式庫
import 'package:flutter/material.dart';

// main 是 Dart 程式，最一開始的進入點
void main() {
// runApp 是 Flutter 程式進入點，若沒有載入上方 material 函式庫，將會不認識 runApp。
// 放在 Center 容器裡面 Text 的元件，將會被放置在畫面的正中間
  runApp(Center(
    child: Text(
      'Hello World',
      textDirection: TextDirection.ltr,
    ),
  ));
}
```

<img src="../img/flutterhelloworld.png" width="300" />

## Material 設計指南

Flutter 是由 Google 主導研發出來的開源跨平台軟體框架，所以畫面設計樣式風格，官方當然也建議採用 Material Design。
Material Design ，材質設計是由 Google 開發的設計語言 。定義畫面中的的布局方式、回應動畫與過渡、填充、深度效果（如光線和陰影）等。詳細可以參考 [Material Design 官網介紹](https://material.io/design/)


### 使用 Material 樣式主題

```Dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Center(
        child: Text('Jubo'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyan,
        child: Text(
          'Welcome!',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        )
      ),
    ),
  ));
}
```
<img src="../img/flutterhelloworldmaterial.png" width="300" />

## Widget

在 Flutter 中，只要是與使用者介面相關的資訊，幾乎都跟 Widget 有關，開發者主要就是使用 Widget 描述畫面，文字、圖片、Icon 等使用者介面元件，都使用 Widget 來描述，看不到的東西也是 Widget，例如佈局相關的描述，也是使用 Widget。

Flutter 應用程式的進入點，就是接受 Widget 的 runApp，而當中接收的 Text，就是個 Widget 的子類後裔，嚴格來說，是 StatelessWidget 的子類。

> Widget > StatelessWidget > Text

### 常用基礎 Widget
- Scaffold
- Container
- Center
- Row
- Column
- Text
- CheckBox
- Image
- GridView
- ListView

### 階層關係圖

<img src="https://i.imgur.com/zuFSNCU.png" width="600" />
<img src="https://i.imgur.com/xjOOu5T.png" width="600" />

## Flutter 處理畫面的兩種狀態

在 Flutter 狀態分為兩種，一種是無狀態(StatelessWidget)和另一種有狀態(StatefulWidget)

- 無狀態(StatelessWidget)：初始化後都不會改變狀態的 widget。

- 有狀態(StatefulWidget)：StatefulWidget 可以透過 setState 再一次重繪。

### StatelessWidget (無狀態) 範例程式碼

```Dart
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
      child: Text('Jubo'),
    ));
  }
}
```
<img src="../img/flutterstatelesswidget.png" width="300" />

### 有狀態(StatefulWidget) 範例程式碼

```Dart
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(Center(child: Time()));

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_dateTime}'.substring(0, 19),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
  }
}
```

<img src="../img/flutterstatefulwidget.png" width="300" />