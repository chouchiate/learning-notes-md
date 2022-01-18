*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CH(-55to125[deg])/7.80e-06[uF]/25[V]
* Murata P/N :GRM0222C1E7R8BA03
* Property : C = 7.80e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0222C1E7R8BA03 Port1 Port2
C01 Port1 N01 7.80e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.56e-10
R03 N02 N03 1.37e-01
L04 N03 N04 1.15e-11
R04 N03 N04 5.17e-01
L05 N04 Port2 8.41e-12
R05 N04 Port2 6.57e-02
.ENDS GRM0222C1E7R8BA03
