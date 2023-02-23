# [stm] - g8 setup

### TIM1
1. parameter
  - counter period: 40000
2. Output Compare Channel 1
  - Pulse (16 bits value) 5650/2

3. GPIO Settings
  - PC0: TIM1_CH1 signal to pin

### DMA
1. ADC1
  - DMA1 Channel 1
  - peripheral to memeory
  - priority high

2. ADC3
  - DMA1 Channel 2
  - peripheral to memeory
  - priority high

### ADC1
  - IN2 Single-Ended
  - IN12 Single-Ended
  - Parameter Settings
    * Mode: Independent mode
    * Clock Prescale: Asynchronous clock mode divided by 2
    * Scan Conversion Mode: Enabled
    * End of Conversion Selection: End of sequence of conversion
    * DMA continuous Requests: Enabled
    * Overrun behaviour: overrun data preserved
    * Enable Regular Conversions
    * Number of conversions 2
    * external trigger conversion source: High resolution timer trigger 1 event
    * external trigger conversion edge: trigger detection on the rising edge
    * rank1
      - channel 2
      - sampling time: 2.5 cycle
    * rank2
      - channel 12
      - sampling time: 6.5 cycle
    * DMA setting
      - ADC1 / DMA1 channel 1
      - mode circular - memory

### ADC3
  -

### GPIO
1. HRTIM
  - PA10: HRTIM1_CHB1
  - PA11: HRTIM1_CHB2
  - PB14: HRTIM1_CHD1
  - PB15: HRTIM1_CHD2
    * alternate function push pull
    * No pull-up and no pull-down
    * outpu speed: very high

### SYS
1. Debug: Serial Wire