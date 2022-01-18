*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CH(-55to125[deg])/5.80e-06[uF]/16[V]
* Murata P/N :GRM0222C1C5R8CA03
* Property : C = 5.80e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0222C1C5R8CA03 Port1 Port2
C01 Port1 N01 5.80e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.55e-10
R03 N02 N03 1.45e-01
L04 N03 N04 1.12e-11
R04 N03 N04 5.15e-01
L05 N04 Port2 9.05e-12
R05 N04 Port2 7.97e-02
.ENDS GRM0222C1C5R8CA03
