*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0402M(01005)/C0G(-55to125[deg])/1.30e-06[uF]/50[V]
* Murata P/N :GRM0225C1H1R3BA03
* Property : C = 1.30e-06[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-20[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0225C1H1R3BA03 Port1 Port2
C01 Port1 N01 1.30e-12
R01 Port1 N01 1.00e+10
L02 N01 N02 2.30e-10
R03 N02 N03 3.96e-01
L04 N03 N04 6.69e-12
R04 N03 N04 8.15e-01
L05 N04 Port2 4.02e-12
R05 N04 Port2 8.79e-02
.ENDS GRM0225C1H1R3BA03
