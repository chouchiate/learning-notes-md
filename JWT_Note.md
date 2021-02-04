## Json_Web_Token_Note

Generate RS256 Key

```bash
$ ssh-keygen -t rsa -b 2048 -m PEM -f jwtRS256.key
# Don't add passphrase
$ openssl rsa -in jwtRS256.key -pubout -outform PEM -out jwtRS256.key.pub
$ cat jwtRS256.key
$ cat jwtRS256.key.pub
```

Notes

* What is openssl -in , -pubout, -outform, -out

