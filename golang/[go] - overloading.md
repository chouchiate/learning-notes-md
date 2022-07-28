## [go] - overloading functions

### 1.Different number of parameters but of the same type
#### **example**
```golang
package main

import "fmt"

func main() {
    fmt.Println(add(1, 2))
    fmt.Println(add(1, 2, 3))
    fmt.Println(add(1, 2, 3, 4))
}

func add(numbers ...int) int {
    sum := 0
    for _, num := range numbers {
        sum += num
    }
    return sum
```
### **output**
```bash
3
6
10
```

### 2.Different number of parameters and of different types
#### **example**
```golang
package main

import "fmt"

func main() {
    handle(1, "abc")
    handle("abc", "xyz", 3)
    handle(1, 2, 3, 4)
}

func handle(params ...interface{}) {
    fmt.Println("Handle func called with parameters:")
    for _, param := range params {
        fmt.Printf("%v\n", param)
    }
}
```
#### **output**
```bash
Handle func called with parameters:
1
abc
Handle func called with parameters:
abc
xyz
3
Handle func called with parameters:
1
2
3
4
```

### 3.Different number of parameters and of different types (use switch case)
#### **example**
```golang
package main

import "fmt"

type person struct {
    name   string
    gender string
    age    int
}

func main() {
    err := addPerson("Tina", "Female", 20)
    if err != nil {
        fmt.Println("PersonAdd Error: " + err.Error())
    }

    err = addPerson("John", "Male")
    if err != nil {
        fmt.Println("PersonAdd Error: " + err.Error())
    }

    err = addPerson("Wick", 2, 3)
    if err != nil {
        fmt.Println("PersonAdd Error: " + err.Error())
    }
}

func addPerson(args ...interface{}) error {
    if len(args) > 3 {
        return fmt.Errorf("Wront number of arguments passed")
    }
    p := &person{}
    //0 is name
    //1 is gender
    //2 is age
    for i, arg := range args {
        switch i {
        case 0: // name
            name, ok := arg.(string)
            if !ok {
                return fmt.Errorf("Name is not passed as string")
            }
            p.name = name
        case 1:
            gender, ok := arg.(string)
            if !ok {
                return fmt.Errorf("Gender is not passed as string")
            }
            p.gender = gender
        case 2:
            age, ok := arg.(int)
            if !ok {
                return fmt.Errorf("Age is not passed as int")
            }
            p.age = age
        default:
            return fmt.Errorf("Wrong parametes passed")
        }
    }
    fmt.Printf("Person struct is %+v\n", p)
    return nil
}
```

### overloading with interface and embedding structures
#### **output**
```bash
Person struct is &{name:Tina gender:Female age:20}
Person struct is &{name:John gender:Male age:0}
PersonAdd Error: Gender is not passed as string
```

#### **example**
```golang
package main
import "fmt"

type ThisIsATest interface {
	SayHello(input string)
	SayWorld(input string)
}

type aaa struct{}
func NewAAA() ThisIsATest {
	return &aaa{}
}

func (a *aaa) SayHello(input string) {
	fmt.Println("Hello~A ", input)
}

func (a *aaa) SayWorld(input string) {
	fmt.Println("World~A ", input)
}

type bbb struct {
	aaa // bbb has aaa
}
func NewBBB() ThisIsATest {
	return &bbb{}
}
func (b *bbb) SayHello(input string) {
	fmt.Println("Hello~B ", input)
}

func (b *bbb) SayWorld(input string) {
	fmt.Println("World~B ", input)
}

func main() {
	// New Interface doesn't support inherited methods
	// a := NewAAA()
	// b := NewBBB()
	a := &aaa{}
	b := &bbb{}
	b.aaa.SayHello("TEST!!!")       // struct embedded function can only be called within its scope, which is main in this case
	a.SayHello("Derick")
	a.SayHello("Chou")
	b.SayHello("Docker")
	b.SayWorld("Kubernetes")
}


```
#### **Output**
```bash
Hello~A  TEST!!!
Hello~A  Derick
Hello~A  Chou
Hello~B  Docker
World~B  Kubernetes
```


#### **Examples**
```golang

package main

import "fmt"

type ThisIsATest interface {
	SayHello(input string)
	SayWorld(input string)
}

type aaa struct{}

func NewAAA() ThisIsATest {
	return &aaa{}
}

func (a *aaa) SayHello(input string) {
	fmt.Println("Hello~A ", input)
}

func (a *aaa) SayWorld(input string) {
	fmt.Println("World~A ", input)
}

type bbb struct {
	aaa // bbb has aaa
}

func NewBBB() ThisIsATest {
	return &bbb{}
}
func (b *bbb) SayHello(input string) {
	fmt.Println("Hello~B ", input)
}

func (b *bbb) SayWorld(input string) {
	fmt.Println("World~B ", input)
	b.aaa.SayHello("TEST!!!")   // NewBBB wrapper can only be called within function implementations
}

func main() {
	// New Interface doesn't support inherited methods
	a := NewAAA()
	b := NewBBB()
	// a := &aaa{}
	// b := &bbb{}
	// b.aaa.SayHello("TEST!!!")
	a.SayHello("Derick")
	a.SayHello("Chou")
	b.SayHello("Docker")
	b.SayWorld("Kubernetes")
}
```
#### **OUTPUT**
```bash
Hello~A  Derick
Hello~A  Chou
Hello~B  Docker
World~B  Kubernetes
Hello~A  TEST!!!
```
