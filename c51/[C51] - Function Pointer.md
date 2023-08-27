## [Cx51] - Function Pointer 筆記

```c
typedef enum
{
	ADD = 0,
	MINUS = 1,
	MULTIPLY = 2,
	DIVIDE = 3
} eOperation;

int add(int a, int b)
{
	LED_R = 0;
	LED_G = 1;
	LED_B = 1;
	return a + b;
}
int minus(int a, int b)
{
	LED_R = 1;
	LED_G = 0;
	LED_B = 1;
	return a - b;
}
int multiply(int a, int b)
{
	LED_R = 1;
	LED_G = 1;
	LED_B = 0;
	return a * b;
}
int divide(int a, int b)
{
	LED_R = 0;
	LED_G = 0;
	LED_B = 0;
	return a / b;
}

int (*fPtrOperations[4])(int, int);

int main(void)
{
	INT16U i, val;
  for(i = 0; i <= 10000; i++);

  init_SYS();

  // Implement
	fPtrOperations[ADD] = add;
	fPtrOperations[MINUS] = minus;
	fPtrOperations[MULTIPLY] = multiply;
	fPtrOperations[DIVIDE] = divide;

  // Usage
	val = (*fPtrOperations[ADD])(4, 2);
	val = (*fPtrOperations[MINUS])(4, 2);
	val = (*fPtrOperations[MULTIPLY])(4, 2);
	val = (*fPtrOperations[DIVIDE])(4, 2);
  while (1) {}
}
```


