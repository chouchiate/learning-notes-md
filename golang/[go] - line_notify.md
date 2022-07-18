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


### Message Sending
```go

func (l *LineNotifier) SendMessage(message string, token string) error {
	client := &http.Client{}
	notifyPath := l.lineApiHost + lineNotifyEndpoint
	payload := url.Values{}
	payload.Add("message", message)

	req, err := http.NewRequest(http.MethodPost, notifyPath, strings.NewReader(payload.Encode()))
	if err != nil {
		return err
	}
	req.Header.Add("Authorization", fmt.Sprintf("Bearer %s", token))
	req.Header.Add("Content-Type", "application/x-www-form-urlencoded")

	res, err := client.Do(req)
	if err != nil {
		return err
	}
	notifyRespByte, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return err
	}
	defer res.Body.Close()

	// Handler for bad status response. (Status code >= 400)
	if res.StatusCode >= http.StatusBadRequest {
		return errors.New("Error status: " + res.Status + " Body: " + string(notifyRespByte))
	}

	var notifyResp notifyResp
	if err := json.Unmarshal(notifyRespByte, &notifyResp); err != nil {
		return err
	}
	return nil
}
```


### token fetching
```go


```