*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/1.90e-06[uF]/100[V]
* Murata P/N :GRM0335C2A1R9BA01
* Property : C = 1.90e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C2A1R9BA01 Port1 Port2
C01 Port1 N01 1.90e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.70e-10
R03 N02 N03 2.80e-01
L04 N03 N04 1.41e-11
R04 N03 N04 5.23e-01
C05 N04 N05 5.34e-11
L05 N04 N05 6.02e-12
R05 N04 N05 1.13e+00
C06 N05 Port2 8.32e-12
L06 N05 Port2 3.05e-11
R06 N05 Port2 1.00e+05
.ENDS GRM0335C2A1R9BA01
