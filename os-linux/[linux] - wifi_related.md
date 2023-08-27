## [linux] 0 Wifi Related 問題

#### **無綫網卡被軟禁**

1. 先檢察系統到底能不能正常偵測到無線網卡。
```bash
iwconfig

wlp5s0  IEEE 802.11 ESSID:...

```

2. 嘗試著開啟無線網卡，看看是甚麼樣的錯誤訊息。
```bash
sudo ifconfig wlp5s0 up

SIOCSIFFLAGS: Operation not possible due to RF-kill
```
> 上面的錯誤訊息 代表你的無線功能被關掉了

```bash
ip a

...
3. wlp5s0: <BROADCAST, MULTICAST> ...
    link/ether ...
```
4. 用rfkill去進行檢查
```bash
sudo rfkill list

0: tpacpi bluetooth sw: Bluetooth
        Soft blocked: yes
        Hard blocked: no
1: phy0: Wireless LAN
        Soft blocked: yes
        Hard blocked: no
```
> 檢查無線狀態 (看到Soft blocked ：yes 代表軟體被關掉了 WIFI功能被關掉了 )
5. 從軟體上打開WIFI功能
```bash
sudo rfkill unblock wifi
```
6. 嘗試著開啟無線網卡 again
```bash
sudo ifconfig wlp5s0 up
```