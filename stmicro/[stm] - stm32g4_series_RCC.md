# [stm] - stm32g4_series Reset and Clock (RCC)

## Power Reset
## System Reset
## Software Reset
## Low-Power mode Security Reset
## RTC Domain Reset


## Clocks
* SYSCLK
  - HSI16 (16Mhz RC high speed internal)
    - used as sysclk after startup from reset
  - HSE oscillator clock, (4 ~ 48Mhz)
  - PLL clock
    - 由於外部時鐘來源的頻率不夠大，開發版需要透過PLL鎖向環，將輸入時鐘倍頻成適合的系統頻率。因此PLL的處理過程圍繞在將時鐘源切分成約1MHz後再進行放大，我們先來看看PLL系統時間的運算公式:

    ```
    [(HSE/HSI)/分頻因子M] * 倍頻因子N / PLLCLK分頻因子P
    ```
* LSI RC 32kHz
  - watchdog / RTC
* LSE crystal - 32.768kHz RTCCLK
* HSI48 - RC 48Mhz for USB FS and RNG

### AHB protocol (advanced high performance system backbone bus)
* APB1 / APB2 匯流排
  - max freq. 170Mhz



