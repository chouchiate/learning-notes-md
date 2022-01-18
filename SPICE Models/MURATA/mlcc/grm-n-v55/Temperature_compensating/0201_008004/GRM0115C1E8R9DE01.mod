*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/8.90e-06[uF]/25[V]
* Murata P/N :GRM0115C1E8R9DE01
* Property : C = 8.90e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1E8R9DE01 Port1 Port2
C01 Port1 N01 8.90e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.09e-10
R03 N02 N03 1.23e-01
L04 N03 N04 1.17e-11
R04 N03 N04 2.06e-01
C05 N04 Port2 8.10e-11
L05 N04 Port2 3.55e-12
R05 N04 Port2 2.95e-01
.ENDS GRM0115C1E8R9DE01
