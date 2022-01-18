*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/C0G(-55to125[deg])/4.50e-06[uF]/100[V]
* Murata P/N :GRM1885C2A4R5BA01
* Property : C = 4.50e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1885C2A4R5BA01 Port1 Port2
C01 Port1 N01 4.50e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 3.95e-10
R03 N02 N03 1.35e-01
L04 N03 N04 1.46e-10
R04 N03 N04 2.81e-01
C05 N04 N05 1.58e-11
L05 N04 N05 3.22e-11
R05 N04 N05 1.78e+01
C06 N05 Port2 5.50e-12
L06 N05 Port2 5.55e-11
R06 N05 Port2 4.92e+01
.ENDS GRM1885C2A4R5BA01
