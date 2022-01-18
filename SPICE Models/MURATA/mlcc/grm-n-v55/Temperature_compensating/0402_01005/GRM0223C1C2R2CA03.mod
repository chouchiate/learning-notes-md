*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CJ(-55to125[deg])/2.20e-06[uF]/16[V]
* Murata P/N :GRM0223C1C2R2CA03
* Property : C = 2.20e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0223C1C2R2CA03 Port1 Port2
C01 Port1 N01 2.20e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.59e-10
R03 N02 N03 2.35e-01
L04 N03 N04 5.16e-12
R04 N03 N04 3.24e-01
L05 N04 Port2 2.25e-11
R05 N04 Port2 1.58e-01
.ENDS GRM0223C1C2R2CA03
