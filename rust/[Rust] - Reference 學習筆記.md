## [Rust] - Reference 學習心得

#### **Syntax**
  use a::b::{ c, d, e::f, g::h::i };
  ```rust
    use std::option::Option::{Some, None};

  ```

#### **Self Keyword**
  * Binding list of paths with common prefix, use ***self*** keyword
  use a::b::{ self, c, d::e };
  ```rust
    use std::collections::hash_map::{self, HashMap};
  ```

#### **As Keyword**
  * Re-binding target name as new local name, use ***as*** keyword.
  use a::b::{ self, as ab, c as abc };
  ```rust
    use defmt_rtt as _; // global logger
    use panic_probe as _;
  ```

#### **pub use**
  * Re-exporing, redirect some public name to a different target definition;
  ```rust
    pub use self::foo::{ bar, baz };
  ```

#### **Underscore Import**
  * Items can be imported without binding to a name. Useful to import ***trait***. May be used without importing symbol
  ```rust
    mod foo {
      pub trait Zoo {
        fn zoo(&self) {}
      }
      impl<T> Zoo for T {}      
    }

    use self::foo:Zoo as _;
    struct Zoo;

    fn main() {
      let z = Zoo;
      z.zoo();
    }

  ```


