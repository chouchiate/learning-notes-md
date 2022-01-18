*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/C0G(-55to125[deg])/6.80e-05[uF]/6.3[V]
* Murata P/N :GRM0225C0J680JA02
* Property : C = 6.80e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0225C0J680JA02 Port1 Port2
C01 Port1 N01 6.80e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.54e-10
R03 N02 N03 1.25e-01
C04 N03 Port2 2.61e-11
L04 N03 Port2 2.07e-11
R04 N03 Port2 7.16e-01
.ENDS GRM0225C0J680JA02
