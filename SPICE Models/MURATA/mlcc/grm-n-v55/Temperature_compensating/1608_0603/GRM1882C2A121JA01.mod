*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CH(-55to125[deg])/1.20e-04[uF]/100[V]
* Murata P/N :GRM1882C2A121JA01
* Property : C = 1.20e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1882C2A121JA01 Port1 Port2
C01 Port1 N01 1.20e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 1.00e-12
R03 N02 N03 1.20e-01
L04 N03 N04 1.12e-10
R04 N03 N04 6.06e+00
C05 N04 N05 6.69e-13
L05 N04 N05 4.16e-10
C06 N05 N06 1.00e-11
L06 N05 N06 3.95e-11
R06 N05 N06 6.08e+00
C07 N06 N07 1.48e-10
L07 N06 N07 2.85e-11
R07 N06 N07 1.42e+00
C08 N07 Port2 1.31e-09
L08 N07 Port2 8.61e-12
R08 N07 Port2 3.36e-01
.ENDS GRM1882C2A121JA01
