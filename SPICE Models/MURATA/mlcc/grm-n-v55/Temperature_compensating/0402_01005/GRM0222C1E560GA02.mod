*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CH(-55to125[deg])/5.60e-05[uF]/25[V]
* Murata P/N :GRM0222C1E560GA02
* Property : C = 5.60e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0222C1E560GA02 Port1 Port2
C01 Port1 N01 5.60e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.67e-10
R03 N02 N03 1.30e-01
L04 N03 N04 1.26e-11
R04 N03 N04 2.25e-01
C05 N04 Port2 4.54e-11
L05 N04 Port2 1.13e-11
R05 N04 Port2 6.27e-01
.ENDS GRM0222C1E560GA02
