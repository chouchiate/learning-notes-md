## [embed] - Implement Over-the-air Device firmware upgrade

* The increasing demand by end-users for new functionality.
* To address bugs and security vulnerabilities (critical and non-critical).
* To ship products to market faster and have the option of delaying lower priority features and being able to roll them out to devices in the field.

### Topics to cover:
* What is Device Firmware Update (DFU)?
* What is Over-the-Air Device Firmware Update (OTA DFU)?
* How does OTA DFU work?
* The role of the bootloader
* The basic steps of OTA DFU
* Best practices in implementing OTA DFU

### What is DFU - Device firmware Update
* A device firmware update (DFU) is an operation used to, partially or fully, update the firmware on a device.
* In most cases, DFU relies on the existence of a bootloader. A bootloader is a minimal piece of code that is responsible for:
    - Launching the main firmware or operating system (OS) in a device.
    - Providing the capability of updating the device’s main firmware or OS.
* It is usually optimized and kept to a minimum due to the following reasons:
    - To ensure minimum impact on boot times.
    - To ensure bugs are kept to a minimum in this critical part of the device’s firmware. Bootloaders are rarely updated, so they need to be robust (more lines of code usually increase the probability of bugs).
    - The size of the bootloader impacts how much ROM is left for the application firmware.
* In general, the main operations of a DFU process include:
    - Updating the application, the stack/OS (and sometimes even the bootloader).
    - Verifying DFU package authenticity.
    - Downgrade prevention.
    - Verifying hardware compatibility.
    - Verifying data integrity.
    - Decrypting encrypted data.
    - Support for updating over different transport mediums.

### What is OTA DFU - Over-the-air Device Firmware Upgrade
* OTA stands for “Over-the-Air” and simply refers to the fact that the DFU package is sent to the target/end-device over a wireless connection.
* In our case, the wireless medium is Bluetooth Low Energy. For OTA DFU over Bluetooth Low Energy, there are three main parts:

    - Packaging of the DFU image to be transferred to the target device.
    - Design of the GATT Services and Characteristics needed for the transfer of the DFU image down to the target device.
    - Design of the device firmware update process itself for the target chipset once the device receives the DFU image.
