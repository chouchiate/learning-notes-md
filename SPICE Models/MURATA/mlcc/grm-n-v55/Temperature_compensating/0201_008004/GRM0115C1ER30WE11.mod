*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/3.00e-07[uF]/25[V]
* Murata P/N :GRM0115C1ER30WE11
* Property : C = 3.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1ER30WE11 Port1 Port2
C01 Port1 N01 3.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 1.57e-10
R03 N02 N03 8.34e-01
L04 N03 N04 3.03e-12
R04 N03 N04 3.17e-01
C05 N04 Port2 9.56e-13
L05 N04 Port2 2.88e-11
R05 N04 Port2 2.16e+02
.ENDS GRM0115C1ER30WE11
