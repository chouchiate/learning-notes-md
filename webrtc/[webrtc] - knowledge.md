## [webrtc] - intro knownledge


- python: aiortc
- c: gstreamer's webrtcbin
- typescript: werift
- golang: pion
- erlang: shiguredo
- java: |pipe|
- rust: webrtc-rs
- c/embedded: aws webrtc
### source
[conf42](https://youtu.be/4kdU9_a-gII)

### webrtc for the curious


### what to be solved by webrtc
- connect two users with no public ip
    - Solution: NAT traversal (similar to automatic port forwarding)
- stay connected on the move
    - Solution: ICE restart (switch connection on the fly)
- what bitrate do I upload? (what bandwidth is available?)
    - Solution: Congestion Control
- Do not block on the past
    - Solution: SCTP

- bundle existing protocols

![](../assets/img/webrtc_no_public.png)

![](../assets/img/webrtc_nat_traversal.png)

![](../assets/img/webrtc_ice_restart.png)

![](../assets/img/webrtc_congestion_control.png)

