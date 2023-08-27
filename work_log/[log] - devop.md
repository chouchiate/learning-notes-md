## [log] - devops



---
### 08-12-2022

##Pending…
deploy the PoC gRPC service according to the minimal setup
探索式分析 NIS 效能問題 (目前瞄準 print server 相關的 endpoints)
做個基本的 load testing 概念驗證證明 worker thread utility 可替 main thread 減壓
K8S 1.21 end of life 死線快到，好像很危險，需安排升級活動
##TODO
survey Loki 的 best practice, or survey 穩健性更高的 logging analytic system
query frontend 有參數調教的優化空間
ca cluster 資源砍半… 但目前都是用 shared machine，能減少的空間不大
min. requirement: 1) 開機器 2) 用原 manifests 部署 3) 修改 DNS record
better: 1) 開機器 2) 升級幾項基礎建設的版本並部署 3) 修改 DNS record

---