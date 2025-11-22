## 0. Basics about IPV4

> ⚠️ All informations are found on different websites which are credited in the section "Sources" at the end of this document.

IPv4 stands for `Internet protocol version 4` and is required to work with any `TCP/IP` based protocols [1]. The internet is a wired or wireless connection between every device and has the task to share data and informations with each other. 

## 1. Components of a network

- **Hosts:** One host is the source of destination, the other one will be the destination. It's an end to end connection between hosts. This can be a PC, internet server, database server etc.
- **Media:** Type of connection. This can be a wire, like a copper, fiber optic or coaxial cable. It is also possible to have a wireless connection with the help of WiFi.
- **Hub:** Multiport Repeater which will send the LAN-signal to every other port. It's a component which is used on Layer-1 (Physical Layer) of the OSI-Model.
- **Switch:** Multiport bridge which is used to connect hosts in a LAN segment. Faster than hubs and operate on wire speed. Typically they are on Layer-2 (Data Link Layer) but there also exist Layer-3 (Network Layer) switches.
- **Gateways:** Software, or sometimes in combination with hardware, for exchanging data among networks. Different protocols for sharing data are used.
- **Firewall:** Software, or sometimes in combination with hardware, to protect users data from unintended recipients on the network/internet.

> All components serve the hosts in a network.

Two hosts can only communicate if they can identify each other in a network. Computer components have therefore a `MAC`-address, which is a factory coded 48-bits hardware adress. In a local network, this address is sufficient so that different hosts can communicate with each other.

If a remote host needs to be addressed, the device needs an identification outside of the local network. This is done by using `IPV4` or `IPV6` [2].

## 2. OSI-Model

`OSI` stands for "Open System Interconnection" and is build up as 7 layers:

- **Application Layer (7):** Application that is used to establish a connection between hosts. This can be for example an electronic mail service, HTTP, etc.
- **Presentation Layer (6):** Responsible to have the correct data representation.
- **Session Layer (5):** Session managment between hosts. Assist in synchronizaation, dialog control and critical operation management. This can be for example a password verification.
- **Transport Layer (4):** Segmentation of the data to provide the end to end data delivery among hosts. This will be given the Network layer for transmission.
- **Network Layer (3):** Uniquely identification of hosts beyond the subnets. Path defination which the packets will follow or be routed to reach their destination.
- **Data Link Layer (2):** Error detection and sometimes correction. Converts data frames into a raw transmission and vice versa for the physical layer or the network layer.
- **Physical Layer (1):** Actual communication with the hardware technology by sending signals over a wire or electrical wave [3].

## 3. TCP/IP

A simplification of the `OSI`-Model is made with the `TCP/IP`-Model. This is build like this:

- **Appication Layer (4):** Application - Presentation - Session, as one layer.
- **Transport Layer (3):** Same as in the `OSI`-model.
- **Internet Layer (2):** Replaces the Network-Layer from the `OSI`-model.
- **Link Layer (1):** Combination of Datalink and Physical Layer [4].

<div style="text-align:center;">
    <img src="images/OSI&TCPIP-model.svg" style="width:50%">
</div>

## Packet Structure

An `IPv4` has per host a 32-bit adress and is divided in 4-Octet numberes ranged from 0-255. This is due to the binary size of 8 bits per Octet [5].

The Internet Protocol from layer-3 in the `OSI`-model takes data segments from layer-4 and divides it into packets. It contains an `IP` Header and it's data.

<div style="text-align:center;">
    <img src="images/IP_package.svg" style="width:50%">
</div>

The `IP` header contains different informations and has at least a length of 160-bits.

- **Version (4 bits):** of used `IPv4`
- **IHL (4 bits):** Internet header Length, minimum value is 5 to respect the minimum length of 160 bits which equals 20 bytes. The max value is 15 and the remaining 320 bits are used to determine the "other" sector of the IP-Header.
- **DSCP (6 bits):** Differentiated Services Code Point: Type of Service. Used for real-time data streaming, for example Voice over IP (`VoIP`).
- **ECN (2 bits):** Explicit Congestion Notification, information about the seen congestion in the route.
- **Total Length (16 bits):** IP packet size, includes ip header and payload. Minimum size is 20 bytes which contains only the header and no data and the maximum is 65.535 bytes.
- **TODO**

- **Options:** Rarely used and up to 320 bits, padded to multiples of 32 bits. 

## Sources

- [1] Tutorialspoint: https://www.tutorialspoint.com/ipv4/index.htm
- [2] Tutorialspoint: https://www.tutorialspoint.com/ipv4/ipv4_overview.htm
- [3] Tutorialspoint: https://www.tutorialspoint.com/ipv4/ipv4_osi_model.htm
- [4] Tutorialspoint: https://www.tutorialspoint.com/ipv4/ipv4_tcpip_model.htm
- [5] Wikipedia: https://en.wikipedia.org/wiki/IPv4
