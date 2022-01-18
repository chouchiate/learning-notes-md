*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CJ(-55to125[deg])/2.10e-06[uF]/100[V]
* Murata P/N :GRM1883C2A2R1CA01
* Property : C = 2.10e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1883C2A2R1CA01 Port1 Port2
C01 Port1 N01 2.10e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 4.25e-10
R03 N02 N03 1.56e-01
L04 N03 N04 1.68e-10
R04 N03 N04 3.08e-01
C05 N04 Port2 5.01e-12
L05 N04 Port2 6.41e-11
R05 N04 Port2 2.80e+01
.ENDS GRM1883C2A2R1CA01
