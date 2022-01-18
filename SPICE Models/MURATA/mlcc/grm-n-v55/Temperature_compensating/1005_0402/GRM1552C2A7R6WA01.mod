*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/7.60e-06[uF]/100[V]
* Murata P/N :GRM1552C2A7R6WA01
* Property : C = 7.60e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C2A7R6WA01 Port1 Port2
C01 Port1 N01 7.60e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.25e-10
R03 N02 N03 1.98e-01
L04 N03 N04 8.75e-12
R04 N03 N04 1.63e-01
C05 N04 N05 1.48e-11
L05 N04 N05 3.82e-11
R05 N04 N05 1.02e+01
C06 N05 Port2 8.77e-12
L06 N05 Port2 3.82e-11
R06 N05 Port2 1.36e+01
.ENDS GRM1552C2A7R6WA01
