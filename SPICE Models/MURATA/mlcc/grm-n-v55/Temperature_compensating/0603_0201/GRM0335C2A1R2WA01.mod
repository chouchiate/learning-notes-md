*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/1.20e-06[uF]/100[V]
* Murata P/N :GRM0335C2A1R2WA01
* Property : C = 1.20e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C2A1R2WA01 Port1 Port2
C01 Port1 N01 1.20e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.10e-10
R03 N02 N03 3.34e-01
L04 N03 Port2 2.76e-11
R04 N03 Port2 1.28e+00
.ENDS GRM0335C2A1R2WA01
