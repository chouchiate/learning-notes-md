*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/CK(-55to125[deg])/8.00e-07[uF]/50[V]
* Murata P/N :GRM0334C1HR80WA01
* Property : C = 8.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0334C1HR80WA01 Port1 Port2
C01 Port1 N01 8.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 2.20e-10
R03 N02 N03 8.05e-01
C04 N03 N04 2.15e-11
L04 N03 N04 2.61e-12
R04 N03 N04 9.57e-01
C05 N04 Port2 4.60e-13
L05 N04 Port2 7.69e-11
R05 N04 Port2 1.00e+08
.ENDS GRM0334C1HR80WA01
