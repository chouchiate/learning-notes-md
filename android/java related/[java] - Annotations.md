## [Java] - Annotations

### @Nullable and @NotNull

* Check 'nullability' of a variable, parameter, and return value.

### @Nullable annotation
* Help detects method calls that can detect 'null'
* variables that can be 'null'.

* Methods with @Nullable in parent method can have either @Nullable or @NotNull in child class method.

### @NotNull annotation
* declare that a method should not return null.
* Variables cannot hold null value

### @override annotation
* 被標註的方法必須覆寫父類別(superclass)的同個方法。
* 表現出的行為即為物件導向中的多型(Polymorphism)，也就是一個類別(Class)可有多種實例(Instance)來解釋。
* 即使不標示@Override的方法也是可以正常的覆寫或實作父類別的同個方法，但有標示@Override會讓人直覺地了解到這個方法有覆寫父類別的方法

```java
public interface Animal {
  public void run();
}

public class Dog implements Animal {
  @Override
  public void run() {
    System.out.println("狗狗跑");
  }
}

public class HybridDog extends Dog{
  @Override
  public void run(){
    System.out.println("米克斯跑");
  }
}

```

