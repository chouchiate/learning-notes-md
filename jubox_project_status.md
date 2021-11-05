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
    - (維9) Device Management

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