*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/CK(-55to125[deg])/6.00e-07[uF]/100[V]
* Murata P/N :GRM0334C2AR60WA01
* Property : C = 6.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0334C2AR60WA01 Port1 Port2
C01 Port1 N01 6.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 2.22e-10
R03 N02 N03 8.62e-01
C04 N03 N04 1.03e-11
L04 N03 N04 3.95e-12
R04 N03 N04 2.14e+00
C05 N04 Port2 4.31e-13
L05 N04 Port2 7.44e-11
R05 N04 Port2 1.00e+08
.ENDS GRM0334C2AR60WA01
