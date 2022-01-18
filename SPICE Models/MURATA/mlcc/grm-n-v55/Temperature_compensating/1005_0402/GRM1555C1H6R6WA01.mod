*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/6.60e-06[uF]/50[V]
* Murata P/N :GRM1555C1H6R6WA01
* Property : C = 6.60e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H6R6WA01 Port1 Port2
C01 Port1 N01 6.60e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.50e-10
R03 N02 N03 2.05e-01
L04 N03 N04 2.15e-11
R04 N03 N04 3.89e-01
C05 N04 N05 7.88e-11
L05 N04 N05 6.68e-12
R05 N04 N05 1.62e+00
C06 N05 N06 1.41e-10
L06 N05 N06 2.58e-12
R06 N05 N06 9.09e-01
C07 N06 Port2 5.68e-12
L07 N06 Port2 4.74e-11
R07 N06 Port2 1.00e+05
.ENDS GRM1555C1H6R6WA01
