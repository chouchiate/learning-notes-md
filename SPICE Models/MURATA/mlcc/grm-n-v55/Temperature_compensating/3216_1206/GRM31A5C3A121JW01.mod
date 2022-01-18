*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/C0G(-55to125[deg])/1.20e-04[uF]/1000[V]
* Murata P/N :GRM31A5C3A121JW01
* Property : C = 1.20e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A5C3A121JW01 Port1 Port2
C01 Port1 N01 1.20e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 3.05e-11
R03 N02 N03 9.85e-02
C04 N03 N04 4.04e-10
L04 N03 N04 2.13e-11
R04 N03 N04 1.96e+00
C05 N04 N05 5.23e-11
L05 N04 N05 5.30e-11
R05 N04 N05 5.88e+00
C06 N05 N06 6.94e-12
L06 N05 N06 1.08e-10
R06 N05 N06 1.84e+01
C07 N06 Port2 8.34e-13
L07 N06 Port2 5.48e-10
R07 N06 Port2 6.26e+02
.ENDS GRM31A5C3A121JW01
