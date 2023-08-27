## PJCHEN 

Nis, 日照 居服 vital-link

telecare

Amplify

OAuth2

Resource Owner (User) 

Client (Web/App)

Server (Oauth Server)

Authorization Server

Resource Server

Client_id:client_secret (base64 encode)

Basic Access Auth, vs 3 legged Auth, 

Token revoke after logout

```
//basic access auth
{
access_token:
expired_in:
}

// 3-legged
{
access_token:
refresh_token: 
id_token:
}
```





```sequence
Resource Owner -> Client(App) :  login
Client(App) -> Server(App) : 3rd-party login
Server(App) -> Authorization Server(G) : clientid+secret
Authorization Server -> Server(App):oauth_data
Server(App)->Client(App):oauth_data
Client(App)->Resource Owner:login_success




```



