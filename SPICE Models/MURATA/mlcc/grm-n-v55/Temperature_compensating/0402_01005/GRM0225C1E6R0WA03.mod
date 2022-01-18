*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/C0G(-55to125[deg])/6.00e-06[uF]/25[V]
* Murata P/N :GRM0225C1E6R0WA03
* Property : C = 6.00e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0225C1E6R0WA03 Port1 Port2
C01 Port1 N01 6.00e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.60e-10
R03 N02 N03 1.45e-01
L04 N03 N04 1.06e-11
R04 N03 N04 5.07e-01
L05 N04 Port2 1.14e-11
R05 N04 Port2 9.67e-02
.ENDS GRM0225C1E6R0WA03
