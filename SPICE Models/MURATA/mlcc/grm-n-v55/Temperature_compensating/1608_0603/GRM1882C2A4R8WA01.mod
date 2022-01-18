*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CH(-55to125[deg])/4.80e-06[uF]/100[V]
* Murata P/N :GRM1882C2A4R8WA01
* Property : C = 4.80e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1882C2A4R8WA01 Port1 Port2
C01 Port1 N01 4.80e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 3.59e-10
R03 N02 N03 1.27e-01
L04 N03 N04 1.24e-10
R04 N03 N04 2.33e-01
C05 N04 N05 1.84e-11
L05 N04 N05 3.02e-11
R05 N04 N05 1.41e+01
C06 N05 Port2 3.66e-12
L06 N05 Port2 7.84e-11
R06 N05 Port2 3.67e+01
.ENDS GRM1882C2A4R8WA01
