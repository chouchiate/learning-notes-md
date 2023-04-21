## [git] - Windows


1. Open git bash
2. generate sshe key
```sh
$ ssh-keygen -t ed25519 -C "your_email@example.com"
```
3. change file name
```sh
> Enter a file in which to save the key (/c/Users/YOU/.ssh/id_ALGORITHM):[Press enter]
# add passphrase
> Enter passphrase (empty for no passphrase): [Type a passphrase]
> Enter same passphrase again: [Type passphrase again]

# ssh key is saved by default at C:\SPB_Data\.ssh
```

4. start ssh-agent
```sh
# start the ssh-agent in the background
$ eval "$(ssh-agent -s)"
> Agent pid xxyyzz
```

5. add key to ssh-agent
```sh
$ ssh-add ~/.ssh/id_ed25519
```