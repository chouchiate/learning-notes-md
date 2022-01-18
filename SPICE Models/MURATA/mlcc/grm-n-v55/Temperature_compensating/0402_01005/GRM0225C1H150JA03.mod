*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/C0G(-55to125[deg])/1.50e-05[uF]/50[V]
* Murata P/N :GRM0225C1H150JA03
* Property : C = 1.50e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0225C1H150JA03 Port1 Port2
C01 Port1 N01 1.50e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.49e-10
R03 N02 N03 1.59e-01
L04 N03 N04 1.05e-11
R04 N03 N04 2.15e-01
C05 N04 Port2 1.13e-10
L05 N04 Port2 3.58e-12
R05 N04 Port2 4.32e-01
.ENDS GRM0225C1H150JA03
