*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CK(-55to125[deg])/1.40e-06[uF]/50[V]
* Murata P/N :GRM1884C1H1R4CA01
* Property : C = 1.40e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1884C1H1R4CA01 Port1 Port2
C01 Port1 N01 1.40e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 4.95e-10
R03 N02 N03 1.86e-01
L04 N03 N04 1.70e-10
R04 N03 N04 4.03e-01
C05 N04 Port2 1.25e-11
L05 N04 Port2 2.53e-11
R05 N04 Port2 1.12e+01
.ENDS GRM1884C1H1R4CA01