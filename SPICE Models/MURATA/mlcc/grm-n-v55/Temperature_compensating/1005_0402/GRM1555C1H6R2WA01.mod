*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/6.20e-06[uF]/50[V]
* Murata P/N :GRM1555C1H6R2WA01
* Property : C = 6.20e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H6R2WA01 Port1 Port2
C01 Port1 N01 6.20e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.53e-10
R03 N02 N03 2.08e-01
L04 N03 N04 2.12e-11
R04 N03 N04 4.12e-01
C05 N04 N05 5.50e-11
L05 N04 N05 8.41e-12
R05 N04 N05 1.79e+00
C06 N05 Port2 4.66e-12
L06 N05 Port2 4.91e-11
R06 N05 Port2 1.00e+05
.ENDS GRM1555C1H6R2WA01
