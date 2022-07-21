# 06-27-2022
## Y
* Investigate issues with 201906449 and 201906450
* [JUSPACE-224](https://thudercat.atlassian.net/jira/software/c/projects/JUSPACE/boards/21?modal=detail&selectedIssue=JUSPACE-224) - 服務 Vayyar 設備驗證以找到 MQTT broker (wall, ceiling configuration 跟著backend

## T
* [JUSPACE-224](https://thudercat.atlassian.net/jira/software/c/projects/JUSPACE/boards/21?modal=detail&selectedIssue=JUSPACE-224) - 服務 Vayyar 設備驗證以找到 MQTT broker (wall, ceiling configuration 跟著backend

# 07-14-2022

## Y
* [JUSPACE-224](https://thudercat.atlassian.net/jira/software/c/projects/JUSPACE/boards/21?modal=detail&selectedIssue=JUSPACE-224) Deployed to Dev
## T
* dev 環境 vayyar device-setting table 沒有建起來
* 檢查為何 google-sheet-synker cron 沒有跑 device-updater 的原因
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)


# 07-20-2022

## Y
* Jubox v2.0 下架完成
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - Refactoring alert-job-queue
    - design repeat alert repo and cache
## T
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - Early Design review for repeat alert interfaces
    - design repeat alert

# 07-21-2022

## Y
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - Refactoring alert-job-queue
        - make sure refactoring passes all tests
    - design repeat alert repo and cache
## T
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - design repeat alert repo interface methods
        - FetchDeviceAlertPlan (V)
        - Load
    - design repeat alert cache interface methods
        - move alert cache
        - CacheDeviceAlertPlan (x)
    TODOs:
    - design grpc interaction with repeat alert interfaces
        - incoming events to
            1. activate,
            2. cancel,
            3. reset repeat alerts
    - design restful interaction with repeat alert interfaces
        - line cancel and
        - frontend cancel
        - setting change update


