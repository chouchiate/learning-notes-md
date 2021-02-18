## mosquitto.conf man

source

```
mosquitto.org/man/mosquitto-conf-5.html
```



### Authentication

* Unauthenticated encrypted support is provided by certificate base SSL/TLS options (certfile and keyfile)
* MQTT provides username/password authentication as part of protocol
  * Use password_file option to define the valid usernames and passwords
  * Use network encryption if password_file is used

* if require_certificate == true, 

  * client must provide a valid certificate with username/password

  * 2nd and 3rd option: become relevant

    * use_identity_as_username ( if=true, Common Name: CN from certificate is used instead of username )

    * use_subject_as_username ( if-true, entire certificate subject is used instead of just CN )

      

* If require_certificate == false,

  * client provide username/password only 

* if use pre-shared-key based encryption via 

  * psk_hint and psk_file
  * client must provide valid identity and key



### General Options

```
acl_file	file path
```

* Set path to 'access control list' file.

* used to control client access to topics on broker

* Topic access is added with lines of format:

  ```
  topic [read|write|readwrite|deny] <topic>
  ```

