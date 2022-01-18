*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/C0G(-55to125[deg])/1.80e-06[uF]/100[V]
* Murata P/N :GRM1885C2A1R8CA01
* Property : C = 1.80e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1885C2A1R8CA01 Port1 Port2
C01 Port1 N01 1.80e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 4.88e-10
R03 N02 N03 1.76e-01
L04 N03 N04 1.94e-10
R04 N03 N04 3.82e-01
C05 N04 Port2 1.43e-11
L05 N04 Port2 2.14e-11
R05 N04 Port2 8.43e+00
.ENDS GRM1885C2A1R8CA01
