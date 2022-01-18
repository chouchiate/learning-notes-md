*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/C0G(-55to125[deg])/1.50e-06[uF]/50[V]
* Murata P/N :GRM0335C1H1R5CA01
* Property : C = 1.50e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0335C1H1R5CA01 Port1 Port2
C01 Port1 N01 1.50e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.46e-10
R03 N02 N03 2.90e-01
C04 N03 Port2 2.61e-11
L04 N03 Port2 1.26e-11
R04 N03 Port2 9.40e-01
.ENDS GRM0335C1H1R5CA01
