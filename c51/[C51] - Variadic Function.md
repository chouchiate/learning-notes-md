## [C51] Variadic Function

### Variable Length Argument Routines
| Routine | Attribute | Description |
| ---- | ---- | ---- |
| va_arg | reentrant | retrieves an argument from an argument list |
| va_end | reentrant | resets an argument pointer |
| va_start | reentrant | sets a pointer to the beginning of an argument list |

### va_arg
```c
#include <stdarg.h>
type va_arg(
  argptr,     
  type        
);
```
* argptr - 指針 variable length argument list
* type - 定義 variable-length arugment 型別

### va_start

```c
#include <stdarg.h>
void va_start (
  argptr,
  prevparm
);
```

### va_end
```c
#include <stdarg.h>
void va_end (
  argptr
);
```

### example

```c
#include <stdarg.h>
#include <stdio.h>

int varfunc (char *buf, int id, ...) {
  va_list tag;
  va_start (tag, id);

  if (id == 0)
  {
    int arg1; 
    char *arg2;
    long arg3;

    arg1 = va_arg (tag, int);
    arg2 = va_arg (tag, char *);
    arg3 = va_arg (tag, long);
  }

  else {
    char *arg1;
    char *arg2;
    long arg3;

    arg1 = va_arg (tag, char *);
    arg2 = va_arg (tag, char *);
    arg3 = va_arg (tag, long);
  }

  va_end (tag);
}

int main (void) {
  char tmp_buffer [10];

  varfunc (tmp_buffer, 0, 27, "Test Code", 100L);
  varfunc (tmp_buffer, 1, "Test", "Code", 348L);
}

```

### Source
* [stdarg.h](https://www.keil.com/support/man/docs/c51/c51_stdarg_h.htm)
* [va_](https://www.keil.com/support/man/docs/c51/c51_lib_vararg.htm)