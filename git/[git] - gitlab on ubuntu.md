## [git] - Host Gitlab server on Ubuntu

[url](https://www.snel.com/support/how-to-create-your-own-gitlab-server-on-ubuntu-18-04/)

### Pre-requisites
* non-root sudo user
* basic firewall
* 2 CPU core with > 8GB RAM

1. Install Dependencies
```bash
$ sudo apt update
$ sudo apt install ca-certificates curl openssh-server ufw apt-transport-https -y

# to send notification e-mails
$ sudo apt install postfix -y
```

2. Configure Firewall
```bash
$ sudo ufw allow OpenSSH
# It is safe now to enable the firewall. Just enter y when presented with the prompt.

$ sudo ufw enable
# We need to enable http, https, and Postfix for Gitlab to operate.

$ sudo ufw allow http
$ sudo ufw allow https
$ sudo ufw allow Postfix
# We need to check the status that everything is working fine.

$ sudo ufw status
You should see the following output which will tell you everything is working fine.
```

### Add repo and install Gitlab
```bash
$ curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
# Install the Gitlab CE package. Replace example.github.com with the domain you will be using for your Gitlab install.

# If you want Gitlab to automatically install an HTTPS certificate for you using Let’s Encrypt, choose https in the command below. If you want to use your certificate or don’t want to use https, use HTTP below.

$ sudo EXTERNAL_URL="https://gitlab-server.example.com" apt-get install gitlab-ee
```


### Resource

[hardware req](https://docs.gitlab.com/ee/install/requirements.html#hardware-requirements)