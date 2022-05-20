*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/3.00e-07[uF]/50[V]
* Murata P/N :GRM0335C1HR30BA01
* Property : C = 3.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C1HR30BA01 Port1 Port2
C01 Port1 N01 3.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 2.84e-10
R03 N02 N03 9.65e-01
C04 N03 N04 2.29e-12
L04 N03 N04 2.03e-11
R04 N03 N04 1.00e+08
C05 N04 Port2 1.36e-11
L05 N04 Port2 3.13e-12
R05 N04 Port2 4.17e+00
.ENDS GRM0335C1HR30BA01