



   

```sequence
IOT Device->Jubox Server: Device OAuth
Jubox Server-->Device Database: Check Credential
Note right of Device Database: Confirm
Note right of Device Database: Update JWT
Device Database-->Jubox Server: New JWT
Jubox Server-> IOT Device: Resp New JWT
IOT Device->Jubox Server: Check Firmware Version
Jubox Server-->MinIO Storage: Get Latest Version
MinIO Storage-->Jubox Server: Latest Version Loction
Jubox Server->IOT Device: Resp DownloadUrl
IOT Device->MinIO Storage: Download Firmware Request
MinIO Storage->IOT Device: Download Begin
```

