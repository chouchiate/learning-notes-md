*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/1.20e-06[uF]/16[V]
* Murata P/N :GRM0115C1C1R2BE11
* Property : C = 1.20e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1C1R2BE11 Port1 Port2
C01 Port1 N01 1.20e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.71e-10
R03 N02 N03 3.43e-01
L04 N03 N04 1.69e-11
R04 N03 N04 5.21e-01
C05 N04 Port2 5.38e-11
L05 N04 Port2 9.12e-13
R05 N04 Port2 3.63e-01
.ENDS GRM0115C1C1R2BE11
