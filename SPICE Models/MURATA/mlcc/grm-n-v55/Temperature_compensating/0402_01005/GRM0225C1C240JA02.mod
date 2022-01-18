*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/C0G(-55to125[deg])/2.40e-05[uF]/16[V]
* Murata P/N :GRM0225C1C240JA02
* Property : C = 2.40e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0225C1C240JA02 Port1 Port2
C01 Port1 N01 2.40e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.84e-10
R03 N02 N03 2.10e-01
L04 N03 N04 1.25e-11
R04 N03 N04 2.35e-01
C05 N04 Port2 5.07e-11
L05 N04 Port2 8.07e-12
R05 N04 Port2 7.38e-01
.ENDS GRM0225C1C240JA02
