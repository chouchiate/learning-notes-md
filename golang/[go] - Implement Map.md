## [go] - Implement Map

* To implement a set using make(map[])
```go
set := make(map[string]bool)    //new empty set with key:string of value:bool

set["foo"] = true   // add a set

// to loop through a set
for k := range set {
    fmt.Println(k)
}

// delete a set
delete(set, "foo")

// get size of sets
size := len(set)

// check membership
exits := set["Foo"]

```

* Declare empty set with empty struct
```go
type void struct{}
var member void

set := make(map[string]void)        // use no memory
set1 := make(map[string]struct{})   // same thing

set["Foo"] = member          // Add
for k := range set {         // Loop
    fmt.Println(k)
}
delete(set, "Foo")      // Delete
size := len(set)        // Size
_, exists := set["Foo"] // Membership

```