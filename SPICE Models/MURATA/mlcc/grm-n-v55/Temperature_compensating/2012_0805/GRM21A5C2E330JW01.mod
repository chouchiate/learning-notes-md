*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :2012M(0805)/C0G(-55to125[deg])/3.30e-05[uF]/250[V]
* Murata P/N :GRM21A5C2E330JW01
* Property : C = 3.30e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM21A5C2E330JW01 Port1 Port2
C01 Port1 N01 3.30e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 6.35e-11
R03 N02 N03 1.71e-01
C04 N03 N04 3.13e-10
L04 N03 N04 1.32e-11
R04 N03 N04 1.92e+00
C05 N04 N05 3.31e-11
L05 N04 N05 5.59e-11
R05 N04 N05 8.23e+00
C06 N05 Port2 8.74e-13
L06 N05 Port2 4.49e-10
R06 N05 Port2 1.84e+02
.ENDS GRM21A5C2E330JW01
