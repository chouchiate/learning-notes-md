## [c] - void pointer


### open standard
* [open-standard](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf)

6.2.5 Types
...
19     The void type comprises an empty set of values; it is an incomplete object type that cannot be completed.
...
6.3.2.2 void

1     The (nonexistent) value of a void expression (an expression that has type void) shall not be used in any way, and implicit or explicit conversions (except to void) shall not be applied to such an expression. If an expression of any other type is evaluated as a void expression, its value or designator is discarded. (A void expression is evaluated for its side effects.)
...
6.5.3.4 The sizeof and _Alignof operators
...
1     The sizeof operator shall not be applied to an expression that has function type or an incomplete type, to the parenthesized name of such a type, or to an expression that designates a bit-field member. The _Alignof operator shall not be applied to a function type or an incomplete type.

> void implies no value, and has no size (which is not the same as size 0). You cannot have any objects of type void. Thus, platform doesn't play a role here at all.

> void * may be a different issue - the size and representation of a void * may vary between implementations, and typedef void * are implemented for abstraction purposes.

> dereferencing a void * leaves with a void expression, which as stated above has no value and no size; that's why you can't do pointer arithmetic on a void *, and why you need to convert it to a different pointer type before attempting to dereference it.



### void *之謎

```c
int main()
{
    char *X = 0; // a pointer to char
    void *Y = 0; // a pointer to word
    char c = *X; // a pointer to a char
    char d = *Y;
}
```
```c
int main()
{
    char *X = 0; // a pointer to char
    void *Y = 0; // a pointer to word
    char c = *X; // a pointer to a char
    char d = *(char *)Y; // Y就有明確佔用空間
}
```
```c
int main()
{
    char *X = 0; // a pointer to char
    void *Y = 0; // a pointer to word
    char c = *X; // a pointer to a char
    char d = *(double *)Y; // Alignment 所以可以執行
}

```


### Pointer Arithmetic for GNU C
* [gnu](https://gcc.gnu.org/onlinedocs/gcc-4.8.0/gcc/Pointer-Arith.html)

* 6.23 Arithmetic on void- and Function-Pointers
In GNU C, addition and subtraction operations are supported on pointers to void and on pointers to functions. This is done by treating the size of a void or of a function as 1.

A consequence of this is that sizeof is also allowed on void and on function types, and returns 1.

The option -Wpointer-arith requests a warning if these extensions are used.

### C99 on void*


