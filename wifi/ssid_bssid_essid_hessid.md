## [Wifi] - what is ssid, bssid, essid, hessid

SSID: AP 設定的字串格式(2 ~ 32 bytes)名稱 方便使用者辨識 一台 AP 可設定多個 SSID 讓屬於同個 ESS 的 BSS 可以虛擬化分割


BSSID: AP 的 MAC Address (6 bytes), 一個 AP 無線所涵蓋的範圍及 BSS
 
ESSID: 字串格式 (2~32 bytes), 802.11f 所定義, ESS 為多個 BSS 所集成, 多個 AP 後面必須有 Controller 設定每個 AP 帶有相同 ESSID。 STA 可以在同一個 ESS 內不同的 BSS 範圍內 Roaming 亦視為相同網路區域。 非 Global Unique

HESSID: Mac Address 格式 (6 bytes), Global Unique, 取多個 BSS 的其中一個 MAC Address, ㄧ樣是由多個 AP 後端 Controller 選定 ESS 內其中一個 BSSID 當作此 ESS 的 HESSID