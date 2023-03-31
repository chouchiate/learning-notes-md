## [gcc] - how to read map file

####

| | | 
|---|---|
|.const  | constants |
|.text   | code |
|.data   | initilized data (RAM) with 16 bit address |
|.bss    | non-initilized data (RAM) with 16 bit address |
|.bsct   | initilized data (RAM) with 8 bit address (page0) |
|.ubsct  | non-initilized data (RAM) with 8 bit address (page0) |


#### Memory Configuration

```c
    Memory Configuration
    
    Name             Origin             Length             Attributes
    FLASH            0x0000000000001000 0x00000000000ff000 xr
    RAM              0x0000000020000008 0x000000000003fff8 xrw
    *default*        0x0000000000000000 0xffffffffffffffff

```

#### Linker script and memory map
* gives detailed information about the symbols in your program
* gives the address of each function and its size

```map
    .text           0x0000000000001000      0x8c8
     ***(.isr_vector)**
     .isr_vector    0x0000000000001000      0x200 _build/nrf52840_xxaa/**gcc_startup_nrf52840.S.o**
                    0x0000000000001000                __isr_vector
     *(.text*)
     .text          0x0000000000001200       0x40 /usr/local/Cellar/arm-none-eabi-gcc/8-2018-q4-major/gcc/bin/../lib/gcc/arm-none-eabi/8.2.1/thumb/v7e-m+fp/hard/crtbegin.o
     .text          0x0000000000001240       0x74 /usr/local/Cellar/arm-none-eabi-gcc/8-2018-q4-major/gcc/bin/../lib/gcc/arm-none-eabi/8.2.1/../../../../arm-none-eabi/lib/thumb/v7e-m+fp/hard/crt0.o
                    0x0000000000001240                _mainCRTStartup
                    0x0000000000001240                _start
     .text          0x00000000000012b4       0x3c _build/nrf52840_xxaa/gcc_startup_nrf52840.S.o
                    0x00000000000012b4                Reset_Handler
                    0x00000000000012dc                NMI_Handler
    
    [...]
    
     .text.**bsp_board_led_invert**
                    0x00000000000012f0       **0x34** _build/nrf52840_xxaa/**boards.c.o**
                    0x00000000000012f0                bsp_board_led_invert
```