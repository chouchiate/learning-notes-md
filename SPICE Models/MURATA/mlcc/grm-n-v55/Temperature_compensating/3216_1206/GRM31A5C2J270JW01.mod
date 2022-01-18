*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/C0G(-55to125[deg])/2.70e-05[uF]/630[V]
* Murata P/N :GRM31A5C2J270JW01
* Property : C = 2.70e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A5C2J270JW01 Port1 Port2
C01 Port1 N01 2.70e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.58e-11
R03 N02 N03 1.41e-01
C04 N03 N04 6.69e-11
L04 N03 N04 3.77e-11
R04 N03 N04 8.03e+00
C05 N04 N05 6.12e-12
L05 N04 N05 1.45e-10
R05 N04 N05 4.88e+01
C06 N05 Port2 7.54e-13
L06 N05 Port2 5.22e-10
R06 N05 Port2 5.95e+02
.ENDS GRM31A5C2J270JW01