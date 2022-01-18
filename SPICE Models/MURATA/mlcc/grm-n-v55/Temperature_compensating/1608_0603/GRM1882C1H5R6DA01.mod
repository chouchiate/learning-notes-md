*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CH(-55to125[deg])/5.60e-06[uF]/50[V]
* Murata P/N :GRM1882C1H5R6DA01
* Property : C = 5.60e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1882C1H5R6DA01 Port1 Port2
C01 Port1 N01 5.60e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 3.09e-10
R03 N02 N03 1.15e-01
L04 N03 N04 1.67e-10
R04 N03 N04 2.11e-01
C05 N04 N05 1.60e-11
L05 N04 N05 3.98e-11
R05 N04 N05 1.60e+01
C06 N05 Port2 2.68e-12
L06 N05 Port2 1.19e-10
R06 N05 Port2 7.76e+01
.ENDS GRM1882C1H5R6DA01
