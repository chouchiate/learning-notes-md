## Git_General_Note

### Discard local and fetch from remote master

```bash
$ git fetch --all
## login 
$ git reset --hard origin/<branch_name>
```

### Revert One Commit

```bash
$ git revert HEAD -m 1
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

### Branch Develop then Merge to Main

```bash
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

