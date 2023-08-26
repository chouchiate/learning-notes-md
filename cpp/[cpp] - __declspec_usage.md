## [cpp] - __declspec 用法

> 與 Microsoft 相關的指定類型實例之儲存方式，為一種擴展屬性的定義

### extended-decl-modifier 參數
* align (c++)
* allocate (c++)
* appdomain (c++)
* deprecated (c++)
* dllimport (c++)
* dllexport (c++)
  - 被聲明為dllexport 的C++ 函數或變量，可以被其他模塊調用，而不需要顯式的定義它們的位置
  - 如果不按照C++規則, 則使用 *.def 或使用 extern "c"
* jitintrinsic (c++)
* extern (c++)
* naked (c++)
* noalias (c++)
* noinline (c++)
* nothrow (c++)
* novtable (c++)
* noreturn (c++)
* no_unique_address (c++20)
* optimize (c++)
* property (c++)
* safebuffers (c++)


### Resource

[csdn](https://blog.csdn.net/zhangzq86/article/details/52982939)