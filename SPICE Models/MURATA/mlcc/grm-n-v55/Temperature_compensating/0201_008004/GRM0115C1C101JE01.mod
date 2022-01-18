*----------------------------------------------------------------------
* SPICE Model generated by Murata Manufacturing Co., Ltd.
* Copyright(C) Murata Manufacturing Co., Ltd.
* Description :0201M(008004)/C0G(-55to125[deg])/1.00e-04[uF]/16[V]
* Murata P/N :GRM0115C1C101JE01
* Property : C = 1.00e-04[uF]
* Data Generated on Nov 26, 2021
*----------------------------------------------------------------------
* Applicable Conditions:
*   Frequency Range = 100[MHz]-9[GHz]
*   Temperature = 25 degC
*   DC Bias Voltage = 0V
*   Small Signal Operation
*----------------------------------------------------------------------
.SUBCKT GRM0115C1C101JE01 Port1 Port2
C01 Port1 N01 1.00e-10
R01 Port1 N01 1.00e+10
L02 N01 N02 8.32e-11
R03 N02 N03 8.37e-02
C04 N03 Port2 1.20e-12
L04 N03 Port2 3.40e-11
R04 N03 Port2 1.41e+00
.ENDS GRM0115C1C101JE01
