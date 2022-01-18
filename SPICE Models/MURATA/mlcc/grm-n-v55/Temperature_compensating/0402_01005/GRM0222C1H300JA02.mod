*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CH(-55to125[deg])/3.00e-05[uF]/50[V]
* Murata P/N :GRM0222C1H300JA02
* Property : C = 3.00e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0222C1H300JA02 Port1 Port2
C01 Port1 N01 3.00e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.74e-10
R03 N02 N03 1.84e-01
C04 N03 Port2 1.84e-11
L04 N03 Port2 1.73e-11
R04 N03 Port2 8.86e-01
.ENDS GRM0222C1H300JA02
