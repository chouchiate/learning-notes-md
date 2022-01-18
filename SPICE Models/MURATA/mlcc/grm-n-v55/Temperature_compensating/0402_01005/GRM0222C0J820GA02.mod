*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/CH(-55to125[deg])/8.20e-05[uF]/6.3[V]
* Murata P/N :GRM0222C0J820GA02
* Property : C = 8.20e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0222C0J820GA02 Port1 Port2
C01 Port1 N01 8.20e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.53e-10
R03 N02 N03 1.11e-01
C04 N03 N04 5.87e-11
L04 N03 N04 1.58e-11
R04 N03 N04 6.37e-01
C05 N04 Port2 6.37e-11
L05 N04 Port2 4.71e-12
R05 N04 Port2 8.45e-01
.ENDS GRM0222C0J820GA02
