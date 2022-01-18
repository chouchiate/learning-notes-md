*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/CH(-55to125[deg])/4.00e-06[uF]/100[V]
* Murata P/N :GRM0332C2A4R0CA01
* Property : C = 4.00e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0332C2A4R0CA01 Port1 Port2
C01 Port1 N01 4.00e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.37e-10
R03 N02 N03 2.37e-01
C04 N03 N04 2.36e-11
L04 N03 N04 1.56e-11
R04 N03 N04 1.09e+00
C05 N04 Port2 2.86e-12
L05 N04 Port2 8.67e-11
R05 N04 Port2 1.00e+05
.ENDS GRM0332C2A4R0CA01
