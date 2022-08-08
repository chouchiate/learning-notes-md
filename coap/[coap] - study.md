## [coap] - study note

### What is Constrained Node Networks
* An edge system consists of constrained or non-constrained devices, or both. This blog discusses only the constrained devices.

### What is a constrained node
* Devices with limited resources like memory, processing capacity, and power are called constrained nodes.

### Classes of constrained nodes
| Class | RAM | Flash |
| --- | --- | --- |
| Class 0 | | |
| Class 1 | ~10kiB | ~100kiB |
| Class 2 | ~50kiB | ~250kiB |

### Classes network stack and security
| Class | Network | Security |
| --- | --- | --- |
| Class 0 | non | non |
| Class 1 | Specifically designed network stack for constrained nodes. | Supports security functions like authentication, confidentiality, and integrity |
| Class 2 | Capable of supporting the same network stack as used on servers; however, using the same network stack as used in class 1 devices increases the inter-operability | Supports security functions like authentication, confidentiality, and integrity |

### Building blocks of COAP network
1. Sensors – measures physical properties and gives electrical output. E.g. temperature sensor and acceleration sensor.
2. Actuators - takes electronic input and gives physical output; e.g. motors.
3. Cluster - group of sensors and actuators.
4. Communication Channel - a medium through which data is transferred; e.g. wired or wireless.
5. Aggregators – a device used to aggregate all the data from sensors and sometimes give the command to actuators. It is the gateway device.
6. eUtility – a software or hardware or services which support aggregators for feeding data and computing.
7. Decision Trigger – a software which performs computing and takes action if needed.

### Building Blocks of IOT System

1. Edge Network
    * Devices: Embedded devices, sensors, and actuators, gateways;
    * Application: sensing, monitoring, actuating, and operations with the external world
2. Fog Network
    * Devices: Gateway and high-end servers
    * Application: Broker, data acquisition and processing, commanding, real-time analystics, database, etc.
3. Cloud Network
    * Devices: Cloud platform and high-end servers
    * Application: storage, machine learning, deep learning



* CoAP over UDP - [RFC7252]()
* CoAP over TCP/TLS - [RFC8232]()
* Observe resources in CoAP - [RFC7641]()
* Block-wise transfers in CoAP - [RFC7959]()
* CoAP NoResponse option in CoAP [RFC7967]
* CoAP over DTLS [pion/dtls]()
* request multiplexer
* multicast
