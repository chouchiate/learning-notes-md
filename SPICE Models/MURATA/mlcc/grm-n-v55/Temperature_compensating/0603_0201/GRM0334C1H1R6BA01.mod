*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/CK(-55to125[deg])/1.60e-06[uF]/50[V]
* Murata P/N :GRM0334C1H1R6BA01
* Property : C = 1.60e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0334C1H1R6BA01 Port1 Port2
C01 Port1 N01 1.60e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.46e-10
R03 N02 N03 2.90e-01
C04 N03 Port2 2.61e-11
L04 N03 Port2 1.26e-11
R04 N03 Port2 9.40e-01
.ENDS GRM0334C1H1R6BA01
