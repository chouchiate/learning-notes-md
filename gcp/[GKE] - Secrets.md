## [GKE] - Google Kubernetes Engine Secrets 學習筆記

[kubectl docs](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#create)
### Create ***Secret*** Object

* Use kubectl
```bash
  kubectl create secret <SECRET_TYPE> <SECRET_NAME> <DATA>
```
  * SECRET_TYPE: 
    + generic: Create from local file
  * SECRET_NAME:
    + name of secrete
  * DATA:
    + data add to the Secret, can be one of following:
    
### gcloud Create / Manage Service Account Keys
  [](https://cloud.google.com/iam/docs/creating-managing-service-account-keys#iam-service-account-keys-create-gcloud)

### Cloud Sql Proxy
  [](https://cloud.google.com/sql/docs/postgres/sql-proxy)

### Connecting GKE to Cloud Sql Instance
  [](https://cloud.google.com/sql/docs/postgres/connect-kubernetes-engine)

### To connect to cloud SQL
    * a GKE cluster with kubectl cmd line installed

### To Setup GKE (Quickstart)

[doc](https://cloud.google.com/kubernetes-engine/docs/quickstart)