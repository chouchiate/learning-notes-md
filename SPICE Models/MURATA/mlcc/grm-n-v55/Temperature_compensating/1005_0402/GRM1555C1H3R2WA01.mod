*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/3.20e-06[uF]/50[V]
* Murata P/N :GRM1555C1H3R2WA01
* Property : C = 3.20e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H3R2WA01 Port1 Port2
C01 Port1 N01 3.20e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.43e-10
R03 N02 N03 2.60e-01
L04 N03 N04 1.57e-11
R04 N03 N04 3.97e-01
C05 N04 N05 1.94e-11
L05 N04 N05 1.57e-11
R05 N04 N05 3.17e+00
C06 N05 Port2 3.32e-12
L06 N05 Port2 6.96e-11
R06 N05 Port2 1.00e+05
.ENDS GRM1555C1H3R2WA01
