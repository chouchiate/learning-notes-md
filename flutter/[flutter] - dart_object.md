## [flutter] - dart class


### definition
```dart
class Person {
    String name = 'John';
    int age = 30;

    // constructor with required default value
    Person((String inputName, @require int age = 15) {
        name = inputName;
        this.age = age;
    }
}

void main() {
    var pl = new Person(inputName: 'Derick', age: 30);
    // or
    var pp = Person('Coco', age: 23);
    print(pp.age);
    print(pl.name);
}
```


### Abstract Class
- similar to interface
- a class that cannot be instantiated

```dart
abstract class Animal {
  int age;
  String name;

  // no method body means you're defining an abstract method
  // abstract methods must be overridden in implementation classes
  void talk();

  // abstract classes _can_ implement some functionality.
  // when the method functionality is written on the abstract class,
  // the implementation subclasses don't have to override it.
  void growl() => print('grrrrr');
}
```




