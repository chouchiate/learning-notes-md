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

```go

```

### **Base Model**
```go
  import (
    "github.com/satori/go.uuid"
    "gorm.io/gorm"
    "time"
  )

  // Base contains common columns for all tables.
  type Base struct {
  ID        uuid.UUID `gorm:"type:uuid;primary_key;"`
  CreatedAt time.Time
  UpdatedAt time.Time
  DeletedAt *time.Time `sql:"index"`
  }
  // BeforeCreate will set a UUID rather than numeric ID.
  func (base *Base) BeforeCreate(scope *gorm.Scope) error {
  uuid, err := uuid.NewV4()
  if err != nil {
    return err
  }
  return scope.SetColumn("ID", uuid)
  }
```

### **Migration**

> [Doc]()
##### Add Foreign Key in Migration
```go
  db.Model(&models.UserInfo{}).AddForeignKey("u_id", "t_user(id)", "RESTRICT", "RESTRICT")
```

#### Raw & Exec



#### Find Soft Deleted Record

```go
  db.Unscoped().Where("age = 20").Find(&users)
// SELECT * FROM users WHERE age = 20;
```

#### Delete Permanently
```go
db.Unscoped().Delete(&order)
// DELETE FROM orders WHERE id=10;
```


### Gorm defined clause - package clause
[git](https://github.com/go-gorm/gorm/tree/master/clause)

[go-pkg](https://pkg.go.dev/gorm.io/gorm/clause)

#### OnConflict
[git](https://github.com/go-gorm/gorm/blob/v1.23.5/clause/on_conflict.go#L3)

* DoUpdates
```sql
INSERT INTO customers (name, email)
VALUES('Microsoft','hotline@microsoft.com')
ON CONFLICT (name)
DO
   UPDATE SET email = EXCLUDED.email || ';' || customers.email;
```
```go

func (p *SpaceCenterRepo) UpsertDeviceInstalledInSpaces(deviceInstalledInSpaces []schema.DeviceInstalledInSpace) error {
	return p.db.Clauses(
		clause.OnConflict{
			Columns: []clause.Column{
				{Name: "device_id"},
				{Name: "space_id"},
			},
			DoUpdates: clause.AssignmentColumns([]string{
				"updated_at",
				"is_installed_in",
			}),
		}).Create(&deviceInstalledInSpaces).Error
}
```
* DoNothing
```sql
INSERT INTO customers (name, email)
VALUES('Microsoft','hotline@microsoft.com')
ON CONFLICT (name)
DO NOTHING;
```
```go

func (p *SpaceCenterRepo) InitDefaultDeviceConfig(deviceDataTypes []schema.DeviceDataType) error {
	return p.db.Clauses(
		clause.OnConflict{
			DoNothing: true,
		},
	).Create(&deviceDataTypes).Error
}
```


#### Association
[git]()
