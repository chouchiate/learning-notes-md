## How to handle Git Deteched HEAD

### Merge with Master

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



