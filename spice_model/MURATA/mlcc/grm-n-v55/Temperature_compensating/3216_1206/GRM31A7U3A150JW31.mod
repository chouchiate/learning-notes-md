*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/U2J(-55to125[deg])/1.50e-05[uF]/1000[V]
* Murata P/N :GRM31A7U3A150JW31
* Property : C = 1.50e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A7U3A150JW31 Port1 Port2
C01 Port1 N01 1.50e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 2.27e-11
R03 N02 N03 2.10e-01
C04 N03 N04 1.29e-09
L04 N03 N04 3.07e-12
R04 N03 N04 1.49e-01
C05 N04 N05 2.23e-11
L05 N04 N05 5.73e-11
R05 N04 N05 1.48e+01
C06 N05 Port2 9.76e-13
L06 N05 Port2 6.35e-10
R06 N05 Port2 1.25e+03
.ENDS GRM31A7U3A150JW31