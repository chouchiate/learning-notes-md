*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CK(-55to125[deg])/4.00e-07[uF]/50[V]
* Murata P/N :GRM1554C1HR40BA01
* Property : C = 4.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1554C1HR40BA01 Port1 Port2
C01 Port1 N01 4.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 3.67e-10
R03 N02 N03 8.82e-01
C04 N03 N04 2.48e-12
L04 N03 N04 1.97e-11
R04 N03 N04 1.23e+01
C05 N04 Port2 8.97e-13
L05 N04 Port2 5.42e-11
R05 N04 Port2 1.00e+08
.ENDS GRM1554C1HR40BA01