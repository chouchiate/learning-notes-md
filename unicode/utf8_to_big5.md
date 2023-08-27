## [utf-8 to big5]

因為中文編碼使用UTF-8，但是BCB使用的中文編碼是Big5；
所以要做UTF-8轉Big5

但是網路上常見的是Big5轉UTF-8(大部份用在網頁編碼)
所以反推嘗試出的一個方法，原本想直接從UTF-8轉Big5
但是試不出，只好從UTF-8轉Unicode再轉Big5
可能對函式的參數未詳細了解、或者還有更好的方法，都歡迎指教。

//------------UTF-8轉Big5---------
char UTF_8[3], wszBig_5[2];
WCHAR wszUni[1]; //Unicode編碼的字符

MultiByteToWideChar(CP_UTF8, 0, UTF_8, 3, wszUni, 2);//UTF-8轉Unicode
//假設輸入的UTF_8都是3個byte(即確定是中文)
WideCharToMultiByte(950, 0, wszUni, -1, wszBig_5, 2, NULL, NULL);//Unicode轉Big5
//950表Big5
//---------------------

int MultiByteToWideChar(uCodePage, dwFlags, lpMultiByteStr,
cchMultiByte, lpWideCharStr, cchWideChar)
將character string對應到wide character (Unicode UTF-16) string。

UINT uCodePage; /* codepage，查Code Page Identifiers*/
DWORD dwFlags; /* character-type options，UTF-8要設0*/
LPCSTR lpMultiByteStr; /* address of string to map(要轉換的)*/
int cchMultiByte; /* number of characters in string */
LPWSTR lpWideCharStr; /* address of wide-character buffer */
int cchWideChar; /* size of wide-character buffer */
//---------------------

在UTF-8之中，視開頭有幾個(binary)1，表示使用幾個Byte；
其後接續的Byte，其開頭為(binary)10。
例如中文需要3個Byte，格式為 1110 ????, 10?? ????, 10?? ????
data"?"，共有2個Byte，即為Unicode
自行轉換

char *s1;
int intU1, intU2, intU3;//UTF-8的三個Byte

if(intU1 >= 224 && intU1 <= 239 && intU2 >= 128 && intU2 <= 191 && intU3 >= 128 && intU3 <= 191)
{ // 224 = 1110 0000, 239 = 1110 1111, 128 = 1000 0000, 191 = 1011 1111
*(s1++) = (char)( ((intU1-224)<<4) + ((intU2-128)>>2) );//第一個char
*(s1++) = (char)( ((intU2&0x03)<<6) + (intU3-128) ); //第二個char
}