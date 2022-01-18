*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/C0G(-55to125[deg])/3.30e-05[uF]/630[V]
* Murata P/N :GRM31A5C2J330JW01
* Property : C = 3.30e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A5C2J330JW01 Port1 Port2
C01 Port1 N01 3.30e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 6.42e-11
R03 N02 N03 1.33e-01
C04 N03 N04 7.97e-11
L04 N03 N04 4.49e-11
R04 N03 N04 8.03e+00
C05 N04 N05 1.28e-11
L05 N04 N05 1.00e-10
R05 N04 N05 2.39e+01
C06 N05 Port2 7.90e-13
L06 N05 Port2 4.99e-10
R06 N05 Port2 4.51e+02
.ENDS GRM31A5C2J330JW01
