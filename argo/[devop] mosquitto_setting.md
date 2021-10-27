update:  dev-mqtt 已可成功介接，有以下兩個基礎建設的設定要做
K8S  cluster 內的 ingress controller (Istio) 需要 expose port:1883
CloudFlare DNS record 預設走 Proxied mode，proxies server 的 allowed ports 如官方文件。由於 1883 非 allowed port，故需要改成 DNS Only mode，才能成功串通 mqtt client -> dev-mqtt.jubo.health -> mqtt server (on k8s)
$ mqtt test -h dev-mqtt.jubo.health -p 1883 -u jubo -pw space
MQTT 3: OK
	- Maximum topic length: 65535 bytes
	- QoS 0: Received 10/10 publishes in 15.06ms
	- QoS 1: Received 10/10 publishes in 133.40ms
	- QoS 2: Received 10/10 publishes in 267.24ms
	- Retain: OK
	- Wildcard subscriptions: OK
	- Shared subscriptions: OK
	- Payload size: >= 100000 bytes
	- Maximum client id length: 65535 bytes
	- Unsupported Ascii Chars: ALL SUPPORTED
MQTT 5: OK
	- Connect restrictions:
		> Retain: OK
		> Wildcard subscriptions: OK
		> Shared subscriptions: OK
		> Subscription identifiers: OK
		> Maximum QoS: 2
		> Receive maximum: 65535
		> Maximum packet size: 268435460 bytes
		> Topic alias maximum: 10
		> Session expiry interval: Client-based
		> Server keep alive: Client-based