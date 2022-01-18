*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CH(-55to125[deg])/6.30e-06[uF]/100[V]
* Murata P/N :GRM1882C2A6R3CA01
* Property : C = 6.30e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1882C2A6R3CA01 Port1 Port2
C01 Port1 N01 6.30e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 3.42e-10
R03 N02 N03 1.10e-01
L04 N03 N04 6.95e-11
R04 N03 N04 2.29e-01
C05 N04 N05 5.34e-11
L05 N04 N05 1.14e-11
R05 N04 N05 6.74e+00
C06 N05 Port2 2.49e-12
L06 N05 Port2 1.25e-10
R06 N05 Port2 6.13e+01
.ENDS GRM1882C2A6R3CA01
