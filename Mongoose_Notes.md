## Mongoose_Notes



### SchemaType

* Configuration Object of **Mongoose Model**

* Valid SchemaType

* ```
  String
  Number
  Date
  Buffer
  Boolean
  Mixed
  ObjectId
  Array
  Decimal128
  Map
  Schema
  ```

### Built-in Validator

* All SchemaType have built-in **required** validator
  * use **checkRequired()**  function to determine if satisfied.
* Numbers have built-in **min** & **max** validators
* Strings have built-in **enum**, **match**, **minLength** and **maxLength** validators

