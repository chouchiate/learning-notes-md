## Configure Synology NAS as Git Server

------------------------------------

* ssh login

  * ssh <account>@<ip address>
  * enter password

* cd /volume1/git

* create git project

  ```bash
  $ git init --bare <project>.git
  ```

----------------------------

### On Another computer

#### Clone Project via SSH

```bash
$ git clone ssh://<account>@<ip address>/volume1/git/<project>.git
```





