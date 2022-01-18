*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/U2J(-55to125[deg])/1.80e-05[uF]/1000[V]
* Murata P/N :GRM31A7U3A180JW31
* Property : C = 1.80e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A7U3A180JW31 Port1 Port2
C01 Port1 N01 1.80e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.28e-10
R03 N02 N03 2.27e-01
C04 N03 N04 9.17e-10
L04 N03 N04 4.64e-12
R04 N03 N04 1.28e-01
C05 N04 Port2 9.95e-13
L05 N04 Port2 7.11e-10
R05 N04 Port2 7.91e+02
.ENDS GRM31A7U3A180JW31
