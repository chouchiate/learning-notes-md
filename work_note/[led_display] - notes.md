## [led_display]

### 10-20-2022

[事件送出方式]
目前的架構下，事件只能以 *事件清單* 的方式送出，假若事件有新增、取消則需要由Jubo送新的事件清單，所以不會有 *新增輪播事件* & *刪除輪播事件* 。
有這個限制的話，會大幅影響我們的使用方式及實作。
考慮要快速上線的 current phase，我建議：
當發生 Line notification 時，使用事件清單 (但僅包含一筆事件) 的方式送到顯示器去顯示
隨後發生的 Line notification，也使用事件清單 (但僅包含一筆事件) 的方式送到顯示器去顯示
也就是，只假設只能顯示一筆事件；且該事件不能收回，只能透過新事件去覆蓋
機構端面對顯示器收到事件且響鈴的 SOP：
只能去按壓顯示器的按鈕靜音，否則無其他手段
next phase 則再考慮 (need a more serious system design)：
在 server side 替每一個顯示器維護 priority queue，來因應我們彈性地新增/刪除需求
屆時才可利用事件清單的方式，將這個 priority queue 整批推送給顯示器去顯示
機構端面對顯示器收到事件且響鈴的 SOP：
去按壓顯示器的按鈕靜音
server side 有機會因為 priority queue 被清空，將顯示器的事件完全清除、因而解除警報
---
中文要直接送big5的16進制，不能是UTF8
我調查了一下 MQTT protocol 的規格，要能解析 MQTT，應用程式端一定要具備解析 utf8 編碼的能力。(e.g. 參考 MQTT Version 3.1.1 - 3.1.3.2 Topic，已規範 Topic 必須用 utf8 encoded string 來傳輸/解析)
所以技術上來說，對方應用程式收到 utf8 encoded 中文字串時，應有能力靠自己轉成 big5 編碼，再餵給自己的顯示器。
當然，我是用軟體工程思維來考慮，認為這種底層的轉換應被封裝在底層模組 (i.e. 顯示器搭載的軟體應用)。倘若不是技術上的硬限制，是考慮到對小機器來說效能真的很傷，那我們恐也只能遵循。
如果要先自行將中文字轉成 big5 16進制字串，也未嘗不可。我會在協議中描述清楚：
MQTT payload 仍然是 utf8 編碼字串，來描述所有的字元
但我們會先將要呈現的中文字轉換成 big5 編碼的 16進制英文
e.g. 下面兩個都仍然是 utf8 encoded string
原始版本直接傳："勤洗手保健康"
事先轉好的版本：B6D4AC7EA4E2AB4FB0B7B164
(這邊的規格描述我擔心仍有認知落差，需要再三確認。)
那我可以接受這是為了盡快進入市場做驗證所做的 trade-off。
但我要提醒，這種客製化因為不標準，所以對我們整體的可規模化考量來說是種傷害。
(這部分需要
@Derick 周佳德
 的專業見解，需要了解我對廠商/硬體設備的期待會不會太過分)
---
[其他事項]
1. *Wifi設定* 僅可設定一組連線，無法自動切換信號品質較好的連線
這個限制對我們場域佈建的 SOP 有影響，
@AC
 須知曉。
2. *事件輪詢週期設定* 不可設定，看板固定3秒輪秀
假設我們會推送 5 個緊急事件，表示每個事件 show 3 秒。
@AC
 須知曉。
3. *事件輪詢週期設定* 事件取消後如沒有輸入文宣，一定是西元萬年曆
看起來這預設行為 OK。我們應該可以視為，當沒有緊急事件需要呈現時，顯示器就變成時鐘而已。
---
[請問]
1. 看板同時是訂閱者與發布者嗎?
是的，我們期望看版 (顯示器) 除了訂閱來自我們的雲端的消息 (i.e. 緊急事件的推送)，也要能夠發布設備的狀態至我們的雲端，以利排錯。
因此規劃了 upstream 的 topics 希望設備遵循。
2. QOS要設多少
1 足矣。
3. API是否需要加設定IP
這是個有趣的問題，我覺得應該不需要。
因為我們沒有計畫要在現場搞複雜的網路拓墣，所以我們要求廠商的設備要能直接自己透過 WiFi 連上 internet。
透過機構的 WiFi 連上 internet，該設備就會被自動派發 IP。
所以我們應沒有適當的機會與情境、也沒有必要去固定設備的 IP。
4. 看板需要顯示文宣?
我們的使用情境應只需要他們的「事件」功能。
有事件被推送到看板，就顯示文字+響鈴；
沒事件了，就將看板的文字清掉 -> 恢復成時鐘狀態。

alarm only play one time,