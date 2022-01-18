*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1608M(0603)/CH(-55to125[deg])/9.80e-06[uF]/100[V]
* Murata P/N :GRM1882C2A9R8DA01
* Property : C = 9.80e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1882C2A9R8DA01 Port1 Port2
C01 Port1 N01 9.80e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 4.30e-10
R03 N02 N03 9.00e-02
L04 N03 N04 7.55e-11
R04 N03 N04 2.08e-01
C05 N04 N05 1.87e-10
L05 N04 N05 5.89e-12
R05 N04 N05 1.72e+00
C06 N05 Port2 1.56e-11
L06 N05 Port2 3.21e-11
R06 N05 Port2 7.92e+00
.ENDS GRM1882C2A9R8DA01
