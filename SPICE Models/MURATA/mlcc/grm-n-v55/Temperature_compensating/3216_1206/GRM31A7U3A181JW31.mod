*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/U2J(-55to125[deg])/1.80e-04[uF]/1000[V]
* Murata P/N :GRM31A7U3A181JW31
* Property : C = 1.80e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A7U3A181JW31 Port1 Port2
C01 Port1 N01 1.80e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 9.24e-11
R03 N02 N03 9.70e-02
C04 N03 N04 6.18e-10
L04 N03 N04 3.10e-11
R04 N03 N04 9.92e-01
C05 N04 N05 1.42e-10
L05 N04 N05 4.32e-11
R05 N04 N05 2.12e+00
C06 N05 N06 2.42e-11
L06 N05 N06 5.24e-11
R06 N05 N06 3.30e+00
C07 N06 Port2 1.30e-12
L07 N06 Port2 5.80e-10
R07 N06 Port2 3.15e+02
.ENDS GRM31A7U3A181JW31
