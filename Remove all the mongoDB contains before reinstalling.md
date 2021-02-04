Remove all the mongoDB contains before reinstalling

1. Check to see if any mongo service is running

```
launchctl list | grep mongo
```

2. Unload from LaunchAgents

```
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plistrm -f ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plistlaunchctl remove homebrew.mxcl.mongodb
```

3. Kill all the processes related to mongod

```
pkill -f mongod
```

4. Uninstall the mongodb

```
# If installed via brewbrew uninstall mongodb  # If installed manually you can simply delete the folderrm -rf <mongodb_folder>
```

5. Re-confirming if mongo related file still exists

```
ls -al /usr/local/bin/mong*ls -al ~/Library/LaunchAgents
```

6. If you have separate folder for db

```
rm -rf /usr/local/var/mongodbrm -rf /data/db
```