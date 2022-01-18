*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/3.30e-05[uF]/50[V]
* Murata P/N :GRM1552C1H330GA01
* Property : C = 3.30e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C1H330GA01 Port1 Port2
C01 Port1 N01 3.30e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 7.31e-11
R03 N02 N03 1.20e-01
L04 N03 N04 1.74e-11
R04 N03 N04 1.60e-01
C05 N04 N05 4.83e-10
L05 N04 N05 5.12e-12
R05 N04 N05 4.47e-01
C06 N05 N06 3.86e-11
L06 N05 N06 2.08e-11
R06 N05 N06 2.36e+00
C07 N06 N07 1.39e-11
L07 N06 N07 2.37e-11
R07 N06 N07 4.89e+00
C08 N07 Port2 8.18e-13
L08 N07 Port2 2.25e-10
R08 N07 Port2 1.00e+05
.ENDS GRM1552C1H330GA01
