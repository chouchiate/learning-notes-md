## [go] - tui-go learning note

> **IMPORTANT**: tui-go is still in an **experimental phase** so please don't use it for anything other than **experiments**, yet.

### 安裝
```bash
    go get github.com/chrishanli/tui-go
```

### ***Widget***
* Main building blocks


### ***Layout***


### ***Alignment***


### ***Box***
#### Declaration
* NewHBox(c ...Widget) *Box

* NewVBox(c ...Widget) *Box

#### Placement


#### Action


#### Setting


### ***Button***


### ***Entry***


### ***ScrollArea***



### ***Painter***



### ***Named keys***
```go
const (
	KeyCtrlSpace Key = iota
	KeyCtrlA
	KeyCtrlB
	KeyCtrlC
	KeyCtrlD
	KeyCtrlE
	KeyCtrlF
	KeyCtrlG
	KeyCtrlH
	KeyCtrlI
	KeyCtrlJ
	KeyCtrlK
	KeyCtrlL
	KeyCtrlM
	KeyCtrlN
	KeyCtrlO
	KeyCtrlP
	KeyCtrlQ
	KeyCtrlR
	KeyCtrlS
	KeyCtrlT
	KeyCtrlU
	KeyCtrlV
	KeyCtrlW
	KeyCtrlX
	KeyCtrlY
	KeyCtrlZ
	KeyCtrlLeftSq // Escape
	KeyCtrlBackslash
	KeyCtrlRightSq
	KeyCtrlCarat
	KeyCtrlUnderscore
)
```