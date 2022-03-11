## [Golang] - JSON Operations

### Parse JSON String
Sample Code:
```go
import "encoding/json"
// ...
// define JSON struct
type JsonVariable struct {
  Var1  uint32  `json:"var1"`
  Var2  string  `json:"var2"`
  // ...etc
}
// declare json variable
var jsonvar JsonVariable
myJsonString := `{"some":"json"}`
// `&jsonvar`is the address of the variable we want to store json data
json.Unmarshal([]byte(myJsonString), &jsonvar)

```

### Encoding JSON from Go Variable


### Decode JSON to Structs


### JSON Array


### Embedded Objects



https://www.sohamkamani.com/golang/parsing-json/