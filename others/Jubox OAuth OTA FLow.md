



   

```sequence
IOT Device->thudercatx Server: Device OAuth
thudercatx Server-->Device Database: Check Credential
Note right of Device Database: Confirm
Note right of Device Database: Update JWT
Device Database-->thudercatx Server: New JWT
thudercatx Server-> IOT Device: Resp New JWT
IOT Device->thudercatx Server: Check Firmware Version
thudercatx Server-->MinIO Storage: Get Latest Version
MinIO Storage-->thudercatx Server: Latest Version Loction
thudercatx Server->IOT Device: Resp DownloadUrl
IOT Device->MinIO Storage: Download Firmware Request
MinIO Storage->IOT Device: Download Begin
```

