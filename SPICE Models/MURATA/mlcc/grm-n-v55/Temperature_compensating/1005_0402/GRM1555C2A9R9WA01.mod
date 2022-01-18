*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/9.90e-06[uF]/100[V]
* Murata P/N :GRM1555C2A9R9WA01
* Property : C = 9.90e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C2A9R9WA01 Port1 Port2
C01 Port1 N01 9.90e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.15e-10
R03 N02 N03 1.50e-01
L04 N03 N04 1.81e-11
R04 N03 N04 2.91e-01
C05 N04 N05 4.89e-10
L05 N04 N05 1.79e-12
R05 N04 N05 4.74e-01
C06 N05 N06 7.23e-12
L06 N05 N06 4.69e-11
R06 N05 N06 1.16e+01
C07 N06 Port2 1.52e-12
L07 N06 Port2 1.38e-10
R07 N06 Port2 1.00e+05
.ENDS GRM1555C2A9R9WA01
