*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/2.70e-05[uF]/25[V]
* Murata P/N :GRM0115C1E270GE01
* Property : C = 2.70e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1E270GE01 Port1 Port2
C01 Port1 N01 2.70e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 8.90e-11
R03 N02 N03 1.01e-01
C04 N03 Port2 1.43e-12
L04 N03 Port2 2.99e-11
R04 N03 Port2 2.06e+00
.ENDS GRM0115C1E270GE01
