*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/C0G(-55to125[deg])/2.20e-05[uF]/50[V]
* Murata P/N :GRM0225C1H220GA02
* Property : C = 2.20e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0225C1H220GA02 Port1 Port2
C01 Port1 N01 2.20e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.60e-10
R03 N02 N03 1.82e-01
L04 N03 N04 1.46e-11
R04 N03 N04 4.13e-01
C05 N04 Port2 1.23e-10
L05 N04 Port2 3.16e-12
R05 N04 Port2 4.46e-01
.ENDS GRM0225C1H220GA02
