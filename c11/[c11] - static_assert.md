## [c11] - static assert
* a useful function to find bugs in code during runtime
* assert() tests that
  * [invariants](https://en.wikipedia.org/wiki/Invariant_(mathematics)#Invariants_in_computer_science),
  * [preconditions](https://en.wikipedia.org/wiki/Precondition), or
  * [postconditions](https://en.wikipedia.org/wiki/Postcondition)

  are met at runtime.

### 3 use cases for assert() in embedded system
1. Stopping the program during debugging and showing the point of failure
2. Restarting the software when an error condition was detected during runtime
3. Persists the point of failure for later reporting, when the software is shipped

### GCC assert

```c
# define assert(__e) \
    ((__e) \
        ? (void)0 \
        : __assert_func( \
            __FILE__, \
            __LINE__, \
            __PRETTY_FUNCTION__, \
            #__e) \
    )

// https://github.com/gcc-mirror/gcc/blob/master/fixincludes/tests/base/assert.h
#if defined( ALPHA_ASSERT_CHECK )
#define assert(EX) ((EX) ? (void)0 : __assert(#EX, __FILE__, __LINE__))
#endif  /* ALPHA_ASSERT_CHECK */
```


```c
* The _Static_assert is a keyword defined in the C11 version of C.
* It evaluates a constant expression at compile-time and compares the result with 0.
// cdefs.h in esp-idf
// #include <assert.h>
#define	_Static_assert(x, y)	static_assert(x, y)
```
### Syntax

```c
_Static assert(expression, message)
```
* expression: integer constant expression
* message: string literal

```c
#include <stdio.h>
#include <assert.h>

int main(){
  //Expression evaluated to True
  _Static_assert (1+1 == 2, "True!");

  return 0;
}
```

### When Not to Assert

1. Avoid asserting on boot up sequences. This is the most common way to introduce reboot loops.
2. Don’t assert on operations that depend on the hardware behaving appropriately. If a sensor says it will return a value between 0-100, it’s probably best not assert when it’s above 100, because you can never trust today’s cheap hardware.
3. Don’t assert on the contents of data read from persistent storage, unless it’s guaranteed to be valid. The data read from flash or a filesystem could be corrupted.
4. If it is very likely the system will recover in a few moments, it might be best to not assert. e.g. when running out of heap or byte pool allocations during a spike in network packets.
