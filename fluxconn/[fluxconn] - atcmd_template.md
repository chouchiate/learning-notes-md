## [fluxconn] - at command

### The Listen Command
* This command enables Production Cellular Agent to listen to the cloud (e.g. for get commands and when properties are changed in the cloud).

* The command gives the device time to send to-device properties to the cloud before the device properties are overwritten by new property values from the cloud.

* The command should be issued by the MCU every time the agent reconnects to the cloud and indicates that the MCU has updated any to-device properties that have changed locally.

* For example, when the device is disconnected from the cloud, both the device and the cloud may update a device property with different values. Then, when the device reconnects to the cloud, the MCU must choose the new value from the cloud or the device:

    + If the MCU uses the new property value from the device, the MCU sends the value to the cloud first; the cloud updates its value and issues the Listen commands to sync all device properties to the new value.
    + If the MCU uses the new property value from the cloud, the MCU issues the Listen commands, and the to-device properties kept locally on the device are overwritten by the new values from the cloud.

### AT+ADA="l”
|Response |	OK |
| ----- | ----- |
| Asynchronous Responses |	+ADA: "l","down" - indicates a loss of connection to the service.
| | +ADA: "1","up" - indicates a connection to the service. |
### Example:
```
    AT+ADA="1"

    OK

    +ADA: "l","up"
```