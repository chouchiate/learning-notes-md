*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/1.20e-05[uF]/25[V]
* Murata P/N :GRM1555C1E120JA01
* Property : C = 1.20e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1E120JA01 Port1 Port2
C01 Port1 N01 1.20e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 9.00e-11
R03 N02 N03 1.20e-01
L04 N03 N04 2.40e-11
R04 N03 N04 2.47e-01
C05 N04 N05 8.69e-11
L05 N04 N05 1.21e-11
R05 N04 N05 2.88e+00
C06 N05 N06 1.16e-11
L06 N05 N06 2.91e-11
R06 N05 N06 5.24e+00
C07 N06 Port2 1.10e-12
L07 N06 Port2 1.75e-10
R07 N06 Port2 1.00e+05
.ENDS GRM1555C1E120JA01
