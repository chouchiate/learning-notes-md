## [go] - Handling nulls in SQL

众所周知，在 MySQL 中，有一些字段不可逃避的要有 null 值。比如 datetime 字段，如果没有值，那么只能是 null 值。如果在 Golang 中不去做处理，而直接使用 time.Time 类型，则会报错，提示不能将 sql.NullTime 值转换为 time.Time。

这时候，一脸懵逼。

当你开心的将 struct 中 time.Time 类型改为 sql.NullTime 类型的时候，以为自己解决了这个问题。

但是之后将从 DB 取出来的数据 Marshal 到 一个 time.Time 类型的 struct 的时候，出现了惊人的一幕。
Marshal 的结果，他不是一个 time.Time，而是一个 sql.NullTime的结构。
-——
### sql.NullTime structure
```golang
{"Time": "2020-01-01T00:00:00.123456+08:00", "Valid": true}

```

```golang


```

