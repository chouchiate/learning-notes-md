*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/C0G(-55to125[deg])/8.20e-05[uF]/1000[V]
* Murata P/N :GRM31A5C3A820JW01
* Property : C = 8.20e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A5C3A820JW01 Port1 Port2
C01 Port1 N01 8.20e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 1.94e-10
R03 N02 N03 1.24e-01
C04 N03 N04 3.68e-10
L04 N03 N04 1.66e-11
R04 N03 N04 1.69e+00
C05 N04 N05 3.70e-11
L05 N04 N05 5.07e-11
R05 N04 N05 7.04e+00
C06 N05 Port2 8.44e-13
L06 N05 Port2 5.67e-10
R06 N05 Port2 2.20e+02
.ENDS GRM31A5C3A820JW01
