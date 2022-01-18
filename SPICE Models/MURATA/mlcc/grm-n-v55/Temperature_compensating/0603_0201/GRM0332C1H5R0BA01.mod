*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/CH(-55to125[deg])/5.00e-06[uF]/50[V]
* Murata P/N :GRM0332C1H5R0BA01
* Property : C = 5.00e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0332C1H5R0BA01 Port1 Port2
C01 Port1 N01 5.00e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 6.89e-11
R03 N02 N03 2.10e-01
C04 N03 N04 1.33e-12
L04 N03 N04 1.48e-10
R04 N03 N04 1.00e+05
C05 N04 Port2 7.70e-12
L05 N04 Port2 2.44e-11
R05 N04 Port2 1.53e+00
.ENDS GRM0332C1H5R0BA01
