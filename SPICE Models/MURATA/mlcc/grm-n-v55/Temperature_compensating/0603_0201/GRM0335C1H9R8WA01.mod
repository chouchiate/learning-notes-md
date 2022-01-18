*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/9.80e-06[uF]/50[V]
* Murata P/N :GRM0335C1H9R8WA01
* Property : C = 9.80e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C1H9R8WA01 Port1 Port2
C01 Port1 N01 9.80e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 6.00e-11
R03 N02 N03 1.75e-01
L04 N03 N04 1.13e-10
R04 N03 N04 2.15e+01
C05 N04 Port2 1.44e-12
L05 N04 Port2 9.04e-11
R05 N04 Port2 1.00e+05
.ENDS GRM0335C1H9R8WA01
