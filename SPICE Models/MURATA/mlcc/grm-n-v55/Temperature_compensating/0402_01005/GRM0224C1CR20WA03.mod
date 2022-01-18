*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CK(-55to125[deg])/2.00e-07[uF]/16[V]
* Murata P/N :GRM0224C1CR20WA03
* Property : C = 2.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0224C1CR20WA03 Port1 Port2
C01 Port1 N01 2.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 2.51e-10
R03 N02 N03 8.19e-01
L04 N03 N04 2.25e-13
R04 N03 N04 3.53e-02
C05 N04 Port2 2.55e-12
L05 N04 Port2 1.13e-11
R05 N04 Port2 6.25e+01
.ENDS GRM0224C1CR20WA03