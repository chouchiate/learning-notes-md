## Ubuntu Disable Network Manager

For Ubuntu MATE 18.04 LTS and 20.04 LTS purging network-manager package is safe. You can simply run: 

```
$ sudo apt-get purge network-manager
```

For Ubuntu 18.04 LTS and 20.04 LTS with GNOME desktop purging network-manager package will also purge ubuntu-desktop and gnome-control-center (essential part of GNOME desktop). So it is not an option.

Here you should disable NetworkManager service (as you have already done):

```
$ sudo systemctl stop NetworkManager.service
$ sudo systemctl disable NetworkManager.service
```

and three more services:

```
$ sudo systemctl stop NetworkManager-wait-online.service
$ sudo systemctl disable NetworkManager-wait-online.service

$ sudo systemctl stop NetworkManager-dispatcher.service 
$ sudo systemctl disable NetworkManager-dispatcher.service

$ sudo systemctl stop network-manager.service
$ sudo systemctl disable network-manager.service
```

and then reboot.

