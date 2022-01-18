*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/6.70e-06[uF]/16[V]
* Murata P/N :GRM0115C1C6R7WE01
* Property : C = 6.70e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1C6R7WE01 Port1 Port2
C01 Port1 N01 6.70e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 9.99e-11
R03 N02 N03 1.37e-01
L04 N03 N04 1.66e-11
R04 N03 N04 1.43e-01
C05 N04 Port2 1.27e-11
L05 N04 Port2 1.14e-11
R05 N04 Port2 1.65e+00
.ENDS GRM0115C1C6R7WE01
