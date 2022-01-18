*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/5.20e-06[uF]/50[V]
* Murata P/N :GRM1555C1H5R2WA01
* Property : C = 5.20e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H5R2WA01 Port1 Port2
C01 Port1 N01 5.20e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.95e-10
R03 N02 N03 2.10e-01
L04 N03 N04 2.04e-11
R04 N03 N04 5.60e-01
C05 N04 Port2 1.55e-11
L05 N04 Port2 2.65e-11
R05 N04 Port2 9.58e+00
.ENDS GRM1555C1H5R2WA01
