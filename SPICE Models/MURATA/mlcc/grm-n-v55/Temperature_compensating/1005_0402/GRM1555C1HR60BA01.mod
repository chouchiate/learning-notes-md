*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/6.00e-07[uF]/50[V]
* Murata P/N :GRM1555C1HR60BA01
* Property : C = 6.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1HR60BA01 Port1 Port2
C01 Port1 N01 6.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 3.42e-10
R03 N02 N03 8.41e-01
C04 N03 N04 1.50e-12
L04 N03 N04 3.42e-11
R04 N03 N04 1.69e+01
C05 N04 Port2 6.12e-13
L05 N04 Port2 7.90e-11
R05 N04 Port2 1.00e+08
.ENDS GRM1555C1HR60BA01
