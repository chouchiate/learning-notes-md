*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CK(-55to125[deg])/2.00e-06[uF]/50[V]
* Murata P/N :GRM1554C1H2R0BA01
* Property : C = 2.00e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1554C1H2R0BA01 Port1 Port2
C01 Port1 N01 2.00e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 3.26e-10
R03 N02 N03 3.70e-01
C04 N03 N04 4.14e-11
L04 N03 N04 9.56e-12
R04 N03 N04 6.77e-01
C05 N04 Port2 2.06e-11
L05 N04 Port2 1.40e-11
R05 N04 Port2 1.00e+05
.ENDS GRM1554C1H2R0BA01
