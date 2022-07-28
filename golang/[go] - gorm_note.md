## [gorm] - notes

#### 安裝
```bash
$ go get -u github.com/jinzhu/gorm
```

#### 快速開始
```go
package main

import (
    "github.com/jinzhu/gorm"
    _ "github.com/jinzhu/gorm/dialects/sqlite"
)

type Product struct {
  gorm.Model
  Code string
  Price uint
}

func main() {
  db, err := gorm.Open("sqlite3", "test.db")
  if err != nil {
    panic("連接數據庫失敗")
  }
  defer db.Close()

  // 自動遷移模式
  db.AutoMigrate(&Product{})

  // 創建
  db.Create(&Product{Code: "L1212", Price: 1000})

  // 讀取
  var product Product
  db.First(&product, 1) // 查詢id爲1的product
  db.First(&product, "code = ?", "L1212") // 查詢code爲l1212的product

  // 更新 - 更新product的price爲2000
  db.Model(&product).Update("Price", 2000)

  // 刪除 - 刪除product
  db.Delete(&product)
}
```
## **連接數據庫**

MySql
```go
import (
  "github.com/jinzhu/gorm"
  _ "github.com/jinzhu/gorm/dialects/mysql"
)

func main() {
  db, err := gorm.Open("mysql", "user:password@/dbname?charset=utf8&parseTime=True&loc=Local")
  defer db.Close()
}
```
PostgresSql
```go
import (
  "github.com/jinzhu/gorm"
  _ "github.com/jinzhu/gorm/dialects/postgres"
)

func main() {
  db, err := gorm.Open("postgres", "host=myhost port=myport user=gorm dbname=gorm password=mypassword")
  defer db.Close()
}
```
Sqlite3
```go
import (
  "github.com/jinzhu/gorm"
  _ "github.com/jinzhu/gorm/dialects/sqlite"
)

func main() {
  db, err := gorm.Open("sqlite3", "/tmp/gorm.db")
  defer db.Close()
}
```
## **不支持的數據庫**
[gorm](https://github.com/jinzhu/gorm/blob/master/dialect.go)

## **模型定義**
```go
type User struct {
  gorm.Model
  Name         string
  Age          sql.NullInt64
  Birthday     *time.Time
  Email        string  `gorm:"type:varchar(100);unique_index"`
  Role         string  `gorm:"size:255"` // set field size to 255
  MemberNumber *string `gorm:"unique;not null"` // set member number to unique and not null
  Num          int     `gorm:"AUTO_INCREMENT"` // set num to auto incrementable
  Address      string  `gorm:"index:addr"` // create index with name `addr` for address
  IgnoreMe     int     `gorm:"-"` // ignore this field
}
```
## **結構標籤**
> * 在聲明模型的時候標籤是可選的。GORM提供以下標籤：

## **提供的結構標籤** (struct tag)

| 標籤 | 描述 |
| ---- | ---- |
| Column | 指定列名 |
| Type | 指定列數據類型 |
| Size | 指定列大小，默認255 |
| PRIMARY_KEY | 指定列作爲主鍵 |
| UNIQUE | 指定列作爲唯一索引 |
| DEFAULT | 指定列默認值 |
| PRECISION | 指定列精度 |
| NOT NULL | 指定列NOT NULL |
| AUTO_INCREMENT | 指定列是否自動遞增 |
| INDEX | 創建有或沒名稱的索引，相同名稱創建複合索引 |
| UNIQUE_INDEX | 和INDEX一樣，創建唯一索引 |
| EMBEDDED | 將struct設置爲嵌入 |
| EMBEDDED_PREFIX | 設置內嵌結構的前綴名 |

## **關聯的結構標籤** (relational struct tag)

| 標籤 | 描述 |
| ---- | ---- |
| MANY2MANY | 指定聯接的表名 |
| FOREIGNKEY | 指定外鍵 |
| ASSOCIATION_FOREIGNKEY | 指定關聯外鍵 |
| POLYMORPHIC | 指定多態類型 |
| POLYMORPHIC_VALUE | 指定多態值 |
| JOINTABLE_FOREIGNKEY | 指定聯接表的外鍵 |
| ASSOCIATION_JOINTABLE_FOREIGNKEY | 指定聯接表的聯合外鍵 |
| SAVE_ASSOCIATIONS | 是否自動保存關聯 |
| ASSOCIATION_AUTOUPDATE | 是否自動更新關聯 |
| ASSOCIATION_AUTOCREATE | 是否自動創建關聯 |
| ASSOCIATION_SAVE_REFERENCE | 是否自動保存關聯引用 |
| PRELOAD | 是否自動預加載關聯 |


## **約定**

gorm.Model
> 結構gorm.Model包括一些基本字段ID，CreatedAt，UpdatedAt，DeletedAt，你可以將它嵌入你的模型，或者只寫你想要的字段
```go
// gorm.Model definition
type Model struct {
  ID        uint `gorm:"primary_key"`
  CreatedAt time.Time
  UpdatedAt time.Time
  DeletedAt *time.Time
}

// Inject fields `ID`, `CreatedAt`, `UpdatedAt`, `DeletedAt` into model `User`
type User struct {
  gorm.Model
  Name string
}

// Declaring model w/o gorm.Model
type User struct {
  ID   int
  Name string
}
```

ID 為默認的主鍵
```go
type User struct {
  ID   string // field named `ID` will be used as primary field by default
  Name string
}

// Set field `AnimalID` as primary field
type Animal struct {
  AnimalID int64 `gorm:"primary_key"`
  Name     string
  Age      int64
}
```
多元化表名
* 表名是結構體名稱的複數形式
```go
type User struct {} // default table name is `users`

// Set User's table name to be `profiles`
func (User) TableName() string {
  return "profiles"
}

func (u User) TableName() string {
  if u.Role == "admin" {
    return "admin_users"
  } else {
    return "users"
  }
}

// Disable table name's pluralization, if set to true, `User`'s table name will be `user`
db.SingularTable(true)

```
> Using `table` field inside model struct

```go
type Product struct{
  ID int
  Name string
  Quantity int

  // private field, ignored from gorm
  table string `gorm:"-"`
}

func (p Product) TableName() string {
  // double check here, make sure the table does exist!!
  if p.table != "" {
    return p.table
  }
  return "products" // default table name
}

// for the AutoMigrate
db.AutoMigrate(&Product{table: "jeans"}, &Product{table: "skirts"}, &Product{})

// to do the query
prod := Product{table: "jeans"}
db.Where("quantity > 0").First(&prod)
```
> Does not work directly with db.Find(); when query multiple records is required, workaround is to specify table before doing the query.
```go
prods := []*Product{}
db.Table("jeans").Where("quantity > 0").Find(&prods)
```
## Method Chaining
> methods 可以分成 chain methods、finisher methods、new session method。
```go
db.
Table("table_name").         // Model(&model{})
Select("select syntax").
Group("field_names").
Order("field_name").
Find(&model{})     // Rows()
```

指定表名
```go
// Create `deleted_users` table with struct User's definition
db.Table("deleted_users").CreateTable(&User{})

var deleted_users []User
db.Table("deleted_users").Find(&deleted_users)
//// SELECT * FROM deleted_users;

db.Table("deleted_users").Where("name = ?", "jinzhu").Delete()
//// DELETE FROM deleted_users WHERE name = 'jinzhu';
```

修改默認表名
> 通過定義 DefaultTableNameHandler 對默認表名應用任何規則
```go
gorm.DefaultTableNameHandler = func (db *gorm.DB, defaultTableName string) string  {
  return "prefix_" + defaultTableName;
}
```
列名是字段名的蛇型小寫
```go
type User struct {
  ID        uint      // column name is `id`
  Name      string    // column name is `name`
  Birthday  time.Time // column name is `birthday`
  CreatedAt time.Time // column name is `created_at`
}

// Overriding Column Name
type Animal struct {
  AnimalId    int64     `gorm:"column:beast_id"`         // set column name to `beast_id`
  Birthday    time.Time `gorm:"column:day_of_the_beast"` // set column name to `day_of_the_beast`
  Age         int64     `gorm:"column:age_of_the_beast"` // set column name to `age_of_the_beast`
}
```

### **時間撮追蹤**
CreatedAt
> 當模型有CreatedAt字段，在記錄第一次創建的時候，它將被設置成當前時間

```go
db.Create(&user) // will set `CreatedAt` to current time
// To change its value, you could use `Update`
db.Model(&user).Update("CreatedAt", time.Now())
```

UpdatedAt
>當模型有UpdatedAt字段，當記錄更新的時候，它將被設置成當前時間
```go
db.Save(&user) // will set `UpdatedAt` to current time

db.Model(&user).Update("name", "jinzhu") // will set `UpdatedAt` to current time
```
DeletedAt
>當模型有DeletedAt字段，當刪除它們的實例的時候，它們不會從數據庫中刪除，而是設置DeletedAt字段爲當前時間。


### **增刪改查**
* 創建記錄
```go
user := User{Name: "Jinzhu", Age: 18, Birthday: time.Now()}

db.NewRecord(user) // => returns `true` as primary key is blank

db.Create(&user)

db.NewRecord(user) // => return `false` after `user` created
```


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



#### GORM Returning data From Modified Rows

```golang
result := r.Gdb.Model(&User{}).Clauses(clause.Returning{}).Where("id = ?", "000-000-000").Updates(content)
```
[doc](https://gorm.io/docs/update.html#Returning-Data-From-Modified-Rows)

#### example
```golang
func (r *repeatAlertRepo) Cancel(dataID uuid.UUID) (*uuid.UUID, error) {
	var ret schema.LineRepeatAlert

	res := r.db.
		Model(&ret).
		Clauses(clause.Returning{Columns: []clause.Column{
			{Name: "device_id"},
		}}). // IMPORTANT: this API will add RETURNING clause in the end for retuning device_id for further use
		Where("data_id = ? AND canceled_at IS NULL", dataID).
		Update("canceled_at", time.Now())

	if res.Error != nil {
		return nil, fmt.Errorf("failed to update canceled_at: %w", res.Error)
	}
	if res.RowsAffected == 0 {
		return nil, ErrNoAffectedRow
	}

	return &ret.DeviceID, nil
}

```