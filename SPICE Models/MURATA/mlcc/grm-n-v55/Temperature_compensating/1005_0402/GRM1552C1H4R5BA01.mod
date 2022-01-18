*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :1005M(0402)/CH(-55to125[deg])/4.50e-06[uF]/50[V]
* Murata P/N :GRM1552C1H4R5BA01
* Property : C = 4.50e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM1552C1H4R5BA01 Port1 Port2
C01 Port1 N01 4.50e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 1.48e-10
R03 N02 N03 2.20e-01
C04 N03 Port2 1.45e-12
L04 N03 Port2 1.72e-10
R04 N03 Port2 7.68e+01
.ENDS GRM1552C1H4R5BA01
