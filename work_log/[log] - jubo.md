## [log] - my_work_log

### 10-12-2022
* [JUSPACE_403] - Fix sleep summation arbitrary missing sleep end
* P5 LED 顯示器規格確認 會議準備

### 10-11-2022
* [JUSPACE_403] - Find cause and solution for incorrect sleep duration calculation
* P5 LED 顯示器規格確認
### 08-05-2022

#### [Y]
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)

- Deployment to DEV
- Test with IOT Devices

#### [T]

- Continue Testing
- Evaluation of new features (Statistical Usage Analysis)

### 08-01-2022

* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
#### [Y]
- Complete Tests
#### [T]
- Committed and Pushed for Merge Request
### 07-28-2022
#### [Y]
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)

- :white_check_mark: 完成 design RepeatManager 之
    - restful interaction with repeat alert interfaces (前端 frontend disalarm -> restful cancel)
    - go routine (repeat alert checking)
    - grpc incoming events
        - grpc interaction with repeat alert interfaces
    - grpc incoming events 實作
        1. activate / re-activate,
        2. cancel,
        3. change alert to repeat
- :white_check_mark:
    - TDD Database preparation for repeat alert (mocking user and user preferences settings)

#### [T]
- :construction:
    - TDD Unit Testing and integration testing for repeat alert


### 07-26-2022
#### [Y]
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)

- :white_check_mark: 完成 design RepeatManager 之
    - restful interaction with repeat alert interfaces (前端 frontend disalarm -> restful cancel)
    - go routine (repeat alert checking)
    - grpc incoming events
        - grpc interaction with repeat alert interfaces

- :construction: 設計中 design RepeatManager 之
    - grpc incoming events 實作
        1. activate / re-activate,
        2. cancel,
        3. change alert to repeat

---
### 07-25-2022
#### [Y]
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - 完成 -  design restful interaction with repeat alert interfaces
        * frontend disalarm
    - 完成 - complete design repeat alert job queue interface methods
    - 完成 design grpc interaction with repeat alert interfaces
        - incoming events to
            1. activate,
            2. cancel,
            3. reset repeat alerts
    - 設計中 - design alertjobqueue (redis cache) AND repeat_alert_repo (postgresql) interaction 和開機初始狀態

#### [T]
    - 設計中


---
### 07-22-2022

#### [Y]
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - 完成 - complete design repeat alert repo interface methods
    - 完成 - complete design repeat alert job queue interface methods
    - 設計中 - design alertjobqueue (redis cache) AND repeat_alert_repo (postgresql) interaction 和開機初始狀態

#### [T]
    - 設計中 - design alertjobqueue (redis cache) AND repeat_alert_repo (postgresql) interaction 和開機初始狀態
    - 設計中 design grpc interaction with repeat alert interfaces
        - incoming events to
            1. activate,
            2. cancel,
            3. reset repeat alerts
    - 設計中 design restful interaction with repeat alert interfaces
        - line cancel and
        - frontend cancel
        - setting change update

---


### 07-21-2022
#### [Y]
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - Refactoring alert-job-queue
        - make sure refactoring passes all tests (V)
    - design repeat alert repo and cache (>>>)
#### [T]
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - design alertjobqueue (redis cache) interaction with repeat_alert_repo (postgresql)
        -
    - design repeat alert repo interface methods
        - FetchDeviceAlertPlan (V)
        - ListActiveAlerts (V)
    - design repeat alert job queue interface methods
        - create redis-lua script and function for AlertJobQueue Interfaces
            - Add (V)
            - GetDataFromUnconsumedAlert (V)
            - AckAlert (V)
            - PullAlert (V)
        - CacheDeviceAlertPlan (X)
            -
        - Test Cases for repeat_alert_job_queue (V)
    - alert job queue 的前世今生 postgresql update to redis dataset when new server is up
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

---

### 07-20-2022

#### [Y]
* Jubox v2.0 下架完成
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - Refactoring alert-job-queue
    - design repeat alert repo and cache
#### [T]
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)
    - Early Design review for repeat alert interfaces
    - design repeat alert


---
#### 07-14-2022

#### [Y]
* [JUSPACE-224](https://thudercat.atlassian.net/jira/software/c/projects/JUSPACE/boards/21?modal=detail&selectedIssue=JUSPACE-224) Deployed to Dev
#### [T]
* dev 環境 vayyar device-setting table 沒有建起來
* 檢查為何 google-sheet-synker cron 沒有跑 device-updater 的原因
* [JUSPACE-330](https://jubo.atlassian.net/browse/JUSPACE-330?atlOrigin=eyJpIjoiYTQxZjA1ZWYwNDk0NDg2MWJhZDQ5NTliMzVlNGIzZDYiLCJwIjoiaiJ9)


---
### 06-27-2022
#### [Y]
* Investigate issues with 201906449 and 201906450
* [JUSPACE-224](https://thudercat.atlassian.net/jira/software/c/projects/JUSPACE/boards/21?modal=detail&selectedIssue=JUSPACE-224) - 服務 Vayyar 設備驗證以找到 MQTT broker (wall, ceiling configuration 跟著backend

#### [T]
* [JUSPACE-224](https://thudercat.atlassian.net/jira/software/c/projects/JUSPACE/boards/21?modal=detail&selectedIssue=JUSPACE-224) - 服務 Vayyar 設備驗證以找到 MQTT broker (wall, ceiling configuration 跟著backend
