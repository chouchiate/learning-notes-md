## [Golang] - GORM 學習筆記

#### 安裝

```bash
$ go get -u gorm.io/gorm
$ go get -u gorm.io/driver/sqlite
$ go get -u gorm.io/driver/posgres
```

### **官方 Doc & API**

* https://gorm.io/docs/

* https://pkg.go.dev/gorm.io/gorm

### **Connection**

> [Doc](https://gorm.io/docs/connecting_to_the_database.html)


### **Migration**

> [Doc]()
##### Add Foreign Key in Migration
```go
  db.Model(&models.UserInfo{}).AddForeignKey("u_id", "t_user(id)", "RESTRICT", "RESTRICT")
```

#### Raw & Exec


