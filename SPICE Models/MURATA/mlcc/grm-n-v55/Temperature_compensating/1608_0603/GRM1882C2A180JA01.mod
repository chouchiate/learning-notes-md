*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CH(-55to125[deg])/1.80e-05[uF]/100[V]
* Murata P/N :GRM1882C2A180JA01
* Property : C = 1.80e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1882C2A180JA01 Port1 Port2
C01 Port1 N01 1.80e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 7.00e-12
R03 N02 N03 2.50e-01
L04 N03 N04 2.90e-11
R04 N03 N04 1.37e-01
C05 N04 N05 5.00e-13
L05 N04 N05 4.32e-10
C06 N05 N06 1.20e-11
L06 N05 N06 3.30e-11
R06 N05 N06 3.97e+00
C07 N06 N07 3.47e-11
L07 N06 N07 2.33e-11
R07 N06 N07 3.06e+00
C08 N07 Port2 8.29e-11
L08 N07 Port2 2.17e-11
R08 N07 Port2 2.00e+00
.ENDS GRM1882C2A180JA01
