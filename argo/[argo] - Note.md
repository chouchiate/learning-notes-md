jubo space dev environment 上線啦～
dev 環境用的 hostnames 如下：
dev-space.jubo.health
dev-box.jubo.health
dev-mqtt.jubo.health
dependent databases/services:
box 連向的 mongo 沒改，仍然是連向 jubox-demo@cluster1/demo_jubox 這個 demo 用的實體
backend 連向的 postgres 有改，database name 從 jubo_space 改成 jubo_space_dev (故這裡需要重新灌資料)
backend 連向的 NIS server 有改，從 smc.jubo.health 改成 demo.jubo.health。理論上應該連向 develop.jubo.health，需要佳德的需求確認
---
CI/CD 的部分：
ArgoCD hosting on: https://dev-argocd-nis.jubo.health/  (目前暫時讓任何擁有 @jubo.health 信箱的人都能登入成為 admin，請謹慎使用)
dev env 的 application 部署，會追蹤 master branch 改動後所產生的 image，並且可登入 argocd 上面手動 trigger 部署 (若佳德 operate 一陣子後覺得很繁瑣，可再調成自動部署) (edited) 