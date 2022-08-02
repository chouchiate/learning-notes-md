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


### custom jwt

```go
import (
    "crypto/ecdsa"
    "crypto/elliptic"
    "crypto/rand"
    "fmt"
    "time"

    "github.com/dgrijalva/jwt-go"
)

type payload struct {
    Data map[string]string `json:"data,omitempty"`
    Type string            `json:"type,omitempty"`
}

type customClaims struct {
    jwt.StandardClaims
    Payload payload `json:"payload,omitempty"`
    Env     string  `json:"env,omitempty"`
}

func main() {
    key, _ := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)

    timestamp := time.Now().Unix()

    claims := customClaims{
        StandardClaims: jwt.StandardClaims{
            Audience:  "notify",
            ExpiresAt: timestamp + 60,
            Issuer:    "id.example.com",
            IssuedAt:  timestamp,
        },
        Env: "integration",
        Payload: payload{
            Type: "CUSTOM",
            Data: map[string]string{
                "name": "bob",
                "id":   "123456",
            },
        },
    }

    token := jwt.NewWithClaims(jwt.SigningMethodES256, claims)
    tokenString, _ := token.SignedString(key)

    fmt.Println(tokenString)
}
```
