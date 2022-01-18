*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/C0G(-55to125[deg])/7.00e-06[uF]/50[V]
* Murata P/N :GRM1885C1H7R0WA01
* Property : C = 7.00e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1885C1H7R0WA01 Port1 Port2
C01 Port1 N01 7.00e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 3.75e-10
R03 N02 N03 1.07e-01
L04 N03 N04 9.00e-11
R04 N03 N04 2.08e-01
C05 N04 Port2 3.10e-12
L05 N04 Port2 1.10e-10
R05 N04 Port2 5.56e+01
.ENDS GRM1885C1H7R0WA01
