*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CJ(-55to125[deg])/3.70e-06[uF]/50[V]
* Murata P/N :GRM1883C1H3R7CA01
* Property : C = 3.70e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1883C1H3R7CA01 Port1 Port2
C01 Port1 N01 3.70e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 4.06e-10
R03 N02 N03 1.40e-01
L04 N03 N04 1.02e-10
R04 N03 N04 3.10e-01
C05 N04 N05 8.95e-12
L05 N04 N05 4.52e-11
R05 N04 N05 2.69e+01
C06 N05 Port2 6.79e-12
L06 N05 Port2 4.52e-11
R06 N05 Port2 4.67e+01
.ENDS GRM1883C1H3R7CA01
