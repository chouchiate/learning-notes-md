## [arm] - armcc notes

### version
- v5.06

### Optimized loop termination
• Use simple termination conditions.
• Write count-down-to-zero loops.
• Use counters of type unsigned int.
• Test for equality against zero.

#### incremental
```c
int fact1(int n)
{
 int i, fact = 1;
 for (i = 1; i <= n; i++)
 fact *= i;
 return (fact);
}
```
```asm
fact1 PROC
 MOV r2, r0
 MOV r0, #1
 CMP r2, #1
 MOV r1, r0
 BXLT lr
|L1.20|
 MUL r0, r1, r0
 ADD r1, r1, #1
 CMP r1, r2
 BLE |L1.20|
 BX lr
 ENDP
```

#### decremental
```c
int fact2(int n)
{
 unsigned int i, fact = 1;
 for (i = n; i != 0; i--)
 fact *= i;
 return (fact);
}
```
```asm
fact2 PROC
 MOVS r1, r0
 MOV r0, #1
 BXEQ lr
|L1.12|
 MUL r0, r1, r0
 SUBS r1, r1, #1
 BNE |L1.12|
 BX lr
 ENDP
```


