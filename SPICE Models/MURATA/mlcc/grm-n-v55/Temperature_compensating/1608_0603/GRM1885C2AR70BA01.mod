*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/C0G(-55to125[deg])/7.00e-07[uF]/100[V]
* Murata P/N :GRM1885C2AR70BA01
* Property : C = 7.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1885C2AR70BA01 Port1 Port2
C01 Port1 N01 7.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 5.78e-10
R03 N02 N03 4.20e-01
L04 N03 N04 1.62e-10
R04 N03 N04 4.10e-01
C05 N04 Port2 2.40e-11
L05 N04 Port2 1.04e-11
R05 N04 Port2 1.84e+00
.ENDS GRM1885C2AR70BA01
