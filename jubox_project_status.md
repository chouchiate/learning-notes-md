10-22-2021

1. Jubo-Box
  維思 Humetrics
    - (維1) Mqtt API / Device / Event Schema / Grpc API - 進行中
    - (維2) 維思將開通 Mqtt broker 後開始測試 Jubo-box - 下週開始 
    - (維3) Mqtt adapter and logic to jubo-space grpc - 下週開始
    - (維8) 廠商樣品測試 - 待廠商提供
    - (維9) Device Management

2. Jubo-space-backend
  以 patient 為主的 history
    - (歷1) NIS-Patient checkin/checkout record - 已完成 (local/development)
    - (歷2) Device Install/Uninstall record - 進行中 (local)
    - (歷3) Patient-History-API with Device/Room Change - 尚未開始
  
  設備更換房間 API - 已完成 (local/development)

  維思 Humetrics
    - (維4) 維思相關 Grpc to Postgres and restfulApi - 待(維3)完成後開始

  Bug-fix
    緊急通報解除後卡片反白 - 後台


3. Jubo-space-frontend
  以 patient 為主的 history
    - (歷4) 以 patient 為主的 history detail (monthly with pagination) - 尚未開始

  維思 Humetrics
    - (維5) 維思 Monitor - 尚未開始
    - (維6) 維思 Setting - 尚未開始
    - (維7) 維思 History - 尚未開始

  Bug-fix
    fix 世大 setting page 錯誤
    緊急通報解除後卡片反白 - 前端


10-29-2021

1. Jubo-Box
  維思 Humetrics
    - (維1) 10/28 (五) 收到維思 Mqtt Broker/Client 測試資料和工具包
    - (維2) 維思 x Jubo-box Mqtt - 11/1 開始測試 
    - (維3) Mqtt adapter and logic to jubo-space grpc - 11/1 開始
    - (維8) 廠商樣品測試 - 待廠商提供成品測試 wireless (先用工具包測封包)
    - (維9) Device Management - 尚未開始 (OKR 目標)

  Bug-fix: 更新 美維 MQTT Events PUB/SUB Payload 變更格式

2. Jubo-space-backend
    - (歷2) Device Install/Uninstall record - 已完成
    - (歷3) Patient-History-API with Device/Room Change - 進行中

  維思 Humetrics
    - (維4) 維思相關 Grpc to Postgres and restfulApi - 本週開始

3. Jubo-space-frontend
  以 patient 為主的 history
    - (歷4) 以 patient 為主的 history detail (monthly with pagination) - 本週開始

  維思 Humetrics
    - (維5) 維思 Monitor - (維4)完成後開始
    - (維6) 維思 Setting - (維4)完成後開始
    - (維7) 維思 History - 尚未開始

  Bug-fix: 排除因 Detection Query API 更動而影響 緊急通報的解除和 Monitor 版面動作的 bugs - 已完成 (On Production)

11-05-2021

1. Jubo-Box
  維思 Humetrics
    - (維1) 10/28 (五) 收到維思 Mqtt Broker/Client 測試資料和工具包
    - (維2) 維思 x Jubo-box Mqtt - 11/5 完成 
    - (維3) Mqtt adapter and logic to jubo-space grpc - 11/5 完成
    - (維8) 廠商樣品測試 - 待廠商提供成品測試 wireless (先用工具包測封包 11/5 完成)
    - (維9) 維思設備 WiFi 遠端設定 Mqtt Pub <- (前端介面規格需要定義)
    - (維10) Device Management - 尚未開始 (非設計規格, Q4 OKR 目標)
  
  Bug-fix: Vayyar fall-event to 前端問題排除

2. Jubo-space-backend
    - (歷2) Device Install/Uninstall record - 已完成
    - (歷3) Patient-History-API with Device/Room Change - 本週暫停

  維思 Humetrics
    - (維4) 維思相關 Grpc to Postgres and restfulApi - 進行中 (預計 11/8-12 完成)

3. Jubo-space-frontend
  以 patient 為主的 history
    - (歷4) 以 patient 為主的 history detail (monthly with pagination) - 本週暫停

  維思 Humetrics
    - (維5) 維思 Monitor - (預計 11/8-12 開始)
    - (維6) 維思 Setting - (維5)完成後開始
    - (維7) 維思 History - 尚未開始 (與歷4 同步)

11-12-2021

0. 硬體測試 
  - 維思 
    + 11/9 (二) 收到維思床墊樣品
    + 11/10 測試 WIFI 連線
    + 11/11 測試遠端 WIFI 設定 (透過 MQTT Pub) 
    + 11/12 遠端切換兩組 WIFI 設定 確認設備可恢復連線
    + 11/13 - 11/14 透過 Jubo-box 蒐集實際躺床資料存入資料庫內 
    + 11/13 - 11/14 測試 POE + 乙太網路連線測試

    + 與維思確認 respiratory & restless 訊號有雜訊干擾 11-22 ~11-26 廠商將安排人員來公司更新韌體

1. Jubo-Box
  維思 Humetrics
    - (維1) 10/28 (五) 收到維思 Mqtt Broker/Client 測試資料和工具包
    - (維2) 維思 x Jubo-box Mqtt - 11/5 完成 
    - (維3) Mqtt adapter and logic to jubo-space grpc - 11/5 完成
    - (維8) 廠商樣品測試 - 待廠商提供成品測試 wireless (先用工具包測封包 11/5 完成)
    - (維9) 維思設備 WiFi 遠端設定 Mqtt Pub <- (前端介面規格需要定義, 後端 API -> MQTT 已完成)
    - (維10) Device Management - 11/10 已開始 (Q4 OKR 目標)
      + Humetrics 上下線判定 & Event 通知 Jubo-space-backend (已完成待測試)
      + Humetrics 設備異常 Event 通知 Jubo-space-backend (已完成待測試)

  
2. Jubo-space-backend
    - (歷2) Device Install/Uninstall record - 已完成
    - (歷3) Patient-History-API with Device/Room Change - 本週暫停

  維思 Humetrics
    - (維4) 維思相關 Grpc to Postgres - 已完成
    - (維4.1) 分析 11/13 - 11/14 蒐集的實際躺床資料做久臥 以及離床過久的計算並完成事件 detection 的產生 (進行中)

3. Jubo-space-frontend
  以 patient 為主的 history
    - (歷4) 以 patient 為主的 history detail (monthly with pagination) - 本週暫停

  維思 Humetrics
    - (維5) 維思 Monitor - (進行中)
    - (維6) 維思 Setting - (維5)完成後開始
    - (維7) 維思 History - 尚未開始 (與歷4 同步)


11-19-2021

0. 硬體測試 
  - 維思 
    + 與維思確認 respiratory & restless 訊號有雜訊干擾 11-22 ~ 11-26 廠商將安排人員來公司更新韌體

1. Jubo-Box
  維思 Humetrics
    - (維9) 維思設備 WiFi 遠端設定 Mqtt Pub <- (前端介面規格需要定義, 後端 API -> MQTT 已完成)
    - (維10) Device Management -  進行中
      + Humetrics 上下線 Event 通知 Jubo-space-backend (已完成)
      + Humetrics 設備異常 Event 通知 Jubo-space-backend (已完成)
  
2. Jubo-space-backend
    - (歷3) Patient-History-API 
      + Get History List API (已完成)
      + Get Latest History (已完成)
      + Get Patient Detail History By Date (已完成)
      + Get Spatial Detail History By Date (進行中) (跌倒偵測設備類)
    - (維10) 設備異常/上下線
      + Humetrics 上下線 Event 寫入 Jubo-space-backend Db (已完成)
      + Humetrics 設備異常 Event 寫入 Jubo-space-backend Db (已完成)

  維思 Humetrics
    - (維5) 離床過久的計算並完成事件 detection 的產生 (進行中)
    - (維6) 臥床過久的計算並完成事件 detection 的產生 (進行中)

3. Jubo-space-frontend
  以 patient 為主的 history
    - (歷4) 以 patient 為主的 history detail (monthly with pagination) - 本週暫停

  維思 Humetrics
    - (維5) 維思 Monitor - (進行中)
    - (維6) 維思 Setting - (維5)完成後開始
    - (維7) 維思 History - 尚未開始 (與歷4 同步)

11-26-2021

0. 硬體測試
  - 維思
    + 與維思確認 respiratory & restless 訊號有雜訊干擾
    + 廠商將安排人員來公司更新韌體
1. Jubo-Box
  維思 Humetrics
    - (維10) Device Management
      + Humetrics 上下線 Event 通知 Jubo-space-backend (已完成)
      + Humetrics 設備異常 Event 通知 Jubo-space-backend (已完成)

2. Jubo-space-backend
    - (歷3) Patient-History-API 
      + Get History List API (已完成 上dev)
      + Get Latest History (已完成 上dev)
      + Get Patient Detail History By Date (已完成 上dev)
      + Get Spatial Detail History By Date (進行中) (跌倒偵測設備類)
    - (維10) 設備異常/上下線
      + Humetrics 上下線 Event 寫入 Jubo-space-backend Db (已完成 上dev)
      + Humetrics 設備異常 Event 寫入 Jubo-space-backend Db (已完成 上dev)
      + Humetrics 上下線/設備異常 前端 API (進行中)

  維思 Humetrics
    - (維5) 離床過久的計算並完成事件 detection 的產生 (進行中 預計12/3完成)
    - (維6) 臥床過久的計算並完成事件 detection 的產生 (進行中 預計12/3完成)


