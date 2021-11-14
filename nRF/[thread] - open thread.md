## [thread] - open thread tutorial

* How to set up the OpenThread build toolchain
* How to simulate a Thread network
* How to authenticate Thread nodes
* How to manage a Thread network with OpenThread Daemon

## Mesh Network


## Thread Specification
* 802.15.4 MAC/PHY layer operating at 250kbps in the 2.4Ghz band.
* Router/Border Router assume leader role
  - Thread Network Partition
  - assign router address
  - accept new router request
  - leader is elected if formal leader fails


Device Type
* Border Router
* Router
* Router Eligible End Devices
* Sleep End Devices

Security
* Authentication


## Network OSI
* Physical layer
* MAC layer
* 6LoWPAN
* Multiple Interface

## Mesh Link Establshment
* Link configuration
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

