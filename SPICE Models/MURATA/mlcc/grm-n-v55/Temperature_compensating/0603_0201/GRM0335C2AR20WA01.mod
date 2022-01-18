*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/2.00e-07[uF]/100[V]
* Murata P/N :GRM0335C2AR20WA01
* Property : C = 2.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C2AR20WA01 Port1 Port2
C01 Port1 N01 2.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 3.30e-10
R03 N02 N03 9.66e-01
C04 N03 Port2 4.52e-11
L04 N03 Port2 1.06e-12
R04 N03 Port2 3.15e+00
.ENDS GRM0335C2AR20WA01
