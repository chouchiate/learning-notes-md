*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/C0G(-55to125[deg])/3.50e-06[uF]/16[V]
* Murata P/N :GRM0225C1C3R5BA03
* Property : C = 3.50e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0225C1C3R5BA03 Port1 Port2
C01 Port1 N01 3.50e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.61e-10
R03 N02 N03 1.86e-01
L04 N03 N04 8.10e-12
R04 N03 N04 3.45e-01
L05 N04 Port2 1.45e-11
R05 N04 Port2 1.29e-01
.ENDS GRM0225C1C3R5BA03
