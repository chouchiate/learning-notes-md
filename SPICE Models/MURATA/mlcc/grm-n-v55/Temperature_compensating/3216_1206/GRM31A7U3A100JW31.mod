*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :3216M(1206)/U2J(-55to125[deg])/1.00e-05[uF]/1000[V]
* Murata P/N :GRM31A7U3A100JW31
* Property : C = 1.00e-05[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-3[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM31A7U3A100JW31 Port1 Port2
C01 Port1 N01 1.00e-11
R01 Port1 N01 1.00e+10
L02 N01 N02 9.42e-12
R03 N02 N03 2.37e-01
C04 N03 Port2 8.81e-13
L04 N03 Port2 7.40e-10
R04 N03 Port2 8.70e+02
.ENDS GRM31A7U3A100JW31
