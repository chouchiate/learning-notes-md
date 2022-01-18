*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3225M(1210)/U2J(-55to125[deg])/1.50e-04[uF]/2000[V]
* Murata P/N :GRM32A7U3D151JW31
* Property : C = 1.50e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM32A7U3D151JW31 Port1 Port2
C01 Port1 N01 1.50e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 4.07e-12
R03 N02 N03 6.75e-02
C04 N03 N04 1.96e-10
L04 N03 N04 5.52e-11
R04 N03 N04 2.82e+00
C05 N04 N05 8.88e-11
L05 N04 N05 3.79e-11
R05 N04 N05 3.58e+00
C06 N05 Port2 1.40e-12
L06 N05 Port2 4.40e-10
R06 N05 Port2 1.43e+02
.ENDS GRM32A7U3D151JW31
