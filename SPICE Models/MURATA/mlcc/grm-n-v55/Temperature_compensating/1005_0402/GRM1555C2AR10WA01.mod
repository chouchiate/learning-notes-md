*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/C0G(-55to125[deg])/1.00e-07[uF]/100[V]
* Murata P/N :GRM1555C2AR10WA01
* Property : C = 1.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1555C2AR10WA01 Port1 Port2
C01 Port1 N01 1.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 2.90e-10
R03 N02 N03 9.53e-01
C04 N03 Port2 3.64e-11
L04 N03 Port2 9.27e-13
R04 N03 Port2 8.74e-01
.ENDS GRM1555C2AR10WA01
