## [k8s] - kubectl

## Usage
```bash
    $kubectl [flags] [options]
```

## help
```bash
    $kubectl <command> --help
```

## options
```bash
# list
    $kubectl options
```
| commands | description |
| ----- | ----- |
| --kubeconfig='' | path to the kubeconfig file to use for cli requests |
| ----certificate-authority='' | path to a cert file for cert authority |
| --cluster='' | the name of the kubeconfig cluster to use |
| --context='' | the name of the kubeconfig context to use |
| --server='' | address and port of the kubernetes api server |



## Basic commands
### create
### expose
### run
### set
### explain
### get
* display one or many resources

### edit
### delete


## Deploy Commands
### rollout
### scale
### autoscale

## Cluster Management Command
### certificate
### cluster-info
### top
### cordon
### uncordon
### drain
### taint


## Troubleshooting and debugging
### describe
### logs
### attach
### exec
### port-forward
### proxy
### cp
### auth
### debug

## Advanced commands
### diff
### apply
* declarative application management
* apply configuration to a resource by file name or stdin
    ```bash
        # apply configuration in pod.json
        $kubectl apply -f ./pod.json
        # apply resource from dir contain yml
        $kubectl apply -k dir/

    ```

### patch
### replace
### wait
### kustomize

## Settings command
### label
### annotate
### completion

## Other command
### api-resources
### api-versions
### config
### plugin
### version
###



## external
[kubectl](https://kubectl.docs.kubernetes.io/guides/introduction/kubectl/)