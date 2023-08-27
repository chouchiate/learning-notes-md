## [C99] Designated Initializer

C90 standard require element of an initializer to appear in a fix order

C99 don't

### Syntax

```c
int a[6] = { [4]=29,[2]=15 };	// or
int a[6] = { [4]29, [2]15 };
// is equivalent to 
int a[6] = {0,0,15,0,29,0};
// to initialize a range of elements, write [ first ... last ] = value
int a[] = { [0 ... 9]=1, [10 ... 99]=2, [100]=3 };


```

