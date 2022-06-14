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
        image: registry/container:latest

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
    - image: registry/container:latest
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

### Manifest folder structure

以下資料夾結構來描述各叢集的資源檔：

```bash
.
...
├── nis                    # namespace
│   ├── base                        # base directory
│   │   ├── Deployment.yaml         # base k8s objects
│   │   ├── Service.yaml            #   ...
│   │   ├── ...                     #   ...
│   │   └── kustomization.yaml      # base declaration
│   ├── dev                        # actual cluster name (demo)
│   │   ├── kustomization.yaml      # custom declaration
│   │   ├── resources.yaml # a resources patch for demo cluster
│   │   └── output.yaml             # preview the actually applied manifests before ArgoCD applying
│   └── demo                     # actual cluster name (release)
│       ├── ...
│       ...
...

```

### create makefile for kustomize build
```make
.PHONY: some-data-pipeline some-data-pipeline-dev #some-data-pipeline-demo
some-data-pipeline-dev:
	kustomize build some-data-pipeline/dev -o some-data-pipeline/dev/dev.output.yaml || true
some-data-pipeline-demo:
	kustomize build some-data-pipeline/demo -o some-data-pipeline/demo/demo.output.yaml || true
some-data-pipeline: some-data-pipeline-dev some-data-pipeline-demo


```