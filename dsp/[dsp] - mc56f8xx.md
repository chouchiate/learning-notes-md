## [dsp] - nxp mc56f8373


### **MCUXpresso**

####  periperals.h study



### Comparator B/C settings
0. Enable CMP module, no window, no external sampling, hysterisis level 0
1. High speed mode
2. Enable DAC block
  - DAC_8bit_VIN1 * Vdd
  - 250
3. Comparator Positive Input: IN3 [2] V_bat_FB
4. Comparator Negative Input: IN7 CMPB_DAC8bit_Output
5. Filtering Configuration:
  - BUS_CLK - BOARD_BootClockRUN: 100Mhz
  - 100Mhz (ClocksTool_DefaultInit)
6. Interrupt Configuration
  - Interrupt Source: Rising Edge
  - Enable Interrupt Vector: kCMPB_VECTORn / priority 2
  - Interrupt Handler Name: CMPB_IRQHANDLER







