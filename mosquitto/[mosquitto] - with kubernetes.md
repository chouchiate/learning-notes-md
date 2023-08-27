## [mosquitto] - high availability with kubernetes

### Single Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mosquitto
  namespace: automation
spec:
  selector:
    matchLabels:
      app: mosquitto
  template:
    metadata:
      labels:
        app: mosquitto
        type: primary
    spec:
      containers:
        - image: eclipse-mosquitto:2.0.12
          name: mosquitto
          ports:
            - containerPort: 1883
            - containerPort: 9001
          command:
            - mosquitto
          args:
            - -c
            - /mosquitto-no-auth.conf
      securityContext:
        runAsUser: 1883
        runAsGroup: 1883
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values: [mosquitto]
            topologyKey: kubernetes.io/hostname
```

### Service
```yaml
apiVersion: v1
kind: Service
metadata:
  name: mosquitto
  namespace: automation
spec:
  ports:
    - name: mqtt
      port: 1883
      targetPort: 1883
    - name: wss
      port: 9001
      targetPort: 9001
  selector:
    app: mosquitto
  type: LoadBalancer
  externalTrafficPolicy: Local
# Use an loadBalancerIP (e.g. MetalLB) or externalIP depending on your setup
#  externalIPs:
#    - ${EI_MQTT}
```

### High availability deployment
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: bridge-conf
  namespace: automation
data:
  mosquitto.conf: |
    listener 1883
    allow_anonymous true

    connection broker0
    address mosquitto-p.automation
    topic # both 0
```

### a service only selects the primary pod
```yaml
apiVersion: v1
kind: Service
metadata:
  name: mosquitto-p
  namespace: automation
spec:
  ports:
    - name: mqtt
      port: 1883
      targetPort: 1883
  selector:
    app: mosquitto
    type: primary
```

### And add a second deployment which uses this config
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mosquitto-b
  namespace: automation
spec:
  selector:
    matchLabels:
      app: mosquitto
  template:
    metadata:
      labels:
        app: mosquitto
        type: bridge
    spec:
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - mosquitto
            topologyKey: kubernetes.io/hostname
      containers:
      - args:
        - -c
        - /mosquitto/config/mosquitto.conf
        command:
        - mosquitto
        image: eclipse-mosquitto:2.0.12
        name: mosquitto
        ports:
        - containerPort: 1883
        - containerPort: 9001
        volumeMounts:
        - mountPath: /mosquitto/config
          name: config
      securityContext:
        runAsGroup: 1883
        runAsUser: 1883
      volumes:
      - configMap:
          name: bridge-conf
        name: config
```

### external
[github](https://github.com/vaskozl/home-infra/tree/main/cluster/automation/mosquitto)
