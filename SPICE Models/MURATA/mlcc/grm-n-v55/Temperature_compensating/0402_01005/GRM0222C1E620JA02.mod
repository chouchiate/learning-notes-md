*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CH(-55to125[deg])/6.20e-05[uF]/25[V]
* Murata P/N :GRM0222C1E620JA02
* Property : C = 6.20e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0222C1E620JA02 Port1 Port2
C01 Port1 N01 6.20e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.59e-10
R03 N02 N03 1.27e-01
C04 N03 Port2 2.00e-11
L04 N03 Port2 2.36e-11
R04 N03 Port2 8.26e-01
.ENDS GRM0222C1E620JA02
