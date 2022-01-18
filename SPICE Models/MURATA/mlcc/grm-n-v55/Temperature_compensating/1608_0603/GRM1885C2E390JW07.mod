*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/C0G(-55to125[deg])/3.90e-05[uF]/250[V]
* Murata P/N :GRM1885C2E390JW07
* Property : C = 3.90e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 1000[kHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1885C2E390JW07 Port1 Port2
C01 Port1 N01 3.90e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 4.45e-10
R03 N02 N03 1.30e-01
C04 N03 N04 1.24e-08
R04 N03 N04 6.02e-01
L05 N04 N05 6.03e-11
R05 N04 N05 2.52e+00
C06 N05 Port2 4.41e-10
L06 N05 Port2 1.06e-11
R06 N05 Port2 1.69e+00
.ENDS GRM1885C2E390JW07
