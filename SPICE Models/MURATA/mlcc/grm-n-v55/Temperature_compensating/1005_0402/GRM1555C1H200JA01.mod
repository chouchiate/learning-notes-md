*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/2.00e-05[uF]/50[V]
* Murata P/N :GRM1555C1H200JA01
* Property : C = 2.00e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H200JA01 Port1 Port2
C01 Port1 N01 2.00e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 4.11e-11
R03 N02 N03 1.25e-01
L04 N03 N04 2.17e-11
R04 N03 N04 2.06e-01
C05 N04 N05 1.76e-10
L05 N04 N05 8.13e-12
R05 N04 N05 1.16e+00
C06 N05 N06 7.15e-12
L06 N05 N06 4.89e-11
R06 N05 N06 8.37e+00
C07 N06 Port2 6.83e-13
L07 N06 Port2 2.51e-10
R07 N06 Port2 1.00e+05
.ENDS GRM1555C1H200JA01
