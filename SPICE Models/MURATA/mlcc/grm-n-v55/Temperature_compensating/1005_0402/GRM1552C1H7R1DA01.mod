*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/7.10e-06[uF]/50[V]
* Murata P/N :GRM1552C1H7R1DA01
* Property : C = 7.10e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C1H7R1DA01 Port1 Port2
C01 Port1 N01 7.10e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.22e-10
R03 N02 N03 2.00e-01
L04 N03 N04 1.16e-11
R04 N03 N04 2.25e-01
C05 N04 N05 1.73e-11
L05 N04 N05 3.28e-11
R05 N04 N05 1.06e+01
C06 N05 N06 2.13e-11
L06 N05 N06 1.60e-11
R06 N05 N06 3.08e+00
C07 N06 Port2 1.82e-12
L07 N06 Port2 1.20e-10
R07 N06 Port2 1.00e+05
.ENDS GRM1552C1H7R1DA01
