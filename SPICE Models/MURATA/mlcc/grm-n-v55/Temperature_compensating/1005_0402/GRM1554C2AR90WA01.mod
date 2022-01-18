*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CK(-55to125[deg])/9.00e-07[uF]/100[V]
* Murata P/N :GRM1554C2AR90WA01
* Property : C = 9.00e-07[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1554C2AR90WA01 Port1 Port2
C01 Port1 N01 9.00e-13
R01 Port1 N01 1.00e+10
L02 N01 N02 3.12e-10
R03 N02 N03 7.43e-01
C04 N03 N04 1.11e-12
L04 N03 N04 5.44e-11
R04 N03 N04 4.04e+01
C05 N04 Port2 4.92e-13
L05 N04 Port2 1.01e-10
R05 N04 Port2 1.00e+08
.ENDS GRM1554C2AR90WA01
