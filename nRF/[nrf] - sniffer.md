## [nrf] - sniffer setup

### requirement
* wireshark
* DK or dongle
* [download](https://www.nordicsemi.com/Products/Development-tools/nrf-sniffer-for-bluetooth-le/download#infotabs)


### Display FIlter
| Filter | Description | 
|---|---|
|btle.length != 0 | Hide empty packet. Filter displays only packets where length field of BLE packet is not zero | 
|btle.advertising_address | Filter only packets that have an advertising address (packet) |
|btle| Filter displays all BLE packets |
|btatt, btsmp, btl2cap | Filter for ATT, SMP, and L2CAP packets |
| nordic_ble.channel < 37 | Filter only packet received on the data channels |

### Sniff pairing procedure
* Legacy Passkey

* Legacy OOB data

* SC Private Key

[doc](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fug_sniffer_ble%2FUG%2Fsniffer_ble%2Fintro.html)

### Sniff bonded devices
* Legacy LTK

* SC LTK

[doc](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fug_sniffer_ble%2FUG%2Fsniffer_ble%2Fintro.html)