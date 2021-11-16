## [gorm] - 使用指南

#### 安裝

#### 連接數據庫

MySql

PostgresSql

Sqlite3

不支持的數據庫

模型

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
ID 為默認的主鍵

多元化表名


指定表名


修改默認表名


列名是字段名的蛇型小寫


時間撮追蹤


CreatedAt


UpdatedAt



DeletedAt