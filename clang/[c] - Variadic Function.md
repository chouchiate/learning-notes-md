## [c] - Variadic Function

[why-variadic](https://www.gnu.org/software/libc/
manual/html_node/Why-Variadic.html)

[formatted-output](https://www.gnu.org/software/libc/manual/html_node/Formatted-Output.html)

### **Syntax
```c
int function_name(data_type variable_name, ...);
```

### Header File
```c
$include <stdarg.h>
```

### Methods
|Methods|Description|
|---|---|
|va_start(va_list ap, argN)|This enables access to variadic function arguments.|
|va_arg(va_list ap, type)|This one accesses the next variadic function argument.|
|va_copy(va_list dest, va_list src)|This makes a copy of the variadic function arguments.|
|va_end(va_list ap)|This ends the traversal of the variadic function arguments.|

> **va_list** hods the information needed by
> * va_start,
> * va_arg,
> * va_end, and
> * va_copy


### Example Program
```c
// C program for the above approach

#include <stdarg.h>
#include <stdio.h>

// Variadic function to add numbers
int AddNumbers(int n, ...)
{
	int Sum = 0;

	// Declaring pointer to the
	// argument list
	va_list ptr;

	// Initializing argument to the
	// list pointer
	va_start(ptr, n);

	for (int i = 0; i < n; i++)

		// Accessing current variable
		// and pointing to next one
		Sum += va_arg(ptr, int);

	// Ending argument list traversal
	va_end(ptr);

	return Sum;
}

// Driver Code
int main()
{
	printf("\n\n Variadic functions: \n");

	// Variable number of arguments
	printf("\n 1 + 2 = %d ",
		AddNumbers(2, 1, 2));

	printf("\n 3 + 4 + 5 = %d ",
		AddNumbers(3, 3, 4, 5));

	printf("\n 6 + 7 + 8 + 9 = %d ",
		AddNumbers(4, 6, 7, 8, 9));

	printf("\n");

	return 0;
}
/* Output
Variadic functions:

 1 + 2 = 3
 3 + 4 + 5 = 12
 6 + 7 + 8 + 9 = 30
*/
```
### Example2
```c
// C program for the above approach
#include <stdarg.h>
#include <stdio.h>

// Variadic function to add numbers
int LargestNumber(int n, ...)
{
	int min = 0;

	// Declaring pointer to the
	// argument list
	va_list ptr;

	// Initializing argument to the
	// list pointer
	va_start(ptr, n);

	for (int i = 0; i < n; i++) {

		// Accessing current variable
		// and pointing to next
		int temp = va_arg(ptr, int);
		min = temp > min ? temp : min;
	}

	// End of argument list traversal
	va_end(ptr);

	return min;
}

// Driver Code
int main()
{
	printf("\n\n Variadic functions: \n");

	// Variable number of arguments
	printf("\n %d ",
		LargestNumber(2, 1, 2));

	printf("\n %d ",
		LargestNumber(3, 3, 4, 5));

	printf("\n %d ",
		LargestNumber(4, 6, 7, 8, 9));

	printf("\n");

	return 0;
}
/* Output
Variadic functions:

 2
 5
 9
*/
```