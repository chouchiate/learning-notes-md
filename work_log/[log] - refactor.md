To be refactored:
- (4) (processor)
  -  should just use external memory to store previous results
  - if we have debugging requirement, go to Google Logging
- (processor -> backend)
  - (3) Add*** series methods should include device_id in their contract (for reducing one db query)
  - (2) no need patient detail, currently it can be converted directly on backend
- (backend)
  - (5) every DATA TYPE should have its own data table -> code path of query also need to be modified
  - (5) use partitioning table to store monitoring data
  - (4) deprecate old users, organizations tables/ORM definitions
  - (3) remove deprecated data from database (manually)
    - postgres 應該有指令知道哪些 table 沒有用
  - (2) move all codes contain semantics of repo into repository/, including the codes have cache semantics
  - (3) dashboard (need cache)
- (style)
  - (1) test case naming avoid using “fail”
  - (1) remove wrong scope of comments (e.g. TODO: 過去經驗：設備異常時，仍然會有...)
    - Conclusion: use checker to do this
  - (1) remove deprecated docs (e.g. :construction: TODO:...)
- (2) (debugging tool) a CLI tool for sending bed activity events to a virtual device
  - conclusion:
    - https://github.com/vadimi/grpc-client-cli/ or grpcurl
- (2) (CI/CD) align the convention of HIS monorepo
  - 刪除 backend 內目前的 internal codes
  - use internal/ folder to avoid mis-importing
  - use lib/ to put the shared codes
  - cache/ too shallow
    1. ms-go-kit
    2. put into repository
    3. monorepo: lib
- (1) (ms-go-kit) pull out the /healthCheck endpoint to company-wide shared lib
- (1) disalrmimages: create a new package and pull out
- (3) swagger documentation
  - need to redefine Request struct
  - use validator package to do validation
vadimi/grpc-client-cli
generic gRPC command line client
Stars
83
Language
Go
database replication to offload JuboSpace load