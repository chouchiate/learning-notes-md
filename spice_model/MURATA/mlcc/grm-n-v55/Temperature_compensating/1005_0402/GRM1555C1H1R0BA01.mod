*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/1.00e-06[uF]/50[V]
* Murata P/N :GRM1555C1H1R0BA01
* Property : C = 1.00e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H1R0BA01 Port1 Port2
C01 Port1 N01 1.00e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.34e-10
R03 N02 N03 7.33e-01
C04 N03 N04 1.26e-12
L04 N03 N04 5.19e-11
R04 N03 N04 3.11e+01
C05 N04 Port2 1.20e-13
L05 N04 Port2 2.65e-10
R05 N04 Port2 1.00e+08
.ENDS GRM1555C1H1R0BA01