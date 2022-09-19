## [clang] - GNU Macros

### object like macros

* multiple line definitions
```c
#define NUMBERS 1, \
                2, \
                3
int x[] = { NUMBERS };
// equivalent to int x[] = { 1, 2, 3 };
```

### Function Like Macros

```c
#define lang_init()  c_init()
lang_init()
// equivalent to c_init()
```

```c
extern void foo(void);
#define foo() /* optimized inline version */
…
  foo();
  funcptr = foo;
```

### Macro Arguments
> Function-Like Macros can take arguments

```c
#define min(X, Y)  ((X) < (Y) ? (X) : (Y))
  x = min(a, b);          //  x = ((a) < (b) ? (a) : (b));
  y = min(1, 2);          //  y = ((1) < (2) ? (1) : (2));
  z = min(a + 28, *p);    //  z = ((a + 28) < (*p) ? (a + 28) : (*p));
```


### Macros Pitfalls

### Mis-nesting

### Operator-Precedence

### Swallowing Semicolon

```c
// argument p is a pointer of string
#define SKIP_SPACES(p, limit)  \  // backslash-newline is used to split the macro definition
{ char *lim = (limit);         \
  while (p < lim) {            \
    if (*p++ != ' ') {         \
      p--; break; }}}
```

> This can cause trouble before else statements, because the semicolon is actually a null statement. Suppose you write
```c
if (*p != 0)
  SKIP_SPACES (p, lim);
else …
```
> The presence of two statements—the compound statement and a null statement—in between the if condition and the else makes invalid C code.

> The definition of the macro SKIP_SPACES can be altered to solve this problem, using a do … while statement. The loop executes exactly once;
```c
#define SKIP_SPACES(p, limit)     \
do { char *lim = (limit);         \
     while (p < lim) {            \
       if (*p++ != ' ') {         \
         p--; break; }}}          \
while (0)
```

[doc](https://gcc.gnu.org/onlinedocs/cpp/Swallowing-the-Semicolon.html#Swallowing-the-Semicolon)


### external
[gnu-guide](https://gcc.gnu.org/onlinedocs/cpp/Macros.html#Macros)
