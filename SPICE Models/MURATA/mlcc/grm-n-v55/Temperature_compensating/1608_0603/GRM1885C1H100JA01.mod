*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/C0G(-55to125[deg])/1.00e-05[uF]/50[V]
* Murata P/N :GRM1885C1H100JA01
* Property : C = 1.00e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1885C1H100JA01 Port1 Port2
C01 Port1 N01 1.00e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.38e-10
R03 N02 N03 3.27e-01
L04 N03 N04 4.34e-11
R04 N03 N04 1.44e+00
C05 N04 N05 7.64e-12
L05 N04 N05 8.81e-11
R05 N04 N05 1.95e+01
C06 N05 N06 8.62e-12
L06 N05 N06 5.79e-11
R06 N05 N06 1.03e+01
C07 N06 Port2 7.05e-13
L07 N06 Port2 3.07e-10
R07 N06 Port2 1.00e+05
.ENDS GRM1885C1H100JA01
