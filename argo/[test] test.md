方才討論的內容可參考我的 SQL 調教的筆記
Summary:
使用 LATERAL subquery + recursive query 可將執行時間減少至 10 ms
但實務上我會建議優先考慮 space box/backend 收到新資料時除了寫入 detections (此表的意義比較像是 historical data)，也另存一份到 latest_records table。前端需要 latest records 的時候就從 latest_records 中取值直接呈現。維護性會比噁心的 SQL query 還高
cache layer 則緩存 latest_records即可