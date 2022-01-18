*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/3.30e-04[uF]/50[V]
* Murata P/N :GRM1552C1H331JA01
* Property : C = 3.30e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C1H331JA01 Port1 Port2
C01 Port1 N01 3.30e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 1.56e-10
R03 N02 N03 6.98e-02
L04 N03 N04 5.69e-11
R04 N03 N04 1.05e+00
C05 N04 N05 3.07e-09
L05 N04 N05 8.22e-12
R05 N04 N05 1.95e-01
C06 N05 N06 5.91e-10
L06 N05 N06 1.82e-11
R06 N05 N06 6.02e-01
C07 N06 N07 2.17e-12
L07 N06 N07 9.96e-11
R07 N06 N07 1.00e+05
C08 N07 Port2 3.01e-12
L08 N07 Port2 5.03e-11
R08 N07 Port2 4.07e+01
.ENDS GRM1552C1H331JA01
