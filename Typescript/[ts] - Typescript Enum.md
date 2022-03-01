## [Typescript] - Enum 學習筆記


#### Topics
* Basic usage
* How to get key list
* How to get value list
* How to check if the value is in the enum
* How to get key name by value
* How to get value by key name
* How to handle when an enum contains both number and string
* Is it possible to use generic function for enum?
* Compare Enum

#### Basic Usage

```typescript
  enum WithoutValues {
      First,
      Second,
      Third,
  }
  console.log(WithoutValues.First);
  console.log(WithoutValues.Second);
  console.log(WithoutValues.Third);
  // 0
  // 1
  // 2
```

```typescript 
  enum WithValues2 {
      First,
      Second = 5,
      Third,
  }
  console.log(WithValues2.First);
  console.log(WithValues2.Second);
  console.log(WithValues2.Third);
  // 0
  // 5
  // 6
```

```typescript
enum LogLevel {
    Trace = -20,
    Debug = -10,
    Info = 0,
    Warn = 10,
    Error = 20,
    Off = 99,
}

enum LogLevelString {
    Trace = "Trace-Level",
    Debug = "Debug-Level",
    Info = "Info-Level",
    Warn = "Warn-Level",
    Error = "Error-Level",
    Off = "Off-Level",
}
console.log(LogLevel.Error);
console.log(LogLevelString.Error);
// 20
// Error-Level
```

#### How to get Key List

```typescript
console.log(Object.keys(LogLevel));
// [
//   '0',     '10',    '20',
//   '99',    'Trace', '-20',
//   'Debug', '-10',   'Info',
//   'Warn',  'Error', 'Off'
// ]
console.log(Object.keys(LogLevelString));
// [ 'Trace', 'Debug', 'Info', 'Warn', 'Error', 'Off' ]
```

```typescript
enum LogLevel {
    Trace = -20,
    Debug = -10,
    Info = 0,
    Warn = 10,
    Error = 20,
    Off = 99,
}
const keys = Object.keys(LogLevel).filter((x) => Number.isNaN(Number(x)));
console.log(keys);  // keys
// [ 'Trace', 'Debug', 'Info', 'Warn', 'Error', 'Off' ]
```

#### How to get value List

```typescript
enum LogLevel {
    Trace = -20,
    Debug = -10,
    Info = 0,
    Warn = 10,
    Error = 20,
    Off = 99,
}
const values = Object.keys(LogLevel).filter((x) => !Number.isNaN(Number(x)));
console.log(values);
// [ '0', '10', '20', '99', '-20', '-10' ]
```

```typescript
enum LogLevelString {
  Trace = "Trace-Level",
  Debug = "Debug-Level",
  Info = "Info-Level",
  Warn = "Warn-Level",
  Error = "Error-Level",
  Off = "Off-Level",
}
console.log(Object.values(LogLevelString));
// [
//   'Trace-Level',
//   'Debug-Level',
//   'Info-Level',
//   'Warn-Level',
//   'Error-Level',
//   'Off-Level'
// ]
```

#### How to check if the value is in the enum

```typescript
enum LogLevel {
    Info = 0,
    Warn = 10,
    Error = 20,
}
console.log(10 in LogLevel);
// true
console.log(11 in LogLevel);
// false
```

```typescript
enum LogLevelString {
    Trace = "Trace-Level",
    Debug = "Debug-Level",
}

enum MixEnum {
    Trace = -20,
    Debug = "Debug-Level",
}
console.log("Debug-Level" in LogLevelString);
// false
console.log(-20 in MixEnum);
// true
console.log("Debug-Level" in MixEnum);
// false
```

```typescript
enum LogLevelString {
    Trace = "Trace-Level",
    Debug = "Debug-Level",
}
const exists = (value: string) => Object.values(LogLevelString).includes(value as any);
console.log(exists("Debug-Level"));
// true
console.log(exists("Undefined-Level"));
// false
```

#### How to get key name by value
```typescript
enum LogLevel {
    Trace = -20,
    Debug = -10,
    Info = 0,
    Warn = 10,
    Error = 20,
    Off = 99,
}
function getKeyName(value: LogLevel) {
    return LogLevel[value];
}
console.log(getKeyName(-20));
// Trace
console.log(getKeyName(-22));
// undefined
```

```typescript
enum LogLevelString {
    Trace = "Trace-Level",
    Debug = "Debug-Level",
    Info = "Info-Level",
    Warn = "Warn-Level",
    Error = "Error-Level",
    Off = "Off-Level",
}
function getKeyName(value: string) {
    return LogLevelString[value];
//   Element implicitly has an 'any' type because expression of type 'string' can't be used to index type 'typeof LogLevelString'.
//   No index signature with a parameter of type 'string' was found on type 'typeof LogLevelString'.ts(7053)
}
```

```typescript
function getKeyName(value: string) {
    return Object.entries(LogLevelString).find(([key, val]) => val === value)?.[0];
}
console.log(getKeyName("Warn-Level"));
// Warn
console.log(getKeyName("Undefined-Level"));
// undefined
```

#### How to get value by key name
```typescript
enum LogLevel {
    Trace = -20,
    Debug = -10,
    Info = 0,
    Warn = 10,
    Error = 20,
    Off = 99,
}
console.log(LogLevel["Warn"]);
// 10
function getValueByKeyError(value: string) {
    return LogLevel[value];
    // Element implicitly has an 'any' type because index expression is not of type 'number'.ts(7015)
}
```
```typescript
function getValueByKeyForNumberEnum(value: string) {
    return Object.entries(LogLevel).find(([key, val]) => key === value)?.[1];
}
function getValueByKeyForStringEnum(value: string) {
    return Object.entries(LogLevelString).find(([key, val]) => key === value)?.[1];
}
console.log(getValueByKeyForNumberEnum("Error"));
// 20
console.log(getValueByKeyForStringEnum("Warn"));
// Warn-Level
console.log(getValueByKeyForStringEnum("Error"));
// Error-Level
```
#### How to handle when an enum contains both number and string

```typescript
enum MixEnum {
    Trace = -20,
    Debug = "Debug-Level",
    Info = "Info",
}
console.log(Object.keys(MixEnum));
// [ 'Trace', '-20', 'Debug', 'Info' ]
console.log(Object.values(MixEnum));
// [ -20, 'Trace', 'Debug-Level', 'Info' ]

const keyList = Object.keys(MixEnum).filter((x) => Number.isNaN(Number(x)));
console.log(keyList);
// [ 'Trace', 'Debug', 'Info' ]

const valueList = Object.values(MixEnum).filter((val) => {
    const keys = Object.keys(MixEnum).filter((x) => Number.isNaN(Number(x)));
    return !keys.includes(val as any);
});
console.log(valueList);
// [ -20, 'Debug-Level' ]
```

#### Is it possible to use generic function for enum?
```typescript
function getValueByKey<T extends enum>(value: string) {
    return Object.entries(T).find(([key, val]) => key === value)?.[1];
}
```

#### Compare Enums

```typescript
let e1: E = E.A
let e2: E = E.B


if (e1 as E === e2 as E) {
  console.log("equal")
}
```