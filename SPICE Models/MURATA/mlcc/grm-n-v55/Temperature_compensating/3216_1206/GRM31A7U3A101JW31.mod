*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/U2J(-55to125[deg])/1.00e-04[uF]/1000[V]
* Murata P/N :GRM31A7U3A101JW31
* Property : C = 1.00e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A7U3A101JW31 Port1 Port2
C01 Port1 N01 1.00e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 5.19e-11
R03 N02 N03 1.26e-01
C04 N03 N04 5.41e-10
L04 N03 N04 1.23e-11
R04 N03 N04 7.06e-01
C05 N04 N05 2.80e-11
L05 N04 N05 6.27e-11
R05 N04 N05 4.49e+00
C06 N05 Port2 1.07e-12
L06 N05 Port2 7.16e-10
R06 N05 Port2 4.93e+02
.ENDS GRM31A7U3A101JW31
