*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/6.10e-06[uF]/50[V]
* Murata P/N :GRM1555C1H6R1BA01
* Property : C = 6.10e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H6R1BA01 Port1 Port2
C01 Port1 N01 6.10e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.19e-10
R03 N02 N03 2.10e-01
L04 N03 N04 1.57e-11
R04 N03 N04 3.40e-01
C05 N04 N05 2.18e-11
L05 N04 N05 1.96e-11
R05 N04 N05 3.24e+00
C06 N05 Port2 3.96e-12
L06 N05 Port2 6.86e-11
R06 N05 Port2 1.00e+05
.ENDS GRM1555C1H6R1BA01
