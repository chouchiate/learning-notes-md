*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/1.60e-05[uF]/25[V]
* Murata P/N :GRM0115C1E160GE01
* Property : C = 1.60e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1E160GE01 Port1 Port2
C01 Port1 N01 1.60e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 7.03e-11
R03 N02 N03 1.09e-01
C04 N03 Port2 1.35e-12
L04 N03 Port2 3.39e-11
R04 N03 Port2 3.87e+00
.ENDS GRM0115C1E160GE01
