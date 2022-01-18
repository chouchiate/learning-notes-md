*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/1.80e-05[uF]/50[V]
* Murata P/N :GRM1552C1H180JA01
* Property : C = 1.80e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C1H180JA01 Port1 Port2
C01 Port1 N01 1.80e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.19e-10
R03 N02 N03 1.20e-01
L04 N03 N04 2.40e-11
R04 N03 N04 2.05e-01
C05 N04 N05 1.21e-10
L05 N04 N05 1.12e-11
R05 N04 N05 1.92e+00
C06 N05 N06 7.86e-12
L06 N05 N06 4.32e-11
R06 N05 N06 5.99e+00
C07 N06 Port2 1.02e-12
L07 N06 Port2 1.84e-10
R07 N06 Port2 1.17e+09
.ENDS GRM1552C1H180JA01
