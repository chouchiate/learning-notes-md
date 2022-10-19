## [c] data structure alignment

> 每種類型除了char 都有對齊要求(alignment requirement);

* char 類型可以開始於任何地址，
* ２字節的 short 類型必須存放在偶數地址上，
* ４字節的整型或浮點型必須放在能被４整除的位置上，
* ８字節的long或double型必須放在能被８整除的地址上。有符號或無符號沒有差別。

> 基本Ｃ類型在 X86 和 ARM 上都是自對齊的（self-aligned）。
>
> 指針，不管是32位（４字節）還是64位（８字節）也是自對齊的。

### 對齊填充 padding

```c
// example variable definition

char *p;
char c;
int x;


// c 的存儲緊跟着 p。但 x 的４字節對齊要求造成一個缺口，就好像有第四個變量插入其中 (pad[3])
```c
char *p;      /* 4 or 8 bytes */
char c;       /* 1 byte */
char pad[3];  /* 3 bytes */
int x;        /* 4 bytes */
```


> what if x is short
```c
struct foo {
    char *p;
    char c;
    short x;
}

// 內存實際分佈
char *p;      /* 4 or 8 bytes */
char c;       /* 1 byte */
char pad[1];  /* 1 byte */
short x;      /* 2 bytes */
```


> if on 64 bit machine and x is long
```c
struct foo {
    char *p;
    char c;
    long x;
}

char *p;     /* 8 bytes */
char c;      /* 1 byte */
char pad[7]; /* 7 bytes */
long x;      /* 8 bytes */
```
> 如果更短類型的變量放在前面
```c
struct foo {
    char c;
    char *p;
    int x;
}

// 如果實際的內存分佈寫成這樣：
char c;
char pad1[M];
char *p;
char pad2[N];
int x;

// N 是０。　
// x 的地址緊接着 p，保證了x 是指針對齊的，而指針對齊肯定比整型對齊更嚴。

// c極有可能被映射到機器字的第一個字節上。
// 因此 M 是能讓 p 滿足指針對齊的數目－在32位機上是３，在64位上是７。

// 讓這些變量佔用較少的空間，可以交換x和c的位置
char *p;     /* 8 bytes */
long x;      /* 8 bytes */
char c;      /* 1 byte
```

### 結構體 structure 對齊和填充
在Ｃ中，結構的地址等於它的第一個成員的地址－沒有前導填充
結構體實例會和它的最寬成員一樣對齊 保證所有成員自對齊以獲得快速存取的最容易方法。

使用ANSI C 提供的offset()宏來得到結構成員的偏移

> consider following structure
```c
struct foo1 {
    char *p;
    char c;
    long x;
};
```

> on a 64bit machine, any variable of struct foo1 的實例都是８字節對齊的。
```c
struct foo1 {
    char *p;     /* 8 bytes */
    char c;      /* 1 byte*/
    char pad[7]; /* 7 bytes */
    long x;      /* 8 bytes */
};
```
> 就好像這些變量是單獨聲明的。　但如果我們把c放到第一位，就不是這樣了
```c
struct foo2 {
    char c;      /* 1 byte */
    char pad[7]; /* 7 bytes */
    char *p;     /* 8 bytes */
    long x;      /* 8 bytes */
};
```

### Structure Trailing Padding (拖尾填充) with Stride addressing (跨步地址)
> 結構體的拖尾填充一直延伸到它的跨步地址。

```c
struct foo3 {
    char *p;     /* 8 bytes */
    char c;      /* 1 byte */
};

struct foo3 singleton;
struct foo3 quad[4];

// sizeof(struct foo3) is not 9. it is actually 16。
// (stride address)跨步地址即 quad[0].p 的地址

// 內存分佈 same as
struct foo3 {
    char *p;     /* 8 bytes */
    char c;      /* 1 byte */
    char pad[7];
};

```

By contract, consider the following example
```c
struct foo4 {
    short s;     /* 2 bytes */
    char c;      /* 1 byte */
};

// memory allocation similar to
struct foo4 {
    short s;     /* 2 bytes */
    char c;      /* 1 byte */
    char pad[1];
};

// sizeof(struct foo4) = 4
```

> consider bit field allocation
```c
struct foo5 {
    short s;
    char c;
    int flip:1;
    int nybble:4;
    int septet:7;
};

// 從編譯器的角度來看，struct foo5裏的位域就像２字節，16位的字符數組，只用到了12位。
struct foo5 {
    short s;       /* 2 bytes */
    char c;        /* 1 byte */
    int flip:1;    /* total 1 bit */
    int nybble:4;  /* total 5 bits */
    int septet:7;  /* total 12 bits */
    int pad1:4;    /* total 16 bits = 2 bytes */
    char pad2;     /* 1 byte */
};

> 如果你的結構體中含有結構體，裏面的結構體也要和最長的標量有相同的對齊。
```c
struct foo6 {
    char c;
    struct foo5 {
        char *p;
        short x;
    } inner;
};

// char *p 成員不但使外層結構體也使內層結構體處在指針對齊的位置上。
// in 64 bit machine
struct foo6 {
    char c;           /* 1 byte*/
    char pad1[7];     /* 7 bytes */
    struct foo6_inner {
        char *p;      /* 8 bytes */
        short x;      /* 2 bytes */
        char pad2[6]; /* 6 bytes */
    } inner;
};

```

### 結構成員重排
> 溢出只發生在兩個地方
1. 較大的數據類型（從而需要更嚴格的對齊）跟在較小的數據後面
2. 另一個是結構體自然結束的位置到跨步地址之間需要填充，以使下一個相同結構能正確地對齊。

> 最簡單的消除溢出的方式是按對齊值的遞減來排序成員。

```c
struct foo7 {
    char c;
    struct foo7 *p;
    short x;
};

// original padding
struct foo7 {
    char c;         /* 1 byte */
    char pad1[7];   /* 7 bytes */
    struct foo7 *p; /* 8 bytes */
    short x;        /* 2 bytes */
    char pad2[6];   /* 6 bytes */
};

// re-ordering structure
struct foo8 {
    struct foo8 *p;
    short x;
    char c;
};

// padding decrease
struct foo8 {
    struct foo8 *p; /* 8 bytes */
    short x;        /* 2 bytes */
    char c;         /* 1 byte */
    char pad[5];    /* 5 bytes */
};

```


```c
struct foo9 {
    struct foo9_inner {
        char *p;      /* 8 bytes */
        int x;        /* 4 bytes */
    } inner;
    char c;           /* 1 byte*/
};

// show padding
struct foo9 {
    struct foo9_inner {
        char *p;      /* 8 bytes */
        int x;        /* 4 bytes */
        char pad[4];  /* 4 bytes */
    } inner;
    char c;           /* 1 byte*/
    char pad[7];      /* 7 bytes */
};

// c不能放進內層結構的拖尾填充
// 爲了節省這些空間你要重新設計數據結構。
```


### 結構瘦身



### progma pack
> 使用#pragma pack的唯一合理理由是，你需要Ｃ數據分佈完全匹配某些硬件或協議，比如一個經過內存映射的物理端口，則不違反對齊規則就無法做下去。

