*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/5.60e-06[uF]/100[V]
* Murata P/N :GRM1552C2A5R6CA01
* Property : C = 5.60e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C2A5R6CA01 Port1 Port2
C01 Port1 N01 5.60e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.50e-10
R03 N02 N03 2.10e-01
L04 N03 N04 1.90e-11
R04 N03 N04 3.10e-01
C05 N04 N05 1.64e-11
L05 N04 N05 2.89e-11
R05 N04 N05 1.00e+01
C06 N05 Port2 8.10e-12
L06 N05 Port2 3.25e-11
R06 N05 Port2 1.00e+05
.ENDS GRM1552C2A5R6CA01
