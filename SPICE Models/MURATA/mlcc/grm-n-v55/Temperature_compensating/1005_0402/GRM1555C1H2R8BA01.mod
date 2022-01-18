*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/2.80e-06[uF]/50[V]
* Murata P/N :GRM1555C1H2R8BA01
* Property : C = 2.80e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C1H2R8BA01 Port1 Port2
C01 Port1 N01 2.80e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 3.03e-10
R03 N02 N03 3.00e-01
C04 N03 N04 1.52e-11
L04 N03 N04 2.08e-11
R04 N03 N04 2.44e+00
C05 N04 Port2 1.54e-11
L05 N04 Port2 1.84e-11
R05 N04 Port2 1.00e+05
.ENDS GRM1555C1H2R8BA01
