*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CH(-55to125[deg])/1.30e-05[uF]/16[V]
* Murata P/N :GRM0222C1C130GA03
* Property : C = 1.30e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0222C1C130GA03 Port1 Port2
C01 Port1 N01 1.30e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.52e-10
R03 N02 N03 1.75e-01
L04 N03 N04 9.13e-12
R04 N03 N04 2.06e-01
C05 N04 Port2 1.04e-10
L05 N04 Port2 3.68e-12
R05 N04 Port2 5.51e-01
.ENDS GRM0222C1C130GA03
