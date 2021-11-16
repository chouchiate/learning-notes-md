## [thread] - open thread tutorial

* How to set up the OpenThread build toolchain
* How to simulate a Thread network
* How to authenticate Thread nodes
* How to manage a Thread network with OpenThread Daemon

## Specification Versions
* v1.0 Introduced in 2014
* v1.1 Launched 2017, public on Thread Group Website
* v1.2 Launched 2019, spec. available to members.

## Thread Specification
* A low power, secured, IP-based mesh networking technology for IOT products

* 802.15.4 MAC/PHY layer operating at 250kbps in the 2.4Ghz band.
* Open IPv6 based protocol
* Router/Border Router assume leader role
  - Thread Network Partition
  - assign router address
  - accept new router request
  - leader is elected if formal leader fails


Device Type
* Border Router
  - provide 802.15.4 connectivity to adjacent networks of other PHY layer (Wi-Fi, Ethernet, etc.)
  - provide services for devices within 802.15.4 network:
    + routing services
  - normally an embedded linux device. (eg. Openwrt)

* Router
  - provide routing service to network devics.
  - provide joining and security services
  - Not design to sleep
  - Can downgrade functionality and become REEDs

* Router Eligible End Devices
  - Routing capable device
  - Do not forward messages or provide joining & security services
  - Network manages the transition of REED to router without user interaction
* Sleep End Devices
  - SEDs are host devices communicate only through their parent router.
  - Cannot forward message for other devices

Security
* key agreement mechanism
* All communications are secured with a network key

* Authentication & Key Agreement
  - elliptic curve variant of J-PAKE (EC-JPAKE), using NIST P-256 elliptic curve
  - JPAKE: Password Authenticated Key Exchange with "juggling"
  - Use elliptic curve Diffie-Hellmann for key agreement.
  - Use Schnorr signatures as a NIZK (Non-Interactive Zero-Knowledge) proof mechanism
  - to authenticate two peers and establish a shared secret based on a passphrase.
  - TLS/DTLS handshake is used for EC-JPAKE
  - DTLS: Datagram Transport Layer Security, ie., used within UDP (User Datagram Protocol)
* Network-wide key
  - used in MAC layer and MLE sub-layers
  - protect 802.15.4 MAC data frame 
  - protect MLE message
  - compromised thread device could reveal key; not as the only form of protection.
  - Policing Mechanism to verify joining device and limit the effect of rogue device (joining device to identify a trusted router and communicate solely in a p2p manner)
  - In case commissioning device is not in direct communication with the joining device, "trusted router" MUST relay DTLS handshake with the commissioning device throught "relay agents". 
  - Relay protocol provides encapsulation of the DTLS handshake from joining device to comissioning device.


## Network OSI

## Thread Physical Layer (PHY)
* conforming 2450Mhz PHY specifications defined in IEEE802154 Ch.6
* Used exclusively by a set of MAC, 6LoWPAN, and Thread implementations.
  - PHY service
  - PPDU format
  - PHY constants and PIB attributes
  - 2450Mhz PHY Spec.
  - 868/915 Mhz Band binary phase-shift keying (BPSK) PHY specifications.
  - 868/915 Mhz (optional) amplitude shift keying (ASK) PHY specifications.
  - 868/915 Mhz (optional) O-QPSK PHY specifications
  - General Radio specifications

## Thread MAC layer 

* implementing a subset of IEEE802154 MAC specifications
* Thread routing device must be capable of as a MAC FFD (Full Function Device) with retrictions in "table" section
* Thread device without routing capability must at least a MAC RFD (reduced function device) but MAY implement FFD features.

## Thread device MAC capabilities:
* Employing CSMA-CA (Carrier sense multiple access with collision avoidance) mechanism for channal access
* Scanning using active scan and energy detect (ED) scan types
* Generating and receiving MAC data and acknowledgement frames
* Generating Data Request and Beacon Request MAC command frames
* Generating MAC Beacon frames when Beacon requests are received by an FFD
* Providing a reliable link between two MAC entities
* Using MAC frame security based on the PIB security material attribute settings

## Thread device does not operate follow MAC features:
* Periodic beacon-enabled mode
* GTS (Guaranteed Time Slots) mechanism
* Generating or interpreting following command frames:
  + Association Request,
  + Association Response,
  + Disassociation Request,
  + PAN ID Conflict,
  + Orphan Notification, 
  + Coordinator Realignment,
  + FFD PAN (Personal Area Network) Coordinator mode
  + Any other MAC frame security options not allowed.

Chapter 7 and Annexes of [IEEE802154]()
N: Normative, S: Subset, M: Modified, Not Relevant

## table
|Chapter.Section|Title and Remarks Modification|Status|
|--|--|--|
|Status|
|7| MAC Sublayer Specification <br/>Subset: <br/>Modified:|N,S,M|
|7.1|Mac Sublayer service specification <br/>Modified: <br/> Modeified:|N,M|
|7.1.1|Mac data service|N|
|7.1.2|MAC management service|N|
|7.1.3|Association primitives|N/R|
|7.1.4|Disassociation primitives|N/R|
|7.1.5|Beacon notification primitive|N|
|7.1.6|Primitives for reading PIB attributes|N|
|7.1.7|GTS management primitives|N/R|
|7.1.8|Primitives for orphan notification|N/R|
|7.1.9|Primitive for resetting the MAC sublayer|N|
|7.1.10|Primitives for specifying the receiver enable time|N|
|7.1.11|Primitives for channel scanning|N,M|
|7.1.12|communication status primitive|N|
|7.1.13|Primitives for writing PIB attributes|N|
|7.1.14|Primitives for updating the superframe configuration|N/R|
|7.1.15|Primitives for synchronization with a coordinator|N/R|
|7.1.16|Primitives for requesting data from a coordinator|N|
|7.1.17|MAC enumeration description|N|
|7.2|MAC frame formats|N,M|
|7.3|MAC command frames|N,M|

|Annex A|Service-specific convergence sublayer (SSCS)|N/R|
|Annex B|CCM* mode of operation|N|
|Annex C|Test vectors for cryptographic building blocks|N|
|Annex D|Protocol implementation conformance statement (PICS)|N/R|
|Annex E|Coexistence with other IEEE standards and proposed standards|I|
|Annex F|IEEE 802.15.4 regulatory requirement|I|

## 6LoWPAN Adaptation Layer
* Thread Device Must implement [RFC4944](https://datatracker.ietf.org/doc/html/rfc4944) and [RFC6282](https://datatracker.ietf.org/doc/html/rfc6282)
* 6LowPAN (IPv6 over low-power wireless personal area network) - adaptation layer to fragment and reassemble IPv6 packets (to and from) IEEE802.15.4 MAC data frame payloads
* Mesh Header option described in Ch.11 [RFC4944] is used in conjunction with the Thread Routing mechanism

## Modification and Statements to [RFC4944]
|Chapter.Section|Title and Remark & Modifications|Status|
|--|--|
|1| Introduction|I|
|1.1|Requirements notation|N|
|1.2|Term used|N|
|2|IEEE802.15.4 mode for IP|N|


## Modification and statements to [RFC6282]
|Chapter.Section|Title Remarks.Modification|Status|
|--|--|
|1|Intro|I|
|1.1|Requirement|N|
|2|Specific Update to [RFC4944]|N|
|3|IPv6 Header Compression|N|
|4.2|IPv6 Extension Header Compression<br/>Modified: when single trailing Pad1 or PadN option of 7 octets or less and header is multiple of 8 octets, option should be elided by the compressor|N,M|

## Multiple Interfaces
* A Thread device MAY expose more than one PHY and MAC interface adhering to IEEE802.15.4 standards. but at least one must comply with thread standard.

## Mesh Link Establshment
* Link configuration
  + use link-local unicasts to exchange IEEE 802.15.4 parameters
    - addresses,
    - node capabilities,
    - frame counters
  + Link Configuration Messages
    - request
    - acceptance
    - rejection

* Parameter Dissemination
* Neighbour Detection

  #### Security Format
  * 

  #### Command Format


  #### TLV Format

  * source address TLV
  * Mode TLV
  * Timeout TLV
  * Challenge TLV
  * Response TLV
  * Link-Layer Frame Counter TLV
  * Link Quality TLV
  * Network Parameter
  * MLE Frame Counter TLV
  * Route64 TLV
  * Address16 TLV
  * Leader Data TLV
  * Network Data TLV
  * TLV Request TLV
  * Scan Mask TLV
  * Connectivity TLV
  * Link Margin TLV
  * Status TLV
  * Version TLV
  * Address Registration TLV
  * Channel TLV
    Supported Channel Pages
    Supported Channels
  * PAN ID TLV
  * Active Timestamp TLV
  * Pending Timestamp TLV
  * Active Operational Dataset TLV
  * Pending Operational Dataset TLV
  * Thread Discovery TLV

#### Leader and Network Data

#### Network Attaching

  Attaching to a Parent
  Parent Selection
  Child Update Request and Child Update Response Message
  Message Buffering for Children
  Timing Out Children
  Child Synchronization after Reset
  Link Synchronization
    Initial Router Synchronization
    New Router Neighbor Synchronization
    Router Synchronization after Reset
    REED and FED Synchronization

#### Operational Dataset Announcements


#### Message Transmission


#### Processing of Incoming Message


#### Parameter and Constant


#### IANA Notes


## Network Layer


## Transport Layer


## Security

#### Security Material Generation
#### MAC Security
#### MLE Security
#### DTLS

## Mesh Commissioning Protocol

## Border Router

## Management

## Functional Description




## Thread v1.2 White Paper Notes
* Introduce Thread/Bluetooth Dual Radio Device


## Normative Reference
* AES - NIST, Advanced Encryption Standard, FIPS 197, Nov. 2001
* CCM - NIST, Recommendation for Block Cipher Modes of Operation, SP 800-38C, May 2004
* IEEE802154, Wireless Personal Area Network, IEEE 802.15.4-2006
* RFC 768 - [UDP](https://datatracker.ietf.org/doc/html/rfc768)
* RFC 793 - [TCP](https://datatracker.ietf.org/doc/html/rfc793)
* RFC 1122 - [Internet Hosts - Communication Layers](https://datatracker.ietf.org/doc/html/rfc1122)
* RFC 1902 - [Simple Network Management Protocol - SNMPv2](https://datatracker.ietf.org/doc/html/rfc1902)
* RFC 1918 - []()
* RFC 2080 - []()
* RFC 2119 - []()
* RFC 2131 - []()
* RFC 2460 - []()
* RFC 2464 - []()
* RFC 2473 - []()
* RFC 2863 - []()
* RFC 2892 - []()
* RFC 3306 - []()
* RFC 3315 - []()
* RFC 3633 - []()
* RFC 3546 - []()
* RFC 4086 - []()
* RFC 4191 - []()
* RFC 4193 - []()
* RFC 4291 - []()
* RFC 4443 - []()
* RFC 4492 - []()
* RFC 4615 - []()
* RFC 4861 - []()
* RFC 4862 - []()
* RFC 4864 - []()
* RFC 4868 - []()
* RFC 4944 - [Transmission of IPv6 Packets over IEEE 802.15.4 Networks](https://datatracker.ietf.org/doc/html/rfc4944)
* RFC 5007 - []()
* RFC 5116 - []()
* RFC 5246 - []()
* RFC 6092 - []()
* RFC 6106 - []()
* RFC 6144 - []()
* RFC 6145 - []()
* RFC 6146 - []()
* RFC 6206 - []()
* RFC 6282 - [Compression Format for IPv6 Datagrams over IEEE 802.15.4-Based Networks](https://datatracker.ietf.org/doc/html/rfc6282)
* RFC 6347 - []()
* RFC 6434 - []()
* RFC 6655 - []()
* RFC 6690 - []()
* RFC 6724 - []()
* RFC 6761 - []()
* RFC 6762 - []()
* RFC 6763 - []()
* RFC 6887 - []()
* RFC 6970 - []()
* RFC 7084 - []()
* RFC 7217 - []()
* RFC 7225 - []()
* RFC 7252 - []()
* RFC 7346 - []()
* RFC 7368 - []()
* RFC 7448 - []()
* RFC 7731 - [Multicast protocol for low power and lossy networks (MPL)](https://datatracker.ietf.org/doc/html/rfc7731)
* RFC 7921 - [DHCP Options for Port Control Protocol (PCP)](https://datatracker.ietf.org/doc/html/rfc7921)
Thread Conformance Specification

## Informative Reference
* draft-hao-jpake-03 - []()
* draft-hao-schnorr-01 - []()
* draft-ietf-6lo-mesh-link-establishment-00 - []()
* RFC 4429 - [Optimistic Duplicate Address Detection (DAD)](https://datatracker.ietf.org/doc/html/rfc4429)
* RFC 4861 - [Neighbor Discovery for IPv6](https://datatracker.ietf.org/doc/html/rfc4861)
* RFC 6551 - [Routing Metrics Used for Path Calculation in low-power and lossy Networks](https://datatracker.ietf.org/doc/html/rfc6551)

## Term and Definition
| Term | Definition |
| ---- | ---------- |
|Anycast Locator (ALOC)| An IPv6 Anycast Address as defined in Section 5.2.2.2 |
|Border Router | Capable of forwarding between Thread Network and non-Thread Network. |Interface point for commissioner when commissioner is a non-thread network
|Commissioner | Current Eleceted authentication server for new Thread devices and authorizer |for providing network credentials required to join the network. Must be choosen from |commissioner cadidates
|Commissioner Candidate | become the commissioner, but has not yet been formally assigned the |role |
|End Device (ED) | Transmit and receive unicast traffic only with a Parent Device. <br/> FTDs |nat be a REED ir a FED. <br/> MTDs may be a MED or a SED. |
|Endpoint Identifier (EID) | Thread endpoint identifier is an IPv6 address that uniquely |identifies a Thread interface within a thread network partition and is independent from |topology changes.
|Exterior Network |
|External route |
|Frame Counter |
|Full End Device (FED) |
|Full Trhead Device (FTD) |
|Interior network |
|Joiner | The device to be added by a human admin to a commissioned Thread Network. <br/> |Requires a thread interface to perform. <br/> Joiner does not have network credentials.
|Joiner Router |
|Leader |
|Link Cost |
|Link Quality |
|Link-Local Scope (LL) |
|Mesh-Local Scope (ML) |
|Minimal End Device (MED) |
|Minimal Thread Device (MTD) |
|Native Border Agent |
|Native Commissioner |
|Network Credentials |
|Network Data |
|On-Mesh |
|On-Mesh Commissioner |
|Router Eligible end device (REED) |
|Router ID |
|Routing Locator (RLOC) |
|Server |
|Server Data |
|Sleepy End Device (SED) |
|Stable Network Data |
|Temporary Network Data |
|Thread Network Partition |
|Valid |

## Nomenclature 
|Designation| Definition|
I: Informative |
N: Normative |
M: Modified |
S: Subset |
N/R: Not Relevant |
O: Optional |
A: Additional |

## Acronyms
|Acronym|Definition|
6LoWPAN |
AEDA|
AES|
ALOC|
ANSI|
API|
ASK|
BLE|
BPSK|
CBC-MAC|
CCITT|
CCM|
CID|
CoAP|
CPE|
CRC|
CSMA-CA|
DHCPv6|
DNS|
DNS-SD|
DoS|
DTLS|
DUID|
DUID-EN|
DUID-LL|
ED|
EID|
EUI-64|
FED|
FTD|
GPS|
GTS|
GUA|
HMAC-SHA256|
HNCP|
IA|
IANA|
ICMP|Internet Control Message Protocol|
ICMPv6|
ID|
IDR|Inverse Delivery Ratio
IEEE|
iETF|
IID|Interface Identifier
IP|Internet Protocol
IPv4|
IPv6|
ISP|
IS-IS|
ITU|
J-PAKE|
KA|
KEK|
kHz|
L2TP|Layer 2 Tunneling Protocol
LAN|
LL16|Short Link Local Address
LoWPAN|
LQ|Leasequery
MAC|Media Access Control
mDNS|multicast Domain Name System
MeshCoP|Mesh Commissioning Protocol
MC|Manually Configured
MED|Minimal End Device
MIB|Management Information Base
MIC|Message Integrity Code
MLE|Mesh Link Establishment
ML-EID|Mesh-Local Endpoint Identifier
MLME|MAC Sublayer Management Entity
MLP|Mesh Local Prefix
MPL|Mulicast Protocol for Low Power and Lossy Networks
MRC|Maximum Retransmission Count
MRT|Multicast Retransmission Timeout
MTD|Minimal Thread Device
NAT|Network Address Translation
NIZK|Non-Interactive Zero-Knowledge
NIST|
NTP|network time protocol
OSPF|Open Shortest Path First
OUI|Organizationally Unique Identifier as registered at IEEE
PAKE|Password Authenticated Key Exchange
PAN|Personal Area Network
PAT|Port Address Translation
PCP|Port Control Protocol
PD|Prefix Delegation
PHY|
PIB|PAN Information Base
PICS|Protocol Implementation Conformance Statement
PPDU|Presentation Protocol Data Unit
PRBS|Pseudo Random Binary Sequence
PSKc|Pre-Shared Key for the Commissioner
PSKd|Pre-Shared Key for the Device
QPSK|Offset Quadrature Phase Shift Keying
QR Code|Quick Response Code
REED| Router Eligible End Device
RFC|Request for Comments
RIP|Routing Information Protocol
RLOC|Routing Locator
RLOC16|Last 16 bit of the RLOC address
RSSI|Received Signal Strength Indicator
SED|Sleey End Device
SLAAC|Stateless Address Autoconfiguration
SoftAP|Software-endabled Access POint
SSCS|Service-Specific Convergence Sublayer
SSID|Service Set Identifier
TCP
TKL|Token Length
TLS|Transport Layer Security
TLV|Type-Length-Value
TMF|Thread Management Framework
TOS|Type of Service
TTL|Time to Live
UDP|User Datagram Protocol
UI|User Interface
ULA|Unique Local Address
URI|Uniform Resource Identifier
USB
UTC
VPN
WAN
WPAN
ZkP|Zero Knowledge Proof
