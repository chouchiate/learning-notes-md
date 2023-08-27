## [mongo] - 起動與關閉

### 啟動服務
```bash
    ./mongod -f /ect/mongod.conf
    # mongod 表示mongod的服務器命令
    # -f /etc/mongod.conf 配置文件
    ./mongod -h
```


### 連接服務
```bash
    ./mongo --host 127.0.0.1 --port 27717 -u root -p 123456 --authenticationDatabase admin
    # mongo     mongodb客戶端命令
    # --host    主機地址
    # --port    端口port
    # -u root   帳號
    # -p 123456 密碼
    # --authenticationDatabase admin 帳號密碼對應認證庫
    ./mongo -h
    # get more info
```

### CRUD 入門
* C (Create)
```bash
    db.user.insert({name:"Jack",age:"24"})
```
* R (Read)
```bash
    db.user.find({"name":"Jack"})
```

* U (Update)
```bash
    db.user.update({"name":"Jack"},{"name":"Jack New"})
```
* D (Delete)
```bash
    db.blog.remove({"name":"Jack"})
```

### 權限設定

* read：允许用户读取指定数据库
* readWrite：允许用户读写指定数据库
* dbAdmin：允许用户在指定数据库中执行管理函数，如索引创建、删除，查看统计或访问system.profile
* userAdmin：允许用户向system.users集合写入，可以找指定数据库里创建、删除和管理用户
* clusterAdmin：只在admin数据库中可用，赋予用户所有分片和复制集相关函数的管理权限。
* readAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读权限
* readWriteAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读写权限
* userAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的userAdmin权限
* dbAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的dbAdmin权限。
* root：只在admin数据库中可用。超级账号，超级权限

### Create User
```bash
    db.createUser({user:"account",pwd:"password",roles:[{role:"root",db:"admin"}]})
```

### Get Account
```bash
    db.getUser("account")
```

### Delete User
```bash
    db.dropUser("account")
```

### Change Password
```bash
    db.changeUserPassword("account","new_password")
```

### Slow Query Log
[profiler](https://www.mongodb.com/docs/manual/tutorial/manage-the-database-profiler/)

### Docker

*
```make
MONGO_PORT ?= 27017
PERSISTENT_MONGO_PORT ?= 27717
PERSISTENT_MONGO_PATH ?= $(shell pwd)/temp/mongo

#
# mongodb
#

stop-mongo:
	@echo "stop mongo..."
	@docker stop my-backend-mongo | true

restart-mongo: stop-mongo
	@echo "start mongo..."
	@docker run -d --rm --name my-backend-mongo \
		-p $(MONGO_PORT):27017 \
		mongo:5.0-focal

stop-persistent-mongo:
	@echo "stop persistent mongo..."
	@docker stop my-backend-persistent-mongo | true

restart-persistent-mongo: stop-persistent-mongo
	@mkdir -p $(PERSISTENT_MONGO_PATH)
	@echo "start persistent mongo..."
	@docker run -d --rm --name my-backend-persistent-mongo \
		-p $(PERSISTENT_MONGO_PORT):27017 \
		-v $(PERSISTENT_MONGO_PATH):/data/db \
		mongo:5.0-focal


stop-mongo:
	@echo "stop mongo..."
	@docker stop box-persistent-mongo | true

start-mongo: stop-mongo
	@mkdir -p $(PERSISTENT_MONGO_PATH)
	@echo "start persistent mongo..."
	@docker run -d --rm --name box-persistent-mongo \
		-p $(PERSISTENT_MONGO_PORT):27017 \
		-v $(PERSISTENT_MONGO_PATH):/data/db \
		mongo:5.0-focal


```