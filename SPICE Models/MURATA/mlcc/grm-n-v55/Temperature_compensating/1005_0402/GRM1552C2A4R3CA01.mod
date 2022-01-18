*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/4.30e-06[uF]/100[V]
* Murata P/N :GRM1552C2A4R3CA01
* Property : C = 4.30e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C2A4R3CA01 Port1 Port2
C01 Port1 N01 4.30e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.53e-10
R03 N02 N03 2.25e-01
L04 N03 N04 2.45e-11
R04 N03 N04 4.53e-01
C05 N04 N05 2.43e-11
L05 N04 N05 1.46e-11
R05 N04 N05 5.70e+00
C06 N05 Port2 3.88e-12
L06 N05 Port2 5.91e-11
R06 N05 Port2 1.00e+05
.ENDS GRM1552C2A4R3CA01
