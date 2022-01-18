*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :4520M(1808)/U2J(-55to125[deg])/1.00e-05[uF]/3150[V]
* Murata P/N :GRM42A7U3F100JW31
* Property : C = 1.00e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM42A7U3F100JW31 Port1 Port2
C01 Port1 N01 1.00e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 6.24e-10
R03 N02 N03 1.33e-01
C04 N03 N04 4.05e-10
R04 N03 N04 3.93e+00
L05 N04 N05 2.63e-11
R05 N04 N05 4.95e-01
C06 N05 Port2 3.40e-12
L06 N05 Port2 3.23e-10
R06 N05 Port2 1.95e+02
.ENDS GRM42A7U3F100JW31
