*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/C0G(-55to125[deg])/3.90e-05[uF]/630[V]
* Murata P/N :GRM31A5C2J390JW01
* Property : C = 3.90e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A5C2J390JW01 Port1 Port2
C01 Port1 N01 3.90e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.63e-10
R03 N02 N03 1.55e-01
C04 N03 N04 9.81e-11
L04 N03 N04 3.04e-11
R04 N03 N04 5.95e+00
C05 N04 N05 7.80e-12
L05 N04 N05 1.53e-10
R05 N04 N05 3.79e+01
C06 N05 Port2 8.66e-13
L06 N05 Port2 4.55e-10
R06 N05 Port2 1.68e+02
.ENDS GRM31A5C2J390JW01