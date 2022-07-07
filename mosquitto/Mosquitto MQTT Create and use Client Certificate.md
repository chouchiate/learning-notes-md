## Mosquitto MQTT Create and use Client Certificate

* Client certificate identifies client just like Server certificate identifies server
* Certificates are created and distributed to each client that connect to server
* Can share certificates between clients
* As with username/password authentication, broker dictate whether certificate should be supplied from clients

### Mosquitto Broker Configuration

* Require_certificate true



### Preperation



### Create Self-signed Client Certificate

* Client and server must use the same CA (certificate Authority) for client & server certificates

* Create **Client Private Key**

  ```bash
  $ openssl genrsa -out client.key 2048
  ```



* Create a **Certificate Request** and use **Client Private Key** to sign it

  ```bash
  $ openssl req -new -out client.csr -key client.key
  ```

  **Common name entry** can be used by Broker to identify the client as **username**

* Create Client Certificate with Request

  ```bash
  $ openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 3650
  ```



## Testing

### mosquitto_sub

* Sub with username / password

  ```bash
  $ mosquitto_sub -p 1883 -t '#' --username <name> --pw <password>
  ```


### mosquitto retained message

* . 設備在 auth 過程中會連 mqtt broker, 在設備 auth 完成後, 才會去啟動雷達模組
* . 如果設備在尚未啟動雷達前發出設定 mqtt topic /devices/#/config, 設備收到 config 後將會 stall (設備 log 會 print - RadarTimeSyncRequired ＆ StateUpdateRequired)
* . 又, 設備收到設定完成後會自動重啟, 重啟後連上 broker 又會看到 retain config 而進入無限設定循環狀態
* . 因此 mqtt config payload 在傳給 broker 一定時間後必須發 retained empty struct{}{} 給 broker 清除
* . 詳細請見介紹 http://www.steves-internet-guide.com/mqtt-retained-messages-example/