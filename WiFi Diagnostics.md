## WiFi Diagnostics

### Mac

* Hold **Option** Key and click **Wi-Fi** Icon
* Select **Open Wireless Diagnostics**



### Ubuntu

* ifconfig check wifi device

  ```bash
  $ ifconfig
  ...
  $ sudo ifconfig wlp2s0 up
  $ sudo iwlist wlp2s0 scan | grep \(Channel
  
  						Frequency: 2.417 GHz (Channel 2)
  						Frequency: 2.437 GHz (Channel 6)
  						Frequency: 2.462 GHz (Channel 11)
  						Frequency: 5.18 GHz (Channel 36)
  						Frequency: 5.22 GHz (Channel 44)
  ```

  



