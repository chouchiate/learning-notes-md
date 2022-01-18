*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/1.00e-06[uF]/25[V]
* Murata P/N :GRM0335C1E1R0WA01
* Property : C = 1.00e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C1E1R0WA01 Port1 Port2
C01 Port1 N01 1.00e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.64e-10
R03 N02 N03 7.56e-01
C04 N03 N04 4.63e-12
L04 N03 N04 1.01e-11
R04 N03 N04 5.09e+00
C05 N04 Port2 9.70e-13
L05 N04 Port2 4.20e-11
R05 N04 Port2 1.00e+08
.ENDS GRM0335C1E1R0WA01
