# Folder structure and guideline

- [Folder structure and guideline](#folder-structure-and-guideline)
  - [Introduction](#introduction)
  - [Contributing Guide](#contributing-guide)
    - [新增 service 基本 manifests](#新增-service-基本-manifests)
    - [將新增的 service 被 ArgoCD 納入管理](#將新增的-service-被-argocd-納入管理)
      - [Step 1. 撰寫 `Application` (ArgoCD's CRD)](#step-1-撰寫-application-argocds-crd)
      - [Step 2. 引入 Application CRD](#step-2-引入-application-crd)
      - [Step 3. 輸出 `output.yaml` 預覽 ArgoCD 的差異](#step-3-輸出-outputyaml-預覽-argocd-的差異)
    - [於 ArgoCD 上同步 (Sync) 這次新增的 service manifests 與 `Application`](#於-argocd-上同步-sync-這次新增的-service-manifests-與-application)
      - [Step 0. 首次同步 `Application` 至叢集中](#step-0-首次同步-application-至叢集中)
      - [Step 1. 同步 service 的 manifests](#step-1-同步-service-的-manifests)
  - [Notes](#notes)
    - [如何新增一個環境變數 ？](#如何新增一個環境變數-)
    - [如何新增一個 "Raw" password for Pushgateway basic auth ？](#如何新增一個-raw-password-for-pushgateway-basic-auth-)

## Introduction

- 將 k8s manifests 從 app repo 中移到此 repo 集中管理
- 使得 CD 階段 (Continuos Delivery) 的初始化與改動能夠在此 repo 做 review
- 未來要更進一步利用 IaC tools (Infrastructure as Code ) 來提供自動化程度時，也能夠有較好的基礎開始實踐

***Pros***
- 逐步實現 GitOps 的原則、逐步降低人為控制叢集的必要、提高部署自動化程度
- 職責分離：讓 developers 可專注在 **writing codes** 以及 build 出可用的 docker image 就好
- 提供更彈性的部署組態設置，以適應未來私有雲客戶的自動化配置需求

***Cons***
- 額外維護一個 repo，管理成本外部化，需由 DevOps 專員管控
- developers 可能因此需要多熟悉以下資料格式/工具/平台的運作方式與原理：
  - `yaml` format
  - `kustomize` (熟悉 `kustomize build` 就好，以及 declarative yaml 如何寫)
  - `ArgoCD` (需要再到 ArgoCD Web UI 執行手動部署)

延伸閱讀：
- internal doc for developers: [Development Workflow and CI/CD Pipeline](https://internal.thudercat.health/docs/docs/devops/cicd-pipeline)
- DevOps [high level picture](https://gitlab.smart-aging.tech/devops/knowledgebase/-/blob/main/architectures/overview.drawio.png)

## Contributing Guide

### 新增 service 基本 manifests

以 `nis` 為例，會長出以下資料夾結構來描述各叢集的資源檔：

```bash
.
...
├── nis                    # namespace
│   ├── base                        # base directory
│   │   ├── Deployment.yaml         # base k8s objects
│   │   ├── Service.yaml            #   ...
│   │   ├── ...                     #   ...
│   │   └── kustomization.yaml      # base declaration
│   ├── dev                        # actual cluster name (demo)
│   │   ├── kustomization.yaml      # custom declaration
│   │   ├── resources.yaml # a resources patch for demo cluster
│   │   └── output.yaml             # preview the actually applied manifests before ArgoCD applying
│   └── demo                     # actual cluster name (release)
│       ├── ...
│       ...
...
```

`nis/`
- service 在 k8s 中所處的 ***namespace***

`base/`
- *directory 使用 `base` 命名沿用官方文件的範例，非硬性規定*
- 在此放置要在 k8s 上運行你的 service 所需要的 manifests
- 這邊盡量定義各環境通用的內容


`base/Deployment.yaml`, `base/Service.yaml`...etc.
- filename 以 k8s object 的 `kind` 來命名
- 視情況，加入 application name + dot 作為前綴，e.g. `OTHER_APP.Deployment.yaml`

`base/kustomization.yaml`
- 此檔案會被 `kustomize build` 的產生過程中給識別
- 此檔案內至少得明確宣告以下內容：
  - `namespace` - 防呆，避免你實際上要部署的 objects 寫錯 namespace 或忘了寫，而部署到 default namespace
  - `resources` - 宣告哪些 k8s manifests 要被引用

`dev/`
- 此路徑名稱為實際要部署的叢集名稱。以目前 NIS 主系統/北美專案的規劃，有使用 git branch 區隔 dev/demo/release 部署環境
- 此路徑、基於 `base/` 的內容，可再放置一些 ***patches*** 來補充描述各叢集需要的組態設定

`dev/kustomization.yaml`
- see: https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/#customizing
- 此檔案內描述它的 base 從哪來，以及有哪些 patches 來源
- 此檔案會是實際上 ArgoCD 要部署此應用時，執行 `kustomize build` 需要吃的組態檔

`dev/resources.yaml`
- 此為 patch file 範例
- 想要在 dev 環境做不同的 `resources` 配置，就寫一個 patch yaml，描述想要 patching 的內容
  - 此例則是想要在 dev cluster 微調 CPU/Mem 的 requests/limits
- 建議不同目的的 patch 就用不同檔名撰寫，並在 `kustomization.yaml` 中帶入即可

`dev/output.yaml`
- 每次提交改動時，應一併使用 `kustomize build` 產生此檔案 (see [`Makefile`](./Makefile)，需要時自行擴充)
- 雖然 ArgoCD 不是看此檔案來部署，但在開發期輸出此檔可預覽 ArgoCD 即將部署的內容、方便看 diff 做 code review

`demo/`, `release/`
- 依樣畫葫蘆，如上 `dev/` 所述，依據 demo 與 release 環境所需而配置的 patches

### 將新增的 service 被 ArgoCD 納入管理
- 統一使用 ArgoCD 來管理 service 的維運檔及監測 docker image 的改動
- 以 `nis` 為例，目前需要部署的資源已被集中輸出成 `output.yaml`，`output.yaml` 已經是一個可手動部署的資源檔
- 但為了避免人為失誤及方便 code review 時檢視 manifests 的差異，若能在部署前也與 live manifests 做 double check，會更有信心
- 而利用 ArgoCD 自動化管理能幫我們做到這一點。以下範例以 dev cluster 來舉例

#### Step 1. 撰寫 `Application` (ArgoCD's CRD)

- 請至 `namespaces/argocd/dev/Applications/` 內新增 Application，假設叫 `NEW_SERVICE.yaml`
- 以下為最小化設置，需要注意的欄位用註解說明：
  ```yaml
  apiVersion: argoproj.io/v1alpha1
  kind: Application
  metadata:
    annotations:
      # image 的來源，請與 application gitlab-ci.yaml 中 publish 的 image name/tag 做一致的確認
      argocd-image-updater.argoproj.io/image-list: IMAGE_NAME_ALIAS=gcr.io/thudercat-pro/SUB_PROJECT/IMAGE_NAME

      # 使用 IMAGE_NAME_ALIAS 來指定更新策略。沒特別需求的話，應使用 latest 來表示總是抓最新的 image tag
      argocd-image-updater.argoproj.io/IMAGE_NAME_ALIAS.update-strategy: latest

      # 使用 IMAGE_NAME_ALIAS 來指定要抓取的 image tag 規則。
      # 以 dev 環境來說，就抓 dev- 前綴的 images
      # 此 image tag 也是要與 gitlab-ci.yaml 中一致
      argocd-image-updater.argoproj.io/IMAGE_NAME_ALIAS.allow-tags: regexp:dev-.*

    # 這個 Application 的名稱，習慣上與 service name 一致 (通常也跟 app 的 namespace 一致)
    name: SERVICE_NAME

    # 這個 application 是放在 argocd 的 namespace，別搞混了
    namespace: argocd
  spec:
    project: default
    destination:
      # 通常與上面的 SERVICE_NAME 一致。如有特別需求請再調整
      namespace: SERVICE_NAMESPACE
      server: https://kubernetes.default.svc
    revisionHistoryLimit: 5
    source:
      kustomize: {}
      # path 要指定的是該 service 的 k8s manifests，在此 git repo 中哪個路徑
      path: namespaces/SERVICE_NAMESPACE/dev
      repoURL: https://gitlab.smart-aging.tech/ca/manifests.git
      targetRevision: master
  ```

#### Step 2. 引入 Application CRD

- 再來是要在 `namespaces/argocd/dev/kustomization.yaml` 中引入 CRD，讓 ArgoCD 的 root-app 知道有新的 Application 需要管理：
  ```yaml
  namespace: argocd
  bases:
    - ../base
  resources:
    # ...
    # 在此新增 resource，以相對路徑表示
    - Applications/NEW_SERVICE.yaml
  ```

#### Step 3. 輸出 `output.yaml` 預覽 ArgoCD 的差異

- 由於 root-app 本身也是用 ArgoCD 管理，故也需要再輸出一次 `output.yaml` 來檢查異動。
- 此部分已寫好 `namespaces/Makefile` 的 target，於 `namespaces/` 執行 `make argocd-dev` 來產生

### 於 ArgoCD 上同步 (Sync) 這次新增的 service manifests 與 `Application`

- 上面闡述了，新增一個 service 需要準備好它的標準 manifests (但得適應 kustomize 所需的佈置)，及要被 ArgoCD 納入管理的要件 (prepare well-defined `Application`)
- 接下來，要同步 Git repository 上的資源至 K8S 叢集

#### Step 0. 首次同步 `Application` 至叢集中
- 如果這次是首次新增 ArgoCD 的 `Application`，則需要到 `root-app` 這個 Application 上，確實將欲新增的 `Application` resource 同步進叢集中
  - > the App of Apps pattern: https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping/#app-of-apps-pattern

|||
|---|---|
|![picture 1](https://i.imgur.com/MiPqGow.png)|![picture 2](https://i.imgur.com/fRmaFQp.png)|

#### Step 1. 同步 service 的 manifests

|||
|---|---|
|![picture 4](https://i.imgur.com/GRunqp5.png)|![picture 5](https://i.imgur.com/FUVX34Q.png)
|(左圖) 找到你想要同步的 service|(右圖) 上排找到 `Sync` 按鈕，同步資源|




## Notes
### 如何新增一個環境變數 ？
1. 要先判斷是不是共用資源 (在Develop/Demo/Release皆相同)
    - 如果是共用資源就加在base directory 裏面
      - 舉例來說: 新增環境變數 GRPC_NIS_PORT到thudercatfamily-backend，會增加內容到以下Files: ConfigMap.yaml, Deployment.yaml

    - 如果不是共用，則要到分別的 directory下新增需要加入的環境變數的 YAML file 並到 Kustomization.yaml去新增到patchesStrategicMerge底下，而Deployment.yaml一樣更新

    📓 如果是Secret就ConfigMap.yaml換成Secret.yaml

2. ⚠️ Make [對應的Project]
3. Create a MR 到 gitlab，仔細檢查後Merge
4. Sync by ArgoCD
5. Finally, 要重新啟動對應的POD

### 如何新增一個 "Raw" password for Pushgateway basic auth ？
[參考這裡](https://github.com/prometheus/exporter-toolkit/blob/master/docs/web-configuration.md#about-bcrypt)

1. Here is a tool that would prompt for a password and hash it:
```bash
htpasswd -nBC 10 "" | tr -d ':\n'
```

2. That should prompt you for a password:

```bash
New password:
Re-type new password:
$2y$10$HTuXQIOw.XD.m79t2Ph99.q9EoyCdEX2Bwl1x//H.RBgCS68KUnQS%
```
In this example, I used "test" as password.
