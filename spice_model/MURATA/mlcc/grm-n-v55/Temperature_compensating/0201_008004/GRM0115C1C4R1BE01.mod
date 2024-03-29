*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/4.10e-06[uF]/16[V]
* Murata P/N :GRM0115C1C4R1BE01
* Property : C = 4.10e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1C4R1BE01 Port1 Port2
C01 Port1 N01 4.10e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 9.68e-11
R03 N02 N03 1.64e-01
L04 N03 N04 1.12e-11
R04 N03 N04 1.65e-01
C05 N04 Port2 1.28e-11
L05 N04 Port2 7.90e-12
R05 N04 Port2 9.47e-01
.ENDS GRM0115C1C4R1BE01
