## [C51] - STARTUP.A51 筆記

* IDATALEN
    - IDATA memory size <0x0-0x100>
    - The absolute start-address of IDATA memory is always 0
    ```asm
        IDATALEN        EQU     80H
    ```

* XDATASTART
    - XDATA memory start address <0x0-0xFFFF>
