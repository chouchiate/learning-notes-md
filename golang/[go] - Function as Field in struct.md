## [go] - Function as a Field in Golang Struct

#### Syntax
```go
type function_name func()
type strcut_name struct{
  var_name  function_name
}
```
#### Example 1
```go
// Go program to illustrate the function
// as a field in Go structure
package main
  
import "fmt"
  
// Finalsalary of function type
type Finalsalary func(int, int) int
  
// Creating structure
type Author struct {
    name      string
    language  string
    Marticles int
    Pay       int
  
    // Function as a field
    salary Finalsalary
}
  
// Main method
func main() {
  
    // Initializing the fields
    // of the structure
    result := Author{
        name:      "Sonia",
        language:  "Java",
        Marticles: 120,
        Pay:       500,
        salary: func(Ma int, pay int) int {
            return Ma * pay
        },
    }
  
    // Display values
    fmt.Println("Author's Name: ", result.name)
    fmt.Println("Language: ", result.language)
    fmt.Println("Total number of articles published in May: ", result.Marticles)
    fmt.Println("Per article pay: ", result.Pay)
    fmt.Println("Total salary: ", result.salary(result.Marticles, result.Pay))
}
```
#### Output
```text
Author's Name:  Sonia
Language:  Java
Total number of articles published in May:  120
Per article pay:  500
Total salary:  60000
```

#### Example 2
```go
// Go program to illustrate the function
// as a field in Go structure
// Using anonymous function
package main
  
import "fmt"
  
// Creating structure
type Author struct {
    name      string
    language  string
    Tarticles int
    Particles int
    Pending   func(int, int) int
}
  
// Main method
func main() {
  
    // Initializing the fields
    // of the structure
    result := Author{
        name:      "Sonia",
        language:  "Java",
        Tarticles: 340,
        Particles: 259,
        Pending: func(Ta int, Pa int) int {
            return Ta - Pa
        },
    }
  
    // Display values
    fmt.Println("Author's Name: ", result.name)
    fmt.Println("Language: ", result.language)
    fmt.Println("Total number of articles: ", result.Tarticles)
      
    fmt.Println("Total number of published articles: ",
                                      result.Particles)
      
    fmt.Println("Pending articles: ", result.Pending(result.Tarticles,
                                                   result.Particles))
}
```

#### Output
```text
Author's Name:  Sonia
Language:  Java
Total number of articles:  340
Total number of published articles:  259
Pending articles:  81
```
