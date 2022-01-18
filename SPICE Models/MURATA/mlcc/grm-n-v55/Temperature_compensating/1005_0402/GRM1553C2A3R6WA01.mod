*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CJ(-55to125[deg])/3.60e-06[uF]/100[V]
* Murata P/N :GRM1553C2A3R6WA01
* Property : C = 3.60e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1553C2A3R6WA01 Port1 Port2
C01 Port1 N01 3.60e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.74e-10
R03 N02 N03 2.50e-01
C04 N03 N04 8.41e-12
L04 N03 N04 3.69e-11
R04 N03 N04 5.14e+00
C05 N04 Port2 1.26e-11
L05 N04 Port2 2.43e-11
R05 N04 Port2 1.00e+05
.ENDS GRM1553C2A3R6WA01
