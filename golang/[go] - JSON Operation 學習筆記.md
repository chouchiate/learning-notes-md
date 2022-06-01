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
```go
package main

import (
	"encoding/json"
	"log"
)

var body_byte = []byte(`{
 "status": true,
 "data": {
 "ModelList": [{
   "Id": 1,
   "Name": "foo",
   "CarId": 1,
   "EngName": "bar"
  }]
 }
}`)

type AjaxModelsList struct {
	Id      float64 `json:"Id"`
	Name    string  `json:"Name"`
	CarId   float64 `json:"CarId"`
	EngName string  `json:"EngName"`
}

type AjaxModels struct {
	Status bool                        `json:"status"`
	Data   map[string][]AjaxModelsList `json:"data"`
}

func main() {
	c := AjaxModels{}
	if err := json.Unmarshal(body_byte, &c); err != nil {
		log.Fatalf("an error occured: %v", err)
	}
	log.Println(c)
}

```

### Embedded Objects

```go
package main

import (
	"encoding/json"
	"fmt"
)

type PoliticsJson struct {
	Results []struct {
		Multimedia []struct {
			URL string `json:"url"`
		} `json:"multimedia"`
		Title string `json:"title"`
	} `json:"results"`
}

func main() {
	s := `{
"results": [
    {
      "section": "N.Y. / Region",
      "subsection": "",
      "title": "Christie Spins His Version of Security Record on Trail",
      "abstract": "An examination of Gov. Chris Christie’s record as New Jersey’s top federal prosecutor shows that he has, at times, overstated the significance of the terrorism prosecutions he oversaw.",
      "url": "http://www.nytimes.com/2015/12/27/nyregion/Christie-markets-himself-as-protector-to-gain-in-polls.html",
      "byline": "By ALEXANDER BURNS and CHARLIE SAVAGE",
      "item_type": "Article",
      "updated_date": "2015-12-26T18:04:19-5:00",

      "multimedia": [
        {
          "url": "http://static01.nyt.com/images/2015/12/27/nyregion/27CHRISTIE1/27CHRISTIE1-thumbStandard.jpg",
          "format": "Standard Thumbnail",
          "height": 75,
          "width": 75,
          "type": "image",
          "subtype": "photo",
          "caption": "Gov. Chris Christie of New Jersey spoke about the Sept. 11, 2001, attacks at a Republican conference last month.",
          "copyright": "Stephen Crowley/The New York Times"
        }

      ]
    }
  ]
}`

	var p PoliticsJson

	err := json.Unmarshal([]byte(s), &p)
	if err != nil {
		panic(err)
	}
	fmt.Println(p.Results[0].Title)
	fmt.Println(p.Results[0].Multimedia[0].URL)
}

```

### bson marshal & unmarshal

```go

type ComputedResult struct {
	EventTime      time.Time  `bson:"event_time"`
	SinceEventTime *time.Time `bson:"since_event_time"`
	ModelName      string     `bson:"model_name"`

	// NOTE: developer has responsibility to denote the bson tag in your struct
	Result interface{} `bson:"result"`
}

func (c ComputedResult) UnmarshalResult(structWithBsonTags interface{}) error {
	b, err := bson.Marshal(c.Result)
	if err != nil {
		return err
	}

	if err := bson.Unmarshal(b, structWithBsonTags); err != nil {
		return err
	}
	return nil
}


```

```go
type Data struct {
	EventTime   time.Time `bson:"event_time"`
	ArrivalTime time.Time `bson:"arrival_time"`
	Metadata    Metadata  `bson:"metadata"`

	// RawPayload is pass by caller. and expect it is a JSON string, will be unmarshal as a JSON object
	RawPayload []byte `bson:"-"`

	// NOTICE: caller no need to assign this value.
	// Payload will be parsed from RawPayload automatically.
	Payload interface{} `bson:"payload"`
}

type DataList []Data

func (d Data) UnmarshalPayload(structWithBsonTags interface{}) error {
	b, err := bson.Marshal(d.Payload)
	if err != nil {
		return err
	}

	if err := bson.Unmarshal(b, structWithBsonTags); err != nil {
		return err
	}
	return nil
}

```

https://www.sohamkamani.com/golang/parsing-json/