I had the same error and I fixed it by removing the process pid file:

```bash
rm -f /usr/local/var/postgres/postmaster.pid
```