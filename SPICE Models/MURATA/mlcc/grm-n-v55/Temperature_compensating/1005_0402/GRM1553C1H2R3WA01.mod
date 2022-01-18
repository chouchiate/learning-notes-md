*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CJ(-55to125[deg])/2.30e-06[uF]/50[V]
* Murata P/N :GRM1553C1H2R3WA01
* Property : C = 2.30e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1553C1H2R3WA01 Port1 Port2
C01 Port1 N01 2.30e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 3.22e-10
R03 N02 N03 3.20e-01
C04 N03 N04 1.53e-11
L04 N03 N04 2.02e-11
R04 N03 N04 2.67e+00
C05 N04 Port2 1.23e-10
L05 N04 Port2 2.31e-12
R05 N04 Port2 1.01e+05
.ENDS GRM1553C1H2R3WA01
