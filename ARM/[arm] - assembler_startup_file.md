## [arm] - assembler startup file

### Overview
* startup code consists:
  -  Architecture and syntax
  -  Declaration of the Stack area
  -  Declaration of the Heap area
  -  Vector table
  -  Assembler code of Reset handler
  -  Definition of interrupt handler

### Architecture and syntax
two slightly different syntaxes are support for ARM and THUMB instructions, divided and unified.
```asm
    .syntax     unified
    .arch       armv7e-m
```
> The ".arch" instruction used to select the target architecture. What the architecture of Cortex-M4 is ARMv7E-M.

### Declaration of the Stack area

```asm
    .section    .stack
    .align      3
#ifdef __STACK_SIZE
    .equ        Stack_Size, __STACK_SIZE
#else
    .equ        Stack_Size, 0x00000400
#endif
    .globl      __StackTop
    .globl      __StackLimit
__StackLimit:
    .space      Stack_Size
    .size       __StackLimit, . - __StackLimit
__StackTop:
    .size       __StackTop, . - __StackTop
```

### external 
* [gnu assembler](https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_toc.html)
* [arm_asm](https://www.keil.com/support/man/docs/armasm/)