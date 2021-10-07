## [pg] - GORM Snippets to study further

#### gorm with reflect interfaces

```go
func CreateOrUpdate(db *gorm.DB, model interface{}, where interface{}, update interface{}) (interface{}, error) {
    var result interface{}
    err := db.Model(model).Where(where).First(result).Error
    if err != nil {
        if !errors.Is(err, gorm.ErrRecordNotFound) {
            return nil, err
        } else {
            //insert
            if err = db.Model(model).Create(update).Error; err != nil {
                return nil, err
            }
        }
    }
    //not update some field
    reflect.ValueOf(update).Elem().FieldByName("someField").SetInt(0)
    if err = db.Model(model).Where(where).Updates(update).Error; err != nil {
        return nil, err
    }
    return update, nil
}
```

```go
    if err := db.Where(User{Email: "some@email.com"}).
       Assign(User{Email: "some@email.com", Age: 45}).
       FirstOrCreate(&User{}).Error; err != nil {
         c.Next(err)
         return
    }
```