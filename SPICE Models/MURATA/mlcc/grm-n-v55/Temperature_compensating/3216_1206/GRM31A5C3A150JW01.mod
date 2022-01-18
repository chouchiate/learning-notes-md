*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/C0G(-55to125[deg])/1.50e-05[uF]/1000[V]
* Murata P/N :GRM31A5C3A150JW01
* Property : C = 1.50e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A5C3A150JW01 Port1 Port2
C01 Port1 N01 1.50e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 2.29e-10
R03 N02 N03 1.86e-01
C04 N03 N04 1.57e-09
L04 N03 N04 1.78e-12
R04 N03 N04 3.29e-01
C05 N04 N05 3.31e-11
L05 N04 N05 2.80e-11
R05 N04 N05 1.00e+01
C06 N05 Port2 7.33e-13
L06 N05 Port2 5.78e-10
R06 N05 Port2 4.14e+02
.ENDS GRM31A5C3A150JW01
