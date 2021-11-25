## Git_General_Note



## 安裝

```bash
brew install git
```

## CLI 指令 

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

# 輸出差異到檔案 diff.txt
git diff master..branch1 > diff.txt
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

`
