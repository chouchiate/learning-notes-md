## [aws] - Working with AWS CodeCommit

* Create a code repository using AWS CodeCommit via the Amazon Management Console
* Create a local code repository on the Linux instance using git
* Synchronize a local repository with an AWS CodeCommit repository

### Create an AWS CodeCommit repository
* At the top of the AWS Management Console, in the search bar, search for and choose CodeCommit .
* On the AWS CodeCommit page, choose Create repository.
* On the Create repository page:
* For Repository name, enter My-Repo.
* For Description enter: My first repository.
* Choose Create.

### Connect to the Amazon EC2 instance
```bash
cd $HOME; pwd; bash
sh-4.2$ cd $HOME; pwd; bash
/home/ec2-user
[ec2-user@ip-10-1-12-79 ~]$ lscup
bash: lscup: command not found
[ec2-user@ip-10-1-12-79 ~]$ lscpu
```

### Create a local repository using Git
* install git

```bash
sudo yum install -y git
```

### configure aws credential helper
```bash
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

```