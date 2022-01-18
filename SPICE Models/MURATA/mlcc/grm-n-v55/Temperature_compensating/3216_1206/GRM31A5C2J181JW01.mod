*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/C0G(-55to125[deg])/1.80e-04[uF]/630[V]
* Murata P/N :GRM31A5C2J181JW01
* Property : C = 1.80e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A5C2J181JW01 Port1 Port2
C01 Port1 N01 1.80e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 1.07e-11
R03 N02 N03 1.21e-01
C04 N03 N04 1.01e-09
L04 N03 N04 1.24e-11
R04 N03 N04 5.95e-01
C05 N04 N05 1.22e-10
L05 N04 N05 2.89e-11
R05 N04 N05 1.58e+00
C06 N05 Port2 5.34e-13
L06 N05 Port2 8.09e-10
R06 N05 Port2 5.55e+02
.ENDS GRM31A5C2J181JW01