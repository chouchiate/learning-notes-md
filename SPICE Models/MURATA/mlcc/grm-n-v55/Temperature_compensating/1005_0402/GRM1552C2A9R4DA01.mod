*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/9.40e-06[uF]/100[V]
* Murata P/N :GRM1552C2A9R4DA01
* Property : C = 9.40e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C2A9R4DA01 Port1 Port2
C01 Port1 N01 9.40e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.48e-10
R03 N02 N03 1.70e-01
L04 N03 N04 2.50e-11
R04 N03 N04 4.70e-01
C05 N04 N05 2.24e-10
L05 N04 N05 3.25e-12
R05 N04 N05 7.19e-01
C06 N05 N06 3.45e-11
L06 N05 N06 9.95e-12
R06 N05 N06 1.60e+00
C07 N06 Port2 6.21e-12
L07 N06 Port2 4.05e-11
R07 N06 Port2 1.00e+05
.ENDS GRM1552C2A9R4DA01
