## [matter] - smart home api

* OAuth 2.0 - account linking
* Intents
    - SYNC: tell Google about the user device
    - QUERY: tell Google the device current state
    - EXECUTE: change the device state
    - DISCONNECT: User has unlink the account from google side
* Provide device update
    - Request SYNC
    - Request STATE


* Google
    - NLU
    - TTS
    - Homegraph
    - it8n
    - Lexical expansion
    - context
    - Error handling
    - device schema
    - security
* You
    - oauth
    - device sync
    - execution
    - real time data integration
* Hardware

* Device Type
    * Device Trait
        - Attributes
        - States
        - Commands

* [start-up-guide](https://www.silabs.com/wireless/matter#start)
* Silabs Thunder board Sense 2

* Silabs Stack

    - Application
        * Matter
        * Customer App
    - Thread:
        * UDP
        * IP Routing
        * 6LoPWAN
    - MAC: IEEE 802.15.4
    - Hardware
        * PHY: RAIL
        * Gecko Bootloader

* Border Router
    - Raspberry PI
    - EFR32 Radio Co-Processor (RS9116)

### Thread Support from Silabs
* Thread v1.2 (GSDK)
* DMP Homekit (GSDK)
* CMP OpenThread + Zigbee Alpha
* Multi-protocol (CMP/DMP) with BLE & Zigbee

### Matter Support from Silabs
