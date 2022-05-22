## Callbacks in C

* A callback is any executable code that is passed as an argument to other code, which is expected to call back (execute) the argument at a given time
* In simple language, If a reference of a function is passed to another function as an argument to call it, then it will be called as a Callback function.
* In C, a callback function is a function that is called through a [function pointer](https://www.geeksforgeeks.org/function-pointer-in-c/).

```
// A simple C program to demonstrate callback
#include<stdio.h>

void A()
{
    printf("I am function A\n");
}

// callback function
void B(void (*ptr)())
{
    (*ptr) (); // callback to A
}

int main()
{
    void (*ptr)() = &A;

    // calling function B and passing
    // address of the function A as argument
    B(ptr);

   return 0;
}
```

### Example Code

```c
#include<stdio.h>
void my_function() {
   printf("This is a normal function.");
}
void my_callback_function(void (*ptr)()) {
   printf("This is callback function.\n");
   (*ptr)();   //calling the callback function
}
main() {
   void (*ptr)() = &my_function;
   my_callback_function(ptr);
}
```

### Output

```
This is callback function.
This is a normal function.
```

