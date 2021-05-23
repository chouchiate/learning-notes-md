Configure Synology NAS as Git Server
------------------------------------

Instructions for setting up a git server on a Synology NAS with Diskstation. Specifically, I am using a DS414 with DSM 5.0. 

### Set Up User and Folder

- Create user `gituser` via Diskstation interface (with File Station and WebDAV privilages)
- Add new shared folder called `git` (located at `/volume1/git`) with read/write access for `gituser` and `admin`. This folder will hold all the repos.
- Install Git Server package via Diskstation
- Open Git Server and allow `gituser` permissions
- Enable SSH access on Diskstation (Control Panel > Terminal & SNMP > Enable SSH Service)

### Configure SSH Access

- create `~/.ssh` folder for gituser on server

```
ssh admin@diskstation.local
mkdir /volume1/homes/gituser/.ssh
```

- copy public rsa key from local computer to gituser account on server

```
scp ~/.ssh/id_rsa.pub admin@diskstation.local:/volume1/homes/gituser/.ssh
```

- connect via SSH as `root` and rename `id_rsa.pub` to `authorized_keys` on NAS (or append if already exists, `cat id_rsa.pub >> authorized_keys`)

```
ssh root@diskstation.local
mv /volume1/homes/gituser/.ssh/id_rsa.pub /volume1/homes/gituser/.ssh/authorized_keys
```

- change permissions while logged in as root

```
cd /volume1/homes/gituser/
chown -R gituser:users .ssh
chmod 700 .ssh
chmod 644 .ssh/authorized_keys
```

### Set Up New Repo on NAS

- create bare repo as root
 
```
ssh root@diskstation.local
cd /volume1/git/
git --bare init <repo-name>.git
chown -R gituser:users <repo-name>.git
cd <repo-name>.git
git update-server-info
```

NOTE: I'm not entirely sure if `git update-server-info` must be run for each repo or just initially. It seems to work without running this command, but I'm suspcicious that it might cause problems later.

### Add NAS as Remote for Local Repo

- Clone repo from NAS

```
git clone ssh://gituser@diskstation.local/volume1/git/<repo-name>.git
```


## References

http://blog.osdev.org/git/2014/02/13/using-git-on-a-synology-nas.html
http://stackoverflow.com/questions/20074692/set-up-git-on-a-nas-with-synologys-official-package
http://www.heidilux.com/2014/02/setup-git-server-synology-nas/