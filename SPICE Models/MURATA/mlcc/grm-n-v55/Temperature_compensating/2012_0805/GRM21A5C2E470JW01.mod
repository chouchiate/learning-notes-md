*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :2012M(0805)/C0G(-55to125[deg])/4.70e-05[uF]/250[V]
* Murata P/N :GRM21A5C2E470JW01
* Property : C = 4.70e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM21A5C2E470JW01 Port1 Port2
C01 Port1 N01 4.70e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 3.86e-10
R03 N02 N03 1.85e-01
C04 N03 N04 7.00e-10
L04 N03 N04 7.09e-12
R04 N03 N04 7.47e-01
C05 N04 N05 4.68e-11
L05 N04 N05 4.14e-11
R05 N04 N05 4.03e+00
C06 N05 Port2 1.29e-12
L06 N05 Port2 2.65e-10
R06 N05 Port2 5.83e+01
.ENDS GRM21A5C2E470JW01
