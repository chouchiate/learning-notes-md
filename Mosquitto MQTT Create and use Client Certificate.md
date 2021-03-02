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

  