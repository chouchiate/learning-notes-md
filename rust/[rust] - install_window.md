## [rust] - Window OS Installation


```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

* --proto <protocol>
  - Tells curl to limit what protocols it may use for transfers. 
```bash
# For example:

--proto -ftps # uses the default protocols, but disables ftps
--proto -all,https,+http only # enables http and https
--proto =http,https also only # enables http and https
```

```bash

# To get started you may need to restart your current shell.
# This would reload your PATH environment variable to include
# Cargo's bin directory ($HOME/.cargo/bin).

# To configure your current shell, run:
source "$HOME/.cargo/env"



echo $HOME
/home/dxxxxcxxx????

# Windows file system is located at /mnt/c in the Bash shell environment.
```

