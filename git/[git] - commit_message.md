## [git] - commit message guidelines

> Commit Message 最好兼俱 Why 及 What，讓日後進行維護人員更快進入狀況。

* 把 Git 當作歷史查閱的工具才拿發揮 Git 的功能。
* 讓 commit 訊息跟異動的程式碼有關聯。
* 每次 Commit 都是針對異動的檔案做說明：Why & What。
* 每次 Commit 都加上 issue 編號，方便追蹤相關的程式異動原因。

### 良 vs 不良
* 良好的 Commit Message: 如何在「一年後」讓維護人員進入狀況
* 不良的 Commit Message: 如何在「一個月內」讓維護人員找不出程式異動的原因。

### Commit Message 規範組成：
```bash
Header: <type>(<scope>): <subject>

```
 - type: 代表 commit 的類別：feat, fix, docs, style, refactor, test, chore，必要欄位。
 - scope 代表 commit 影響的範圍，例如資料庫、控制層、模板層等等，視專案不同而不同，為可選欄位。
 - subject 代表此 commit 的簡短描述，不要超過 50 個字元，結尾不要加句號，為必要欄位。

### Example
```bash
# header
fix: 修正捐款單資料管理>匯入資料時間格式錯誤問題
#body
Description: ExcelToJSON() 轉譯出來的 timestmap 還需要扣除 timezone 的時區差異 才是正確的 timestamp
#footer
issue 11161
```

### Commit types
> 只允許使用以下類別：
* feat: 新增/修改功能 (feature)。
* fix: 修補 bug (bug fix)。
* docs: 文件 (documentation)。
* style: 格式 (不影響程式碼運行的變動 white-space, formatting, missing semi colons, etc)。
* refactor: 重構 (既不是新增功能，也不是修補 bug 的程式碼變動)。
* perf: 改善效能 (A code change that improves performance)。
* test: 增加測試 (when adding missing tests)。
* chore: 建構程序或輔助工具的變動 (maintain)。
* revert: 撤銷回覆先前的 commit 例如：revert: type(scope): subject (回覆版本：xxxx)。

> 利用不同的 Type 來決定進行 Code Review 檢視的角度，可以提升 Code Review 的速度。因此開發團隊應該要對這些 Type 的使用時機有一致的認同。

* 看到 Type 為 fix，進行 Code Review 的人就可以用「觀察 Commit 如何解決錯誤」的角度來閱讀程式碼。
* 若是 refactor，則可以放輕鬆閱讀程式碼如何被重構，因為重構的本質是不會影響既有的功能。


---

### 範例 fix #1
```bash
fix: 自訂表單新增/編輯頁面，修正離開頁面提醒邏輯

# 問題：
1. 原程式碼進入新增頁面後，沒做任何動作之下，離開頁面會跳提醒
2. 原程式碼從新增/編輯頁面回到上一頁後（表單列表頁面），離開頁面會跳提醒

# 原因：
1. 新增頁面時，頁面自動建立空白題組會調用 sort_item，造成初始化 unload 事件處理器。
2. 回到上一頁後，就不需要監聽 unload 事件，應該把 unload 事件取消。

# 調整項目：
1. 初始化 unload 事件處理器：排除新增表單時，頁面自動建立空白題組調用 sort_item 的情境
2. 回到上一頁後，復原表單被異動狀態且清除 unload 事件處理器

issue #1335
```

### 範例 fix #2
```bash
fix: 意見反應，信件看不到圖片問題

# 問題：
1. 客戶反應：意見反應的信件都看不到圖片。

# 原因：
1. 目前程式碼都會要求先登入後才可查看使用者上傳的檔案，
   造成在信件上會看不見圖片的問題。

# 調整項目：
1. File.php，經討論後，開放讓意見反應頁面上傳的檔案，不用登入就可以查看/下載。

issue #1229

```


---
### external
[source](https://wadehuanglearning.blogspot.com/2019/05/commit-commit-commit-why-what-commit.html)
