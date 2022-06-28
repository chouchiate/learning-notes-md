## [Git] - General_Note
## 安裝

```bash
brew install git
```

#### git config - 使用者資料設定

```bash
git --version
git config --global --add user.name "derel33t"
git config --global --add user.email "derel33t@gmail.com"
```

#### git remote - Set a new Remote

```bash
# Set a new Remote
$ git remote add origin <remote_path> # git@gitlab.com:username/projectpath.git
# Verify New Remote, view remote repo
$ git remote -v
```

#### git add multiple remotes
```bash
# Syntax to add a git remote
git remote add REMOTE-ID REMOTE-URL

# By convention, the original / primary remote repo is called origin

# Add remote 1: GitHub.
git remote add origin git@github.com:jigarius/toggl2redmine.git
# Add remote 2: BitBucket.
git remote add upstream git@bitbucket.org:jigarius/toggl2redmine.git

# To add one or more remote Git repos – make sure that each repo has its unique ID, i.e. origin, upstream
```

#### Change Remote Url
```bash
# The syntax is: git remote set-url REMOTE-ID REMOTE-URL
git remote set-url upstream git@foobar.com:jigarius/toggl2redmine.git
```

#### List all remotes
```bash
$git remote -v
origin	    git@github.com:jigarius/toggl2redmine.git (fetch)
origin	    git@github.com:jigarius/toggl2redmine.git (push)
upstream    git@bitbucket.org:jigarius/toggl2redmine.git (fetch)
upstream    git@bitbucket.org:jigarius/toggl2redmine.git (push)
```

#### Remove a Remote
```bash
# The syntax is: git remote remove REMOTE-ID
git remote remove upstream
```

#### Push to multiple remotes
* to push to multiple Git remotes with a single git push command.
    - choose a remote ID which will refer to all the remotes.
```bash
# Create a new remote called "all" with the URL of the primary repo.
git remote add all git@github.com:jigarius/toggl2redmine.git
# Re-register the remote as a push URL.
git remote set-url --add --push all git@github.com:jigarius/toggl2redmine.git
# Add a push URL to a remote. This means that "git push" will also push to this git URL.
git remote set-url --add --push all git@bitbucket.org:jigarius/toggl2redmine.git

# Replace BRANCH with the name of the branch you want to push.
git push all BRANCH
```

#### Edit git config
```bash
git config --global --edit
```

#### List git config
```bash
git config --global --list
```

### Config Remote Path Replace `git://` with `https://` (use SSH)
```bash
git config --global url.git@gitlab.xxx.com:.insteadOf https://gitlab.xxx.com/
```

## More on Replace `git://` with `https://`
Rewrite any `git://` urls to be `https://` but, it won't touch `ssh`urls (`git@github.com:`)

```sh
git config --global url."https://github".insteadOf git://github
```
 ### or replace with `ssh`
 Use `ssh` instead of `https://`

 ```sh
 git config --global url."git@github.com:".insteadOf "https://github.com/"
 ```

---
**sauce:** _https://gist.github.com/grawity/4392747_ & [@hansdg1](https://github.com/hansdg1)

#### git push to Github under a different user.name
```bash
# ie remote: Permission to <remote_git>.git denied to <another_user>.
$ git config --local credential.helper ""
# then push again
$ git push origin <branch>

```



#### git diff - 檢視差異

```bash
#
git diff			#
git diff --staged	 #
git diff [first-branch] [second-branch]		#
# check difference: current and stash
git diff stash@{0} master

# Window Power shell need to add quote
git diff stash@"{0}" main > ./tmp/diff_adc.txt

# 輸出差異到檔案 diff.txt
git diff master..branch1 > diff.txt

# git diff 對檔案 hmq.go 檔案兩個 commits (1st 2nd) 比較差異, 輸出差異到 ./tmp/diff.log
git diff e7ea844 a5eaff7 ./data-processor/processor/hmq.go  > ./tmp/diff.log

```

#### git log - 檢視紀錄
> 搜尋 local git log commit message with "keyword"
```bash
$ git log --all --oneline | grep "slack"
```


#### git blame - 檢視



#### git checkout - 移動 HEAD

```bash
# Create a branch
$ git checkout -b <name_of_new_branch>
#
git checkout [FileName]
git checkout .
git checkout [commit-hash]
git checkout master
```



### Discard local and fetch from remote master

```bash
$ git fetch --all
## login
$ git reset --hard origin/<branch_name>
```

### Revert One Commit

```bash
$ git revert HEAD -m 1
# Undo most recent commit
$ git reset HEAD-1
```

### Undo git add
```bash
## all files
$ git reset
## one file
$ git reset <file>
```

### Rebase Remote Change and Merge with Local Update

```bash
$ git stash
$ git pull --rebase
$ git stash pop
## If No Conflict
$ git push -u origin <branch_name>

## List the stashes:
git stash list
## Show the files in the most recent stash:
git stash show
## Show the changes of the most recent stash:
git stash show -p
## Show the changes of the named stash:
git stash show -p stash@{1}
## Show stash diff to file
git stash show -p > ./diff.txt

## If Conflict
$ git status
### Fix Conflict and update
$ git add --all
## continue rebase
$ git rebase --continue
## push to remote

```

### Update Local List of Remote Branches
```bash
$ git remote update origin --prune
## Show all local and remote branches
$ git branch -a
```

### How to Refresh gitignore
```bash
# clear git cache
$ git rm -r --cached .
```


### Branch Develop then Merge to Main

```bash
# Move/rename a branch
$ git branch --move --force <new_name> # or
# -f, --force: Reset <branchname> to <startpoint>
$ git branch -M <new_name>
# switch to new-branch
$ git checkout new-branch
# .. develop some code
$ git add -A
$ git commit -m "commit message"
$ git checkout master
$ git merge new-branch

```

### Compare difference between Stash and Branch Demo

```bash
# exclude file
$ git diff stash@{0} demo -- . ':(exclude)server/package-lock.json'
# include files in path
$ git diff stash@{0} demo server/src/
```

#### Pop Specific stash

```bash
$ git stash pop stash@{2}
```

## 建立“全新”分支

```bash
git checkout -orphan <NEW_BRANCH_NAME>
git rm -rf

```

 * new empty git branch


## 犯錯處理

```bash
git reflog
git reset --hard ORIG_HEAD
git reset --soft HEAD@{1}
get push -f origin 'HEAD^:master'

```

## **Squash**

## **為何 sync master to demo 常常發生奇怪的衝突？**
做了一下實驗，終於確認了正確的操作應該怎麼做：
feat-branch 進 master 時，使用 squash commits
master 進 demo 時，就不用 squash 了，否則會因此產生 master 沒有的 commit，造成下次衝突
又有關 Merge method 如何影響 git graph 的觀感:
Fast-forward merge
No merge commits are created.
Fast-forward merges only.
When there is a merge conflict, the user is given the option to rebase.
git graph 上可以看到: master/demo 會在同一條線上 (demo 追著 master 跑)
Merge commit
Every merge creates a merge commit.
git graph 上可以看到: master/demo 會在兩條平行線上
---
根據上述結果，目前將三個 repo 的 merge method 都調整成 Fast-forward merge
然後 squash commit 調成 Allow，需要自己開  MR 時打勾才會去做 squash

#### **Generate Commit Detail of a file to Output**

* [cheatsheet](https://devhints.io/git-log)
* snippet 1

  ```bash
  git log -p ./server/package.json > test.txt
  ```
* snippet 2

  ```bash
  git log -p .gitlab-ci.yml >./tmp/gitlab-ci-yml.txt
  ```


### How to handle Git Deteched HEAD

> Merge with Master

```bash
$ git log --oneline

3db89aa (HEAD) add patient_record

8aacd46 (origin/master, origin/HEAD, master) Update NIS_ORIGIN

ac7c70c update prod DB_DBNAME in Makefile

5fa0e3a check login
```

* You are in 'detached HEAD' state.
* If you want to create a new branch to retain commits

```bash
$ git switch -c <new-branch-name>
# merge with master
$ git branch master
$ git merge <new-branch-name>

Updating 8aacd46..3db89aa
Fast-forward
.vscode/launch.json   |  18 +++++++
.vscode/settings.json |   1 +
configs/gorm.go       |   4 +-
go.mod                |   1 +
go.sum                |   2 +

$ git status
$ git log --oneline

3db89aa (HEAD -> master, patient_record) add patient_record

8aacd46 (origin/master, origin/HEAD) Update NIS_ORIGIN

ac7c70c update prod DB_DBNAME in Makefile

5fa0e3a check login
```



