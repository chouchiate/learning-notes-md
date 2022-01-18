*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/1.00e-04[uF]/50[V]
* Murata P/N :GRM1555C1H101JA01
* Property : C = 1.00e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H101JA01 Port1 Port2
C01 Port1 N01 1.00e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 2.12e-10
R03 N02 N03 1.10e-01
L04 N03 N04 7.82e-12
R04 N03 N04 3.42e-02
C05 N04 N05 8.96e-10
L05 N04 N05 7.70e-12
R05 N04 N05 3.52e-01
C06 N05 N06 1.74e-10
L06 N05 N06 1.63e-11
R06 N05 N06 1.02e+00
C07 N06 N07 7.08e-12
L07 N06 N07 3.54e-11
R07 N06 N07 1.70e+00
C08 N07 Port2 2.12e-12
L08 N07 Port2 9.97e-11
R08 N07 Port2 1.00e+05
.ENDS GRM1555C1H101JA01
