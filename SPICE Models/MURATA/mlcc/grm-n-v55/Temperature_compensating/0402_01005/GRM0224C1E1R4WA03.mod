*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CK(-55to125[deg])/1.40e-06[uF]/25[V]
* Murata P/N :GRM0224C1E1R4WA03
* Property : C = 1.40e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0224C1E1R4WA03 Port1 Port2
C01 Port1 N01 1.40e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.26e-10
R03 N02 N03 3.76e-01
L04 N03 N04 4.99e-12
R04 N03 N04 4.84e-01
L05 N04 Port2 6.60e-12
R05 N04 Port2 1.14e-01
.ENDS GRM0224C1E1R4WA03
