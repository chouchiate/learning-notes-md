*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CJ(-55to125[deg])/2.90e-06[uF]/100[V]
* Murata P/N :GRM1553C2A2R9BA01
* Property : C = 2.90e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1553C2A2R9BA01 Port1 Port2
C01 Port1 N01 2.90e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.32e-10
R03 N02 N03 2.80e-01
C04 N03 N04 1.05e-11
L04 N03 N04 2.61e-11
R04 N03 N04 3.04e+00
C05 N04 Port2 3.66e-12
L05 N04 Port2 6.90e-11
R05 N04 Port2 1.00e+05
.ENDS GRM1553C2A2R9BA01
