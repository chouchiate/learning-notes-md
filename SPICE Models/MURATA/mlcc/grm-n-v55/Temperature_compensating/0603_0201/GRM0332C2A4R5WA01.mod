*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/CH(-55to125[deg])/4.50e-06[uF]/100[V]
* Murata P/N :GRM0332C2A4R5WA01
* Property : C = 4.50e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0332C2A4R5WA01 Port1 Port2
C01 Port1 N01 4.50e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.27e-10
R03 N02 N03 2.20e-01
L04 N03 N04 1.04e-11
R04 N03 N04 8.34e-02
C05 N04 Port2 3.87e-12
L05 N04 Port2 3.82e-11
R05 N04 Port2 5.22e+00
.ENDS GRM0332C2A4R5WA01
