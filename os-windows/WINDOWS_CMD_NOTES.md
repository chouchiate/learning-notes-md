## Show WIFI Profiles

```
Netsh wlan show profiles
```



## Show Current connected WIFI

```
Netsh WLAN show interfaces
```

## Add ADF_PATH to PATH
```
set ADF_PATH=%userprofile%\esp\esp-adf
```


## Check ADF_PATH
```
echo %ADF_PATH%
```

## Copy folder
```
xcopy /e /i %ADF_PATH%\examples\get-started\play_mp3_control play_mp3_control

```