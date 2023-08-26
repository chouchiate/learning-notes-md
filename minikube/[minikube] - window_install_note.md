## [minikube] - window install

### Powershell
```bash
## change directory to download

New-Item -Path 'd:\' -Name 'minikube' -ItemType Directory -Force
Invoke-WebRequest -OutFile 'd:\minikube\minikube.exe' -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing

## add exe to PATH

$oldPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
if ($oldPath.Split(';') -inotcontains 'd:\minikube'){
  [Environment]::SetEnvironmentVariable('Path', $('{0};d:\minikube' -f $oldPath), [EnvironmentVariableTarget]::Machine)
}

## restart powershell to make effect


```

