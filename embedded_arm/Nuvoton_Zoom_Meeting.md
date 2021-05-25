## Nuvoton_Zoom_Meeting_Note

* Board Level Security
* Comm. Security: MQTT/Coap + TLS
* Board Level Security: 
  * Secure boot (from M0)
    * NuBL1: Root of Trust, Verified NuBL2
    * NuBL2 & OTA: Verified NuBL32/33, OTA Service
    * NuBL32: Secure Application
    * NuBL33: Non-Secure Application
  * Critical Memory Protection (M0+ to M4, MPU)
  * Trustzone (M23)
  * Crypto SCA/DPA, fault injection of voltage and clock glitch
* 請問 non-secure application 要如何運行 secure application 的程式？
  * secure function call
  * secure gateway
* UCID: unique client ID
* UDID: unique device ID