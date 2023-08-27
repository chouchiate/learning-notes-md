## [c] - pointer of pointer

* Let’s say you have a pointer. Its value is an address.
* but now you want to change that address.
* you could. by doing pointer1 = pointer2, you give pointer1 the address of pointer2.
* but! **if you do that within a function**, and you want the **result to persist** after the function is done, you need do some extra work. you need a new pointer3 just to point to pointer1. **pass pointer3 to the function**.

* here is an example. look at the output below first, to understand.

```c
#include <stdio.h>

int main()
{
    int c = 1;
    int d = 2;
    int e = 3;
    int * a = &c;
    int * b = &d;
    int * f = &e;
    int ** pp = &a;  // pointer to pointer 'a'

    printf("\n a's value: %x \n", a);
    printf("\n b's value: %x \n", b);
    printf("\n f's value: %x \n", f);
    printf("\n can we change a?, lets see \n");
    printf("\n a = b \n");
    a = b;
    printf("\n a's value is now: %x, same as 'b'... it seems we can, but can we do it in a function? lets see... \n", a);
    printf("\n cant_change(a, f); \n");
    cant_change(a, f);
    printf("\n a's value is now: %x, Doh! same as 'b'...  that function tricked us. \n", a);

    printf("\n NOW! lets see if a pointer to a pointer solution can help us... remember that 'pp' point to 'a' \n");
     printf("\n change(pp, f); \n");
    change(pp, f);
    printf("\n a's value is now: %x, YEAH! same as 'f'...  that function ROCKS!!!. \n", a);
    return 0;
}

void cant_change(int * x, int * z){
    x = z;
    printf("\n ----> value of 'a' is: %x inside function, same as 'f', BUT will it be the same outside of this function? lets see\n", x);
}

void change(int ** x, int * z){
    *x = z;
    printf("\n ----> value of 'a' is: %x inside function, same as 'f', BUT will it be the same outside of this function? lets see\n", *x);
}
```

> Here is the output: (read this first)

```bash
 a's value: bf94c204

 b's value: bf94c208

 f's value: bf94c20c

 can we change a?, lets see

 a = b

 a's value is now: bf94c208, same as 'b'... it seems we can, but can we do it in a function? lets see...

 cant_change(a, f);

 ----> value of 'a' is: bf94c20c inside function, same as 'f', BUT will it be the same outside of this function? lets see

 a's value is now: bf94c208, Doh! same as 'b'...  that function tricked us.

 NOW! lets see if a pointer to a pointer solution can help us... remember that 'pp' point to 'a'

 change(pp, f);

 ----> value of 'a' is: bf94c20c inside function, same as 'f', BUT will it be the same outside of this function? lets see

 a's value is now: bf94c20c, YEAH! same as 'f'...  that function ROCKS!!!.
```