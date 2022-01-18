*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/1.80e-06[uF]/25[V]
* Murata P/N :GRM0115C1E1R8BE11
* Property : C = 1.80e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1E1R8BE11 Port1 Port2
C01 Port1 N01 1.80e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.74e-10
R03 N02 N03 2.74e-01
L04 N03 N04 2.42e-11
R04 N03 N04 5.79e-01
C05 N04 Port2 1.15e-10
L05 N04 Port2 5.15e-13
R05 N04 Port2 2.79e-01
.ENDS GRM0115C1E1R8BE11
