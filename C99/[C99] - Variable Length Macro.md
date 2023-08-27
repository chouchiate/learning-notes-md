## [C99] - Variable Length Macro

### 不定長度引數 (Variable Length Macro)
* 無法事先得知要傳遞的參數個數

### 方法一
* 透過陣列 Initialize (double *params)

```c
#include <stdio.h>

void foo(int len, double* params);

int main(void) {
    double x = 1.1, y = 2.1, z = 3.9;
    double a = 0.1, b = 0.2, c = 0.3;

    puts("三個參數：");
    foo(3, (double[]) {x, y, z});

    puts("六個參數：");
    foo(6, (double[]) {x, y, z, a, b, c});

    return 0;
}

void foo(int len, double* params) {
    for(int j = 0; j < len; j++) {
        printf("%.1f\n", params[j]);
    }
}

```

### 方法二
* 不定長度引數（Variable-length argument）的使用
```c
// 必須包含 stdarg.h 標頭檔案
  #include <stdarg.h>
```

### 建立不定長度引數的識別字
1. va_list: 
    * 個特殊的型態（type），在 va_start、 va_arg 與 va_end 三個巨集（macro）中當作參數使用。

2. va_start
    * 啟始不定長度引數的巨集，第一個引數是 va_list，第二個引數是最後一個具名參數。
3. va_arg
    * 讀取不定長度引數的巨集。
4. va_end
    * 終止不定長度引數的巨集。

```c
// 在宣告不定長度引數時，函式定義時 ... 前至少要有一個具名參數，之後使用 ... 表示將使用不定長度引數，例如：
void foo(int, ...);

```
### va_list
* The va_list type is an array containing a single element of one structure containing the necessary information to implement the va_arg macro.
```c
// typedef within x86-64 system V ABI doc
typedef struct {
   unsigned int gp_offset;
   unsigned int fp_offset;
   void *overflow_arg_area;
   void *reg_save_area;
} va_list[1];

```
### va_start
```c
// The va_start macro enables access to the variable arguments following the named argument parmN.
/**
 * @Notes Defined in header <stdarg.h>
 *   void va_start( va_list ap, parmN );
 * @param ap - an instance of va_list type
 * @param paramN - the named parameter preceding the first variable paramter
 */
#include <stdio.h>
#include <stdarg.h>
 
int add_nums(int count, ...) 
{
    int result = 0;
    va_list args;
    va_start(args, count);
    for (int i = 0; i < count; ++i) {
        result += va_arg(args, int);
    }
    va_end(args);
    return result;
}
 
int main(void) 
{
    printf("%d\n", add_nums(4, 25, 25, 50, 50));
}

```

### va_arg
```c
// 在使用 va_arg 巨集取出引數內容時，必須指定將以何種資料型態取出

/**
 * @Notes Defined in header <stdarg.h>
 *        T va_arg( va_list ap, T );
 * @params ap - an instance of the va_list type
 * @params T - the type of the next parameter in ap
 */
va_arg(num_list, double);

```


### va_list, va_start, va_end example
```c
#include <stdio.h>
#include <stdarg.h>

void foo(int, ...);

int main(void) {
    double x = 1.1, y = 2.1, z = 3.9;
    double a = 0.1, b = 0.2, c = 0.3;

    puts("三個參數：");
    foo(3, x, y, z);

    puts("六個參數：");
    foo(6, x, y, z, a, b, c);

    return 0;
}
// 首個參數用來規範不定長度型態，也是唯一的具名參數，就用來作為指定將有幾個不定長度引數
void foo(int len, ...) {
    va_list args;
    va_start(args, len);

    for(int j = 0; j < len; j++) {
        printf("%.1f\n", va_arg(args, double));
    }

    va_end(args);
}
```
### 執行結果
```bash
# 三個參數：
1.1
2.1
3.9
# 六個參數：
1.1
2.1
3.9
0.1
0.2
0.3
```

### example 2
```c
#include <stdio.h>
#include <stdarg.h>

void print_positive_ints(int, ...);

int main(void) {

    print_positive_ints(1, 2, 3, 4, 5, -1);

    return 0;
}

void print_positive_ints(int first, ...) {
    va_list args;
    va_start(args, first);

    for(int arg = first; arg > 0; arg = va_arg(args, int)) {
        printf("%d\n", arg);
    }

    va_end(args);
}

```
### 執行結果
```bash
1
2
3
4
5
```

### external reference

[va_arg](https://en.cppreference.com/w/c/variadic/va_arg)
[x86-64 system V ABI](https://github.com/hjl-tools/x86-psABI/wiki/x86-64-psABI-1.0.pdf)

