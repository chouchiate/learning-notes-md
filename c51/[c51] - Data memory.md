## [c51] - data memory


### Internal Data Memory

* data
  - first 128 bytes of internal data memory.
  - variables stored here are accessed using "direct addressing"
* idata
  - all 256 bytes of internal data memory.
  - indirect addressing 
* bdata
  - 16 bytes of bit-addressable memory in internal data area (20h to 2Fh)
  - declare data types that may be accessed at the bit level
    * 0-7 for char and unsigned char, 
    * 0-15 for int, unsigned int, short, and unsigned short, and
    * 0-31 for long and unsigned long.
  - objects accessed using sbit declarations are stored in little endian byte

```c
  bdata int ibase;        /* Bit-addressable int */
  char bdata bary[4];    /* Bit-addressable array */

  sbit mybit0 = ibase ^ 0;

  void main (void)
  {
  mybit0 = 1;
  sbit mybit0 = ibase ^ 0;      /* bit 0 of ibase */
  sbit mybit15 = ibase ^ 15;    /* bit 15 of ibase */

  sbit Ary07 = bary[0] ^ 7;     /* bit 7 of bary[0] */
  sbit Ary37 = bary[3] ^ 7;     /* bit 7 of bary[3] */  
  }
```
### extern
```c
  extern bit mybit0;      /* bit 0 of ibase */
  extern bit mybit15;     /* bit 15 of ibase */

  extern bit Ary07;       /* bit 7 of bary[0] */
  extern bit Ary37;       /* bit 7 of bary[3] */
```
### update
```c
  Ary37 = 0;        /* clear bit 7 in bary[3] */
  bary[3] = 'a';    /* Byte addressing */
  ibase = -1;       /* Word addressing */
  mybit15 = 1;      /* set bit 15 in ibase */
```
### struct and union
```c
  union lft
    {
    float mf;
    long ml;
    };

  bdata struct bad
    {
    char m1;
    union lft u;
    } tcp;

  sbit tcpf31 = tcp.u.ml ^ 31;        /* bit 31 of float */
  sbit tcpm10 = tcp.m1 ^ 0;
  sbit tcpm17 = tcp.m1 ^ 7;
```


  ### External Data Memory
  * xdata
  * pdata


  ### Far Memory


  ### SFR Memory



  ### Memory Types

  * bdata
  * code
  * data
  * far
  * idata
  * pdata
  * xdata
  

  ### Data Types
