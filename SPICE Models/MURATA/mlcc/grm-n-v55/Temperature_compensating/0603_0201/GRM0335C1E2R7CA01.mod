*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/2.70e-06[uF]/25[V]
* Murata P/N :GRM0335C1E2R7CA01
* Property : C = 2.70e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C1E2R7CA01 Port1 Port2
C01 Port1 N01 2.70e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.66e-10
R03 N02 N03 2.55e-01
C04 N03 N04 1.32e-11
L04 N03 N04 1.95e-11
R04 N03 N04 1.57e+00
C05 N04 Port2 4.58e-12
L05 N04 Port2 5.42e-11
R05 N04 Port2 1.00e+05
.ENDS GRM0335C1E2R7CA01
