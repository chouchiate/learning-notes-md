*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0603M(0201)/CH(-55to125[deg])/2.70e-04[uF]/25[V]
* Murata P/N :GRM0332C1E271GA01
* Property : C = 2.70e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0332C1E271GA01 Port1 Port2
C01 Port1 N01 2.70e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 2.24e-10
R03 N02 N03 9.66e-02
C04 N03 N04 1.79e-10
L04 N03 N04 2.46e-11
R04 N03 N04 4.51e-01
C05 N04 Port2 4.16e-12
L05 N04 Port2 3.45e-11
R05 N04 Port2 3.70e+00
.ENDS GRM0332C1E271GA01
