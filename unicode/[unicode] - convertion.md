## [unicode] - Chinese conversion


### Unicode
* Unicode 是國際標準字符集，它將世界各種語言的每個字符定義一個唯一的編碼，以滿足跨語言、跨平臺的文本信息轉換




### Chinese Unicode to UTF-8

> UTF-8 的編碼規則很簡單，只有二條：

1）對於單字節的符號，字節的第一位設為0，後面7位為這個符號的 Unicode 碼。因此對於英語字母，UTF-8 編碼和 ASCII 碼是相同的。

2）對於n字節的符號（n > 1），第一個字節的前n位都設為1，第n + 1位設為0，後面字節的前兩位一律設為10。剩下的沒有提及的二進制位，全部為這個符號的 Unicode 碼。

* 下表總結了編碼規則，字母x表示可用編碼的位。

| Unicode符號範圍     |        UTF-8編碼方式 |
| (十六進制)        |              （二進制）|
| ---------------------- | --------------------------------------------- |
| 0000 0000-0000 007F | 0xxxxxxx |
| 0000 0080-0000 07FF | 110xxxxx 10xxxxxx |
| 0000 0800-0000 FFFF | 1110xxxx 10xxxxxx 10xxxxxx |
| 0001 0000-0010 FFFF | 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx |

### example

* 嚴的 Unicode 是4E25（100111000100101）

* 4E25處在第三行的範圍內（0000 0800 - 0000 FFFF）

* 嚴的 UTF-8 編碼需要三個字節，即格式是1110xxxx 10xxxxxx 10xxxxxx。

* 從嚴的最後一個二進制位開始，依次從後向前填入格式中的x，多出的位補0。這樣就得到了，嚴的 UTF-8 編碼是1110***0100*** 10***111000*** 10***100101***，轉換成十六進制就是E4B8A5。

### hands-on

新建一個文本文件，內容就是一個嚴字，依次采用ANSI，Unicode，Unicode big endian和UTF-8編碼方式保存。

然後，用文本編輯軟件UltraEdit 中的"十六進制功能"，觀察該文件的內部編碼方式。

1）ANSI：文件的編碼就是兩個字節D1 CF，這正是嚴的 GB2312 編碼，這也暗示 GB2312 是采用大頭方式存儲的。

2）Unicode：編碼是四個字節FF FE 25 4E，其中FF FE表明是小頭方式存儲，真正的編碼是4E25。

3）Unicode big endian：編碼是四個字節FE FF 4E 25，其中FE FF表明是大頭方式存儲。

4）UTF-8：編碼是六個字節EF BB BF E4 B8 A5，前三個字節EF BB BF表示這是UTF-8編碼，後三個E4B8A5就是嚴的具體編碼，它的存儲順序與編碼順序是一致的。

### external
* [unicode](https://pages.ucsd.edu/~dkjordan/resources/unicodemaker.html)
* [different chinese](https://pages.ucsd.edu/~dkjordan/resources/CantonHatter.html)
* [all standards](https://dencode.com/en/string/hex)
* [unicode-to-other](https://r12a.github.io/app-conversion/)
* [unicode-to-utf8](https://www.796t.com/content/1548441494.html)

