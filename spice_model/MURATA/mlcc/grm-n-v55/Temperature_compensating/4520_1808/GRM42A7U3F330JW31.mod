*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :4520M(1808)/U2J(-55to125[deg])/3.30e-05[uF]/3150[V]
* Murata P/N :GRM42A7U3F330JW31
* Property : C = 3.30e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM42A7U3F330JW31 Port1 Port2
C01 Port1 N01 3.30e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.17e-11
R03 N02 N03 1.66e-01
C04 N03 N04 1.89e-11
L04 N03 N04 8.00e-11
R04 N03 N04 1.11e+01
C05 N04 Port2 1.02e-12
L05 N04 Port2 9.44e-10
R05 N04 Port2 7.83e+02
.ENDS GRM42A7U3F330JW31