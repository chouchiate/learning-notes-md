## Docker_Compose_Note

```
// docker-compose.yml template

version: "3.3"
services:
  thudercatx:
    networks:
      - network-name
    image: "example/backend:latest"
    container_name: back_container
    #network_mode: "host"
    #volumes:
    #  - ./server/dist:/usr/app/dist
    restart: always
    env_file: ./server/.env
    tty: true
    ports:
      # Websocket Port
      - "6666:6666"
      # API Proxy Port
      - "9999:9999"
      # MQTT Broke Port
      - "1883:1883"

    expose:
      - "6666"
      - "8888"
      - "1883"
      - "50052"
      - "5000"
    command: [ "pm2-runtime", "npm", "--", "start" ]

  frontend-example:
    networks:
      - network-name
    image: "example/frontend:latest"
    container_name: front_container
    restart: always
    env_file: ./frontend/.env
    tty: true
    ports:
      - "3000:3000"
    expose:
      - "3000"
    command: [ "pm2-runtime", "npm", "--", "start"]

  couchdb-example:
    networks:
      - network-name
    image: "couchdb:latest"
    container_name: couchdb_container
    #network_mode: "host"
    restart: always
    env_file:
        - ./server/couch.env
    tty: true
    ports:
      - "5984:5984"
    expose:
      - "5984"

networks:
  network-name:
    external: true




```

