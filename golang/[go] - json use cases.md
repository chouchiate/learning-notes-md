## [go] - JSON usage 全集

[tool-json-to-go](https://mholt.github.io/json-to-go/)
[articles](https://eagain.net/articles/go-dynamic-json/)
[blog](https://www.sohamkamani.com/golang/json/)
[git](https://github.com/taocpp/json/blob/main/doc/Common-Use-Cases.md)
#### **Dynamic Json**
> use a map (of type map[string]interface{}) to work with dynamic JSON.
* Here is an example of creating a new map:
```go
// Initial declaration
m := map[string]interface{}{
    "key": "value",
}

// Dynamically add a sub-map
m["sub"] = map[string]interface{}{
    "deepKey": "deepValue",
}
```
> Unmarshalling JSON into a map looks like:
```go
var f interface{}
err := json.Unmarshal(b, &f)
```
> The code above would leave you with a map in f, with a structure resembling:
```go
f = map[string]interface{}{
    "Name": "Wednesday",
    "Age":  6,
    "Parents": []interface{}{
        "Gomez",
        "Morticia",
    },
}
```