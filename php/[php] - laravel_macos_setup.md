# [php] - Laravel MacOS setup

## check php version
```bash
php -v
```

## Brew Link Issue
* Issue Message
```bash
$brew link --overwrite php@7.4        

Error: The `brew link` step did not complete successfully
Linking /usr/local/Cellar/php@7.4/7.4.33_1... 
Error: Could not symlink sbin/php-fpm
/usr/local/sbin is not writable.
```

### Solution
* create directory sbin
```bash
$ sudo mkdir /usr/local/sbin
```

* change owner
```bash
$ sudo chown -R $(whoami) $(brew --prefix)/sbin
```

* try linking again
```bash
brew link --overwrite php@7.4                
Linking /usr/local/Cellar/php@7.4/7.4.33_1... 25 symlinks created.
```

## Install Sail
```bash
$ composer require laravel/sail --dev
```
## Add sail to PATH
```bash
$ alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
```

## start and stop sail
```bash
$ sail up

# start in background
$ sail up -d

# stop sail
$ sail stop
```


## external info
* [multiple php version](https://getgrav.org/blog/macos-ventura-apache-multiple-php-versions)
* [version update](https://wpbeaches.com/updating-to-php-versions-7-4-and-8-on-macos-11-big-sur-and-catalina/)
* [stack-overflow](https://stackoverflow.com/questions/46778133/brew-link-php71-could-not-symlink-sbin-php-fpm)