*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/3.50e-06[uF]/25[V]
* Murata P/N :GRM0115C1E3R5WE01
* Property : C = 3.50e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1E3R5WE01 Port1 Port2
C01 Port1 N01 3.50e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.04e-10
R03 N02 N03 1.70e-01
L04 N03 N04 1.57e-11
R04 N03 N04 2.38e-01
C05 N04 Port2 6.33e-11
L05 N04 Port2 2.91e-12
R05 N04 Port2 2.33e-01
.ENDS GRM0115C1E3R5WE01
