## Mosquitto Enable TLS



Resources

* http://www.steves-internet-guide.com/mosquitto-tls/
* https://www.onetransistor.eu/2019/05/mosquitto-mqtt-tls-certificate.html
* http://www.steves-internet-guide.com/creating-and-using-client-certificates-with-mqtt-and-mosquitto/
* https://openest.io/en/2020/01/03/mqtts-how-to-use-mqtt-with-tls/
* https://blog.feabhas.com/2020/02/running-the-eclipse-mosquitto-mqtt-broker-in-a-docker-container/
* https://hackaday.io/project/12482-garage-door-opener/log/43367-using-a-username-and-password-for-mqtt
* https://blog.feabhas.com/2020/02/running-the-eclipse-mosquitto-mqtt-broker-in-a-docker-container/



* Enable require_certificate setting

  ```bash
  require_certificate true		
  ```

* Generate Certificate Authority (CA)

  ```bash
  $ openssl req -new -x509 -days 365 -extensions v3_ca -keyout ca.key -out ca.crt -subj "/C=RO/ST=Home/L=Home/O=OneTransistor/OU=OneTransistor/CN=onetransistor.eu"
  ```

  ```bash
  $ openssl req -x509 -new -nodes -key ca.key -subj "/CN=${COMMON_NAME}" -days 3650 -reqexts v3_req -extensions v3_ca -out ca.crt -config /usr/local/etc/openssl@1.1/openssl.cnf
  ```

  

## Install OpenSSL (macOS)

```bash
$ brew update
$ brew install openssl
# upgrade
$ brew upgrade openssl@1.x
```

### Add [ v3_ca ] Config

* At usr/local/etc/openssl@1.1/openssl.cnf

```cnf
basicConstraints = critical,CA:TRUE
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer:always
```

### Self Signed SSL Shell

```bash
# install new OpenSSL
$ brew install openssl

# generate private key and enter pass phrase
$ openssl genrsa -des3 -out private_key.pem 2048

# create certificate signing request, enter "*.example.com" as a "Common Name", leave "challenge password" blank
$ openssl req -new -sha256 -key private_key.pem -out server.csr

# generate self-signed certificate for 1 year
$ openssl req -x509 -sha256 -days 365 -key private_key.pem -in server.csr -out server.pem

# validate the certificate
$ openssl req -in server.csr -text -noout | grep -i "Signature.*SHA256" && echo "All is well" || echo "This certificate doesn't work in 2017! You must update OpenSSL to generate a widely-compatible certificate"

```

### Self Signed SSL Mongo Shell

```bash
openssl genrsa -out CAroot.key 2048
openssl req -new -key CAroot.key -out CAroot.csr # CN should be different from the certificates below
openssl req -x509 -days 1825 -key CAroot.key -in CAroot.csr -out CAroot.crt
cat CAroot.crt CAroot.key > CAroot.pem

openssl genrsa -out mongod.key 2048
openssl req -new -key mongod.key -out mongod.csr
openssl x509 -req -days 1825 -in mongod.csr -CA CAroot.pem -CAkey CAroot.key -CAcreateserial -out mongod.crt
cat mongod.crt mongod.key > mongod.pem

openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr
openssl x509 -req -days 1825 -in client.csr -CA CAroot.pem -CAkey CAroot.key -CAcreateserial -out client.crt
cat client.crt client.key > client.pem

mongo --ssl --sslCAFile CAroot.pem --sslPEMKeyFile client.pem --authenticationDatabase production -u user -p password --host mongo.host --port 27018
	
```

### Verify your key matches

```

```





### Create username & password

```bash
# enter into docker container
$ docker exec -it <container_id> bin/sh
# create password file
$ mosquitto_passwd -c /mosquitto/config/pwfile <username>
# you will be prompted with password input
$ 
```

### Use docker compose command to create username & password

```bash

```

### Not yet tested

```bash
$ docker-compose mosquitto run /bin/sh -c "touch /tmp/passwd && mosquitto_passwd -b /tmp/passwd [username] [password] && cat /tmp/passwd && rm /tmp/passwd" > mosquitto/etc/passwd
```

