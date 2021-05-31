# 不依賴 NetworkManager 啟用 wpa_supplicant

### from CentOS

較為簡單的方法令 wifi 介面在開機的過程中自動連線。

- 較易實踐
- 更完整的指引
- 無須修改在系統更新時會被覆蓋的檔案
- 支援以 service network restart 重新連線

## 1. 編輯 /etc/sysconfig/network-scripts/ifcfg- 檔

執行 iwconfig 來找出 wifi 裝置。在這個範例輸出，wlan0 是唯一支援 wifi 的裝置。

```bash
# iwconfig
lo no wireless extensions.

wlan0 IEEE 802.11bgn ESSID:"NETWORKSSID"
          Mode:Managed Frequency:2.462 GHz Access Point: 68:7F:74:AD:F3:3C
          Bit Rate=54 Mb/s Tx-Power=16 dBm
          Retry long limit:7 RTS thr:off Fragment thr:off
          Encryption key:off
          Power Management:on
          Link Quality=50/70 Signal level=-60 dBm
          Rx invalid nwid:0 Rx invalid crypt:0 Rx invalid frag:0
          Tx excessive retries:0 Invalid misc:90 Missed beacon:0

eth0 no wireless extensions.

pan0 no wireless extensions.

virbr0 no wireless extensions.

virbr0-nic no wireless extensions.

#
```

編輯這個介面的 ifcfg。就以 wlan0 為例：

```
/etc/sysconfig/network-scripts/ifcfg-wlan0
```

確保 ONBOOT 這個選擇已被啟用。

```
ONBOOT="yes"
```

## 2. 編輯 /etc/sysconfig/wpa_supplicant

請確保你的裝置已包含在此檔案的 INTERFACES 行內。在這個例子中，wlan0 是唯一獲 wpasupplicant 支援的裝置。

```bash
# Use the flag "-i" before each of your interfaces, like so:
# INTERFACES="-ieth1 -iwlan0"
INTERFACES="-iwlan0"
```

## 3. 編輯 /etc/wpa_supplicant/wpa_supplicant.conf

你多數的網絡都需要在 wpa_supplicant.conf 內擁有如下的設定一則。請為每個網絡填入相屬的 NETWORKSSID 及 NETWORKPSK 數值。請以你選用它們的優先次序來進行排序。

```yml
network={
        ssid="NETWORKSSID"
        scan_ssid=1
        key_mgmt=WPA-PSK
        psk="NETWORKPSK"
}
```

以下範例是一個不採用預先共享金鑰的網絡。要是它被放置於 any 網絡之前，它會比其它公開網絡獲優先選用。

```yaml
network={
        ssid="PUBLIC"
        key_mgmt=NONE
}
```

最後一個選項（你或許不想選用它）可讓你連線至任何公開網絡。這個選項在酒店很奏效，但可能會連線至不理想的網絡。

```
network={
        key_mgmt=NONE
}
```

## 4. 編輯 /etc/rc5.d/S09prepnet

貼入以下文字來建立一個新檔案，它會執行 wifi 連線所須的背景服務。

```bash
cat > /etc/init.d/prepnet <<EoT
#!/bin/sh

/etc/init.d/messagebus start
/etc/init.d/wpa_supplicant start
killall dhclient >/dev/null 2>&1
EoT
chmod a+rx /etc/init.d/prepnet
ln -s /etc/init.d/prepnet /etc/rc3.d/S09prepnet
ln -s /etc/init.d/prepnet /etc/rc5.d/S09prepnet
```

## 5. 設定在開機時執行的服務

Paste the following commands to configure services.

```bash
chkconfig messagebus off
chkconfig wpa_supplicant off
chkconfig NetworkManager off
chkconfig network on
```

## 6. 重新開機來啟用它

下次重新開機的時候，你的 wifi 連線在網絡服務啟動時便會被啟用。

## 7. 新增或編輯 wifi 網絡

如果你需要新增或編輯 wifi 網絡，請改動 wpa_supplilcant.conf。

```
/etc/wpa_supplicant/wpa_supplicant.conf
```

接著重新啟動 wpa_supplicant 及 network 服務。

```
service wpa_supplicant restart
service network restart
```

# 不依賴 NetworkManager 啟用 wpa_supplicant，原裝版

如果你像我一般，只會進出數個受 WPA 保護的無線網絡，而且想筆記型電腦在開機時連線到本地的無線網絡，這裡有一個簡單的方法。

請注意你可以利用 [NetworkManager](https://wiki.centos.org/zh-tw/HowTos/Laptops/NetworkManager) 來達成目的，但它預設不會在開機時連線到一個網絡 —— [NetworkManager](https://wiki.centos.org/zh-tw/HowTos/Laptops/NetworkManager) 需要一位用戶登入，並將金鑰環的存取權賦予它，好讓它能取回 WPA 金鑰。

這裡是一個啟用 wpa_supplicant 而不需要 [NetworkManager](https://wiki.centos.org/zh-tw/HowTos/Laptops/NetworkManager) 的方法，並且令電腦在開機時連線。你有必要編輯設定檔，因此假若你不太樂意這樣做，你應該考慮採用 [NetworkManager](https://wiki.centos.org/zh-tw/HowTos/Laptops/NetworkManager)。



## 1. 編輯 /etc/wpa_supplicant/wpa_supplicant.conf



你多數的網絡都會需要在 wpa_supplicant.conf 內擁有一個如此的記錄：



```
network={
        ssid="MYNETWORKSSID"
        scan_ssid=1
        key_mgmt=WPA-PSK
        psk="MYNETWORKPSK"
}
```



明顯地，你必須以你想連線的網絡的 SSID 及 PSK 來取代 MYNETWORKSSID 及 MYNETWORKPSK。



## 2. 編輯 /etc/sysconfig/network-scripts/ifup-wireless



請在這個檔案的底部加入下列內容：



```
if [ "$WPA" = "yes" -a -x /etc/init.d/wpa_supplicant ]; then
    /sbin/service wpa_supplicant start
fi
```





## 3. 編輯 /etc/sysconfig/network-scripts/ifcfg-*



在 /etc/sysconfig/network-scripts 內有數個描述網絡介面的檔案，例如 ifcfg-eth0（大概是你的乙太網絡），及一個名叫 ifcfg-wlan0 或 ifcfg-eth1 的檔案，用來描述你的無線網絡。

用來描述你的無線網絡介面的檔案應該含有以下一行：



```
TYPE=Wireless
```



請在這個檔案的底部加入以下一行：



```
WPA=yes
```





## 4. 編輯 /etc/rc.d/rc.local



我們現在已經設定 wpa_supplicant 在你的無線網絡介面啟動時一起啟動。很不幸地，CentOS 的腳本啟動次序並不正確 —— 它會嘗試在 DBUS 啟動前啟動無線網絡（並帶動 wpa_supplicant），然而 wpa_supplicant 需要 DBUS 才能連作。

最簡單快捷的解決方法就是在 /etc/rc.d/rc.local 的底部加入下面這行，讓你的無線網絡最遲啟動：



```
/sbin/ifup eth1
```



（如果你的無線介面是 wlan0，這便是 /sbin/ifup wlan0）。

這樣做會讓所需的程式預先執行，然後在開機過程結束時啟動無線介面及 wpa_supplicant。



## 5. 在開機時停用介面及 wpa_supplicant



由於我們在相關的網絡介面 ifup 腳本裡直接啟動 wpa_supplicant，我們無需在開機時利用 init 啟動它。請這樣停止它：



```
chkconfig wpa_supplicant off
```



你亦可以透過 Network Device Control 應用程式來阻止無線網絡介面（eth1 或 wlan0）於開機時自動啟動，這是由於我們在 rc.local 所做的改動會自行啟動這個介面。