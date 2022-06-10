## K8s Deployment

```
docker login
```

```bash
kubectl create secret generic docker-account --from-file=<file_directory>
```

### Pod Health Check & Restart Policy

```
ReadinessProbe		// save at service EndPoint
LivenessProbe


```

* restartPolicy
  * always
  * onFailure
  * Never
* Pod Life Cycle
  * Pending
  * Running
  * Succeeded
  * Failed
  * Unknown
* Pod variables
  * intialDelaySeconds
  * periodSeconds
  * timeoutSeconds
  * sucessThreshold
  * failureThreshold

### ConfigMap and Secret 定義

```
apiVersion:
kind:
metadata:
	name: <appName>
	labels:
		name: <lookupName>
data:

```



## Istio 介紹

* service mesh
  * A/B testing
  * Canary



* Gateway
* Vitual service (Ingress)
* Service
* Pod
*