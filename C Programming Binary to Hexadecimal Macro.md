## C Programming Binary to Hexadecimal Macro

```
#define bin(a) ((( (a/10000000*128) + \
(((a/1000000)&1)*64) + \
(((a/100000)&1)*32) + \
(((a/10000)&1)*16) + \
(((a/1000)&1)*8) + \
(((a/100)&1)*4) + \
(((a/10)&1)*2) + \
(a&1)) * (a/10000000)) + \
(( ((a/262144)*64) + \
(((a/32768)&1)*32) + \
(((a/4096)&1)*16) + \
(((a/512)&1)*8) + \
(((a/64)&1)*4) + \
(((a/8)&1)*2) + \
(a&1)) * (1-(a/10000000))))

Well, it's hard to imagine what does it do (=
But just put these lines above your code and use something like:

unsigned char b1, b2;

b1 = bin(10101010); // 0xAA
b2 = bin(01010101); // 0x55
```

