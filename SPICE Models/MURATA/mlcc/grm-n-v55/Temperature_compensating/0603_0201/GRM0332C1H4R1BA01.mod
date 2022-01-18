*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/CH(-55to125[deg])/4.10e-06[uF]/50[V]
* Murata P/N :GRM0332C1H4R1BA01
* Property : C = 4.10e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0332C1H4R1BA01 Port1 Port2
C01 Port1 N01 4.10e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.56e-10
R03 N02 N03 2.30e-01
C04 N03 N04 1.28e-11
L04 N03 N04 1.13e-11
R04 N03 N04 3.37e-01
C05 N04 Port2 1.36e-12
L05 N04 Port2 9.58e-11
R05 N04 Port2 6.50e+01
.ENDS GRM0332C1H4R1BA01
