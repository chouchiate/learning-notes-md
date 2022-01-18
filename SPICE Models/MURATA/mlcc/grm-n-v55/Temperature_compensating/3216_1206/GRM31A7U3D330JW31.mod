*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/U2J(-55to125[deg])/3.30e-05[uF]/2000[V]
* Murata P/N :GRM31A7U3D330JW31
* Property : C = 3.30e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A7U3D330JW31 Port1 Port2
C01 Port1 N01 3.30e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 4.71e-11
R03 N02 N03 1.67e-01
C04 N03 N04 6.79e-11
L04 N03 N04 3.09e-11
R04 N03 N04 2.95e+00
C05 N04 Port2 6.26e-13
L05 N04 Port2 7.84e-10
R05 N04 Port2 6.69e+02
.ENDS GRM31A7U3D330JW31
