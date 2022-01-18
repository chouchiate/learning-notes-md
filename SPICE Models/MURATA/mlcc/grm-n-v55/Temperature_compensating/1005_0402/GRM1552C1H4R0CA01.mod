*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/4.00e-06[uF]/50[V]
* Murata P/N :GRM1552C1H4R0CA01
* Property : C = 4.00e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C1H4R0CA01 Port1 Port2
C01 Port1 N01 4.00e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.78e-10
R03 N02 N03 2.30e-01
C04 N03 Port2 1.89e-12
L04 N03 Port2 1.39e-10
R04 N03 Port2 6.00e+01
.ENDS GRM1552C1H4R0CA01
