## [go] - line notify

```go
// Line's API endpoint and Host
const (
	lineAuthLinkEndpoint string = "/oauth/authorize"
	lineTokenEndpoint    string = "/oauth/token"
	lineNotifyEndpoint   string = "/api/notify"
	lineStatusEndpoint   string = "/api/status"
	lineRevokeEndpoint   string = "/api/revoke"
)
const (
	botAddr string = "https://notify-bot.line.me"
	apiAddr string = "https://notify-api.line.me"
)
```