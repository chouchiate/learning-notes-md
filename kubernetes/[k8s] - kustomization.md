## [k8s] - kustomization

### namespace
    - will override existing namespace if set on resource, or add if not set on resource
### namespace example
```yml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: the-deployment
  namespace: the-namespace
spec:
  replicas: 5
  template:
    containers:
      - name: the-container
        image: registry/conatiner:latest

# kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: kustomize-namespace

resources:
- deployment.yaml

# build output.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: the-deployment
  namespace: kustomize-namespace
spec:
  replicas: 5
  template:
    containers:
    - image: registry/conatiner:latest
      name: the-container

```

### resources
    - resources to include
    - each entry must be a path to file or url

```yml
resources:
- myNamespace.yaml
- sub-dir/some-deployment.yaml
- ../../commonbase
- github.com/kubernetes-sigs/kustomize/examples/multibases?ref=v1.0.6
- deployment.yaml
- github.com/kubernets-sigs/kustomize/examples/helloWorld?ref=test-branch
```