*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/6.30e-06[uF]/100[V]
* Murata P/N :GRM0335C2A6R3BA01
* Property : C = 6.30e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C2A6R3BA01 Port1 Port2
C01 Port1 N01 6.30e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.11e-10
R03 N02 N03 2.00e-01
L04 N03 N04 1.54e-11
R04 N03 N04 3.22e-01
C05 N04 N05 3.76e-11
L05 N04 N05 9.03e-12
R05 N04 N05 1.10e+00
C06 N05 Port2 3.91e-12
L06 N05 Port2 3.65e-11
R06 N05 Port2 1.00e+05
.ENDS GRM0335C2A6R3BA01
