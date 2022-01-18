*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/1.20e-06[uF]/50[V]
* Murata P/N :GRM1555C1H1R2BA01
* Property : C = 1.20e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H1R2BA01 Port1 Port2
C01 Port1 N01 1.20e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.12e-10
R03 N02 N03 6.50e-01
C04 N03 N04 1.65e-11
L04 N03 N04 1.54e-11
R04 N03 N04 2.26e+00
C05 N04 Port2 1.10e-12
L05 N04 Port2 1.50e-10
R05 N04 Port2 1.00e+05
.ENDS GRM1555C1H1R2BA01
