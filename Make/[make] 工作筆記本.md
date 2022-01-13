## [make] - **工作筆記本**

start-mosquitto:
	@echo "start mosquitto broker..."
	@docker run -d --rm --name jubox-mqtt-6 \
		-p $(MQTT_PORT):1883 \
		eclipse-mosquitto:1.6.12-openssl

stop-mosquitto:
	@echo "stop mosquitto broker..."
	@docker stop jubox-mqtt-6 | true

start-main:
	cd server; echo "Starting Jubo-Box"; npm run start:dev; 

start-gcp-to-local:
	cd server; echo "Starting Gcp-to-local-sniffer"; npm run start:gcp-to-local; 	

start-gcp-to-dev:
	cd server; echo "Starting Gcp-to-development-sniffer"; npm run start:gcp-to-dev; 	




