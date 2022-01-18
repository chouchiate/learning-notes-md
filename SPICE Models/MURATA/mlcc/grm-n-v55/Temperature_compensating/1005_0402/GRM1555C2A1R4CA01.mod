*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/1.40e-06[uF]/100[V]
* Murata P/N :GRM1555C2A1R4CA01
* Property : C = 1.40e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C2A1R4CA01 Port1 Port2
C01 Port1 N01 1.40e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 5.44e-11
R03 N02 N03 5.50e-01
C04 N03 N04 2.70e-11
L04 N03 N04 1.16e-11
R04 N03 N04 1.56e+00
C05 N04 Port2 2.35e-13
L05 N04 Port2 2.58e-10
R05 N04 Port2 1.00e+05
.ENDS GRM1555C2A1R4CA01
