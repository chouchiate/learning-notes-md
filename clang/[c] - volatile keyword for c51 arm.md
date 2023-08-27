## [c] - volatile keyword for c51/arm

volatile關鍵字可以用來提醒編譯器它後面所定義的變數可能隨時改變。

● 有volatile：
程式每次需要存儲或讀取這個變數的時候，都會直接從變數地址中讀取數據。

● 沒有volatile：
則編譯器可能優化讀取和存儲，可能暫時使用暫存器中的值，如果這個變量由別的程序更新了的話，將出現不一致的現象。

### example

I/O, 假設有一程式片斷如下

```c
  u8 *Port;
  u8 a,b,c;
  Port =(U8*)0x4000;
  a=*Port;
  b=*Port;
  c=*Port;
```
以上的a,b,c很有可能被compiler最佳化而導致產生
```c
  a=b=c=*Port
```
也就是說只從Port讀取一次, 而產生a=b=c的結果, 但是原本的程式的目的是要從同一個I/O port讀取3次的值給不同的變數，a,b,c的值可能不同(例如從此I/O port 讀取氣溫), 因此a=b=c的結果不是我們所要的。

所以 將 u8 *Port; 改為volatile u8 *Port; 告訴compiler，Port變數具有揮發性的特性, 所以與它有關的程式碼請不要作最佳化動作，**請真正的重做三次以下動作**：

```c
  a=*Port;
  b=*Port;
  c=*Port;
```


Global variables in Multithread program
* 這是在撰寫multithread program時最容易被忽略的一部份
* 此原因所造成的bug通常相當難解決(因為不穩定)

假設有以下程式片斷, thread 1 & thread 2 共用一個 global var: gData
```c 
int  gData;   // global
// thread 1: 
while (1) {
  ...
  gData = rand();
  ...
}


```
```c
extern int gData;
// thread 2: 
int i, j, k
for (i = 0; i < 1000; i++) {
  j = gData;
  ...
}

```

在 thread 2的 for loop中, 聰明的 compiler 看到 gData 的值, 每次都重新從 memory load  到register, 實在沒效率, 因此會產生如下的 code (注意, tmp 也可以更進一步的用 register 取代):
```c
tmp = gData;
    for (i = 0; i < 1000; i++)    
    {                                   
        /* A */
        j = tmp;                      
        ....                            
    }      
```
也就是gData只讀取一次, 這下子問題來了, 說明如下:

* thread 2 在執行 for loop 到 j = gData 的前一列(A)的時候(假設此時gData=tmp=5), 被切換到thread 1執行

* 在 thread 1 的 while loop 中透過 gData = rand(), 對gData做了修改(假設改為1), 再切換回thread 2執行
繼續執行 j = gData, 產生 j = 5 的結果, 但是正確的結果應該是 j = 1, 怎麼辦? 也是用 volatile,

在 thread 1 中:
```c
int  gData;  
//改為
volatile int  gData;  
```
在 thread 2 中, 
```c
extern int  gData;  
// 改為
extern volatile int  gData;  
```

### external
[arm](https://www.keil.com/support/man/docs/c51/c51_le_volatile.htm)
[slides](https://www.slideshare.net/itembedded/c-15114849)