# [ble] - Security Modes and Procedures

1. legacy security mode
2. LE security connections

## main topics
1. main LE security concerns
2. how to combat using different security levels
3. use of a filter accept list when establishing and encrypting the connection.

## pairing process
1. pairing: the process of generating, distributing, and authenticating keys for encryption purposes.
2. bonding:the process of pairing followed by distribution of keys used to encrypt the link in the futuer reconnections.

### Phase 1: initate pairing


### Phase 2: Perform pairing


### Phase 3: Key distribution


### Legacy pairing


### Security concerns


### Security levels
1. no security ()
2. encryption with unauthenticated pairing
  - This method does not protect against MITM attacks. To protect against MITM, the connection needs to be at security level 3 or higher.
  - by using either Passkey Entry or OOB pairing method with Legacy pairing, the connection can be upgraded to security level 3.
3. authenticated pairing with encryption
4. authenticated LE secure connections pairing with encryption



### Filter accept list

# sources
[nordic-dev-academy](https://academy.nordicsemi.com/courses/bluetooth-low-energy-fundamentals/lessons/lesson-5-bluetooth-le-security-fundamentals/)
[microchip-dev-help](https://microchipdeveloper.com/wireless:ble-gap-security#:~:text=Level%201%3A%20No%20Security%20(No,Secure%20Connections%20pairing%20with%20encryption)