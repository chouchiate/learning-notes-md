*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/C0G(-55to125[deg])/1.00e-04[uF]/6.3[V]
* Murata P/N :GRM0225C0J101GA02
* Property : C = 1.00e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0225C0J101GA02 Port1 Port2
C01 Port1 N01 1.00e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 1.46e-10
R03 N02 N03 9.89e-02
C04 N03 N04 4.65e-10
L04 N03 N04 6.34e-12
R04 N03 N04 2.43e-01
C05 N04 N05 1.44e-10
L05 N04 N05 8.70e-12
R05 N04 N05 5.65e-01
C06 N05 Port2 6.26e-11
L06 N05 Port2 6.24e-12
R06 N05 Port2 5.84e-01
.ENDS GRM0225C0J101GA02
