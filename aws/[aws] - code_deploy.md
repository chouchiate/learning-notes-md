## [aws] - code deployment

> This lab introduces you to AWS CodeDeploy. In this lab you will use AWS CodeDeploy to deploy an application to an Amazon EC2 instance.


### topics
* Verify that the CodeDeploy agent has been installed.
* Configure application source content to be deployed to CodeDeploy.
* Create an Amazon S3 bucket, then * upload a WordPress application to the bucket.
* Deploy a WordPress application to an * Amazon EC2 instance.
* Monitor a WordPress application * deployment.
* Update a WordPress application and then redeploy it.


```bash
$ sudo service codedeploy-agent status

###
/home/ec2-user
[ec2-user@ip-10-200-10-152 ~]$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              2
On-line CPU(s) list: 0,1
Thread(s) per core:  2
Core(s) per socket:  1
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               85
Model name:          Intel(R) Xeon(R) Platinum 8259CL CPU @ 2.50GHz
Stepping:            7
CPU MHz:             2500.000
BogoMIPS:            5000.00
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
L3 cache:            36608K
NUMA node0 CPU(s):   0,1
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16crdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx avx512f avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves ida arat pku ospke
[ec2-user@ip-10-200-10-152 ~]$ sudo service codedeploy-agent status
The AWS CodeDeploy agent is running as PID 2684
```

### CHECK YOUR SECURITY GROUPS
* At the top of the AWS Management Console, in the search bar, search for and choose
```
EC2
```

* In the left navigation pane, click Security Groups.

* Select CodeDeploySG.

* Click the Inbound rules tab.

---
### Configure your application source content
8 Configure your source application content to be deployed.
* Create scripts that will run when your application is deployed.
* Create a CodeDeploy AppSpec file.

### DOWNLOAD THE WORDPRESS CODE
* Copy the WordPress source code to your Linux instance.

```bash
[ec2-user@ip-10-200-10-152 ~]$ wget https://s3-us-west-2.amazonaws.com/us-west-2-aws-training/courses/spl-82/v1.4.5.prod-cc2c4a3a/scripts/WordPress-master.zip
--2022-08-10 07:27:11--  https://s3-us-west-2.amazonaws.com/us-west-2-aws-training/courses/spl-82/v1.4.5.prod-cc2c4a3a/scripts/WordPress-master.zip
Resolving s3-us-west-2.amazonaws.com (s3-us-west-2.amazonaws.com)... 52.218.169.200
Connecting to s3-us-west-2.amazonaws.com (s3-us-west-2.amazonaws.com)|52.218.169.200|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 13373728 (13M) [application/zip]
Saving to: ‘WordPress-master.zip’

100%[===========================================================================================================================>] 13,373,728  20.7MB/s   in 0.6s

2022-08-10 07:27:12 (20.7 MB/s) - ‘WordPress-master.zip’ saved [13373728/13373728]

[ec2-user@ip-10-200-10-152 ~]$
```

* Unpack the master .zip file into the /tmp/WordPress_Temp folder.

```bash
unzip WordPress-master.zip -d /tmp/WordPress_Temp


```

* Create a WordPress destination folder.

```bash
mkdir -p /tmp/WordPress
```
* Copy its unzipped contents to the /tmp/WordPress destination folder.
*
```bash
cp -paf /tmp/WordPress_Temp/WordPress-master/* /tmp/WordPress
```

* Create an install_dependencies.sh script by running:
```bash
nano /tmp/WordPress/scripts/install_dependencies.sh
#!/bin/bash
yum install -y httpd php mariadb-server php-mysqlnd

```
* make scripts executable
```bash
chmod +x /tmp/WordPress/scripts/*
```
* list scripts
```bash
ls -la /tmp/WordPress/scripts
```

---

### CREATE A CODEDEPLOY APPSPEC FILE

* Map the source files in your application revision to their destinations on the target Amazon EC2 instance.
* Specify custom permissions for deployed files.
* Specify scripts to be run on the target Amazon EC2 instance during the deployment.

* Create an application specific file in /tmp/WordPress.
```bash
nano /tmp/WordPress/appspec.yml
```
* Add the following text to your appspec.yml file, then save it.
```yml
version: 0.0
os: linux
files:
  - source: /
    destination: /var/www/html/WordPress
hooks:
  BeforeInstall:
    - location: scripts/install_dependencies.sh
      timeout: 300
      runas: root
  AfterInstall:
    - location: scripts/change_permissions.sh
      timeout: 300
      runas: root
  ApplicationStart:
    - location: scripts/start_server.sh
    - location: scripts/create_test_db.sh
      timeout: 300
      runas: root
  ApplicationStop:
    - location: scripts/stop_server.sh
      timeout: 300
      runas: root

```

---
### create codedeploy application

* Create an Amazon S3 bucket to host your application source content.
* Upload your application source content to your Amazon S3 bucket.
* Deploy your WordPress application to an instance running in your environment named CodeDeploy.

```bash
aws deploy create-application --application-name WordPress_App
```


In AWS Systems Manager - Session manager tab (session instance cli), create an S3 bucket by:
Pasting

aws s3 mb s3://codedeploybucketNUMBER
Replacing NUMBER with a random number
Pressing ENTER

```bash
[ec2-user@ip-10-200-10-152 ~]$ aws s3 mb s3://codedeploybucket123456
make_bucket failed: s3://codedeploybucket123456 An error occurred (BucketAlreadyExists) when calling the CreateBucket operation: The requested bucket name is not available. The bucket namespace is shared by all users of the system. Please select a different name and try again.
[ec2-user@ip-10-200-10-152 ~]$ aws s3 mb s3://codedeploybucket129292
make_bucket: codedeploybucket129292
```


### UPLOAD YOUR WORDPRESS APPLICATION TO AMAZON S3
* Replace BUCKET with your bucket name.

* Copy and paste the updated push command into your AWS System Manager Session Manager terminal session.

* Press Enter.

```bash
aws deploy push --application-name WordPress_App --description "This is a revision for the application WordPress_App" --ignore-hidden-files --s3-location s3://codedeploybucket129292/WordPressApp.zip --source .

### this is my bucket name codedeploybucket129292
```

**command does the followings:**
* Associates the bundled files with an application named WordPress_App.
* Attaches a description to the revision.
* Ignores hidden files.
* Names the revision WordPressApp.zip and pushes it to a bucket your bucket.
* Bundles all files in the root directory into the revision.

### results
```bash
[ec2-user@ip-10-200-10-152 ~]$ aws s3 mb s3://codedeploybucket129292
make_bucket: codedeploybucket129292
[ec2-user@ip-10-200-10-152 ~]$ cd /tmp/WordPress
[ec2-user@ip-10-200-10-152 WordPress]$ ls
appspec.yml  readme.html      wp-admin              wp-config-sample.php  wp-includes        wp-login.php     wp-signup.php
index.php    scripts          wp-blog-header.php    wp-content            wp-links-opml.php  wp-mail.php      wp-trackback.php
license.txt  wp-activate.php  wp-comments-post.php  wp-cron.php           wp-load.php        wp-settings.php  xmlrpc.php
[ec2-user@ip-10-200-10-152 WordPress]$ aws deploy push --application-name WordPress_App --description "This is a revision for the application WordPress_App" --ignore-hidden-files --s3-location s3://129292/WordPressApp.zip --source .

Failed to upload '.' to 's3://129292/WordPressApp.zip': An error occurred (NoSuchBucket) when calling the CreateMultipartUpload operation: The specified bucket doesnot exist
[ec2-user@ip-10-200-10-152 WordPress]$ aws deploy push --application-name WordPress_App --description "This is a revision for the application WordPress_App" --ignore-hidden-files --s3-location s3://codedeploybucket129292/WordPressApp.zip --source .
To deploy with this revision, run:
aws deploy create-deployment --application-name WordPress_App --s3-location bucket=codedeploybucket129292,key=WordPressApp.zip,bundleType=zip,eTag=ba8e6f68e153dd9d00bfce01b07a4a69-3 --deployment-group-name <deployment-group-name> --deployment-config-name <deployment-config-name> --description <description>
[ec2-user@ip-10-200-10-152 WordPress]$
```

### DEPLOY YOUR APPLICATION
* Paste the following create-deployment-group command into your text editor.
```bash
### my arn: arn:aws:iam::521526911560:role/codedeploy-service-role
aws deploy create-deployment-group --application-name WordPress_App --deployment-config-name CodeDeployDefault.AllAtOnce --deployment-group-name WordPress_DG --ec2-tag-filters Key=Name,Value=CodeDeploy,Type=KEY_AND_VALUE --service-role-arn arn:aws:iam::521526911560:role/codedeploy-service-role

```
* Replace ROLE with the value of CodeDeployRoleARN located to the left of these instructions.

* Copy and paste the updated create-deployment-group command into your terminal session.

* Press Enter.

### result
```bash
To deploy with this revision, run:
aws deploy create-deployment --application-name WordPress_App --s3-location bucket=codedeploybucket129292,key=WordPressApp.zip,bundleType=zip,eTag=ba8e6f68e153dd9d00bfce01b07a4a69-3 --deployment-group-name <deployment-group-name> --deployment-config-name <deployment-config-name> --description <description>
[ec2-user@ip-10-200-10-152 WordPress]$ aws deploy create-deployment-group --application-name WordPress_App --deployment-config-name CodeDeployDefault.AllAtOnce --deployment-group-name WordPress_DG --ec2-tag-filters Key=Name,Value=CodeDeploy,Type=KEY_AND_VALUE --service-role-arn arn:aws:iam::521526911560:role/codedeploy-service-role
{
    "deploymentGroupId": "2525807b-db4c-4ac1-abc4-2b827a37f228"
}
[ec2-user@ip-10-200-10-152 WordPress]$

## This creates your CodeDeploy deployment group.
```

> In an EC2/On-Premises deployment, a deployment group is a set of individual instances targeted for a deployment. A deployment group contains individually tagged instances, Amazon EC2 instances in Amazon EC2 Auto Scaling groups, or both. In an AWS Lambda deployment, a deployment group defines a set of AWS CodeDeploy configurations for future serverless Lambda deployment to the group.

### Paste the following create-deployment command into your text editor.

```bash
aws deploy create-deployment --application-name WordPress_App --s3-location bucket=codedeploybucket129292,key=WordPressApp.zip,bundleType=zip --deployment-group-name WordPress_DG  --description "This is a revision for the application WordPress_App"
```
* Replace BUCKET with your bucket name.

* Copy and paste the updated create-deployment command into your terminal session.

* Press Enter.

### result
```bash
[ec2-user@ip-10-200-10-152 WordPress]$ aws deploy create-deployment --application-name WordPress_App --s3-location bucket=codedeploybucket129292,key=WordPressApp.zip,bundleType=zip --deployment-group-name WordPress_DG  --description "This is a revision for the application WordPress_App"
{
    "deploymentId": "d-YRVOWLYEI"
}
[ec2-user@ip-10-200-10-152 WordPress]$

## This will deploy your WordPress application.
```

### Monitor your deployment

> AWS provides various tools that you can use to monitor AWS CodeDeploy. You can configure some of these tools to do the monitoring for you, while some of the tools require manual intervention. We recommend that you automate monitoring tasks as much as possible.

* Amazon CloudWatch Alarms – Watch a single metric over a time period that you specify, and perform one or more actions based on the value of the metric relative to a given threshold over a number of time periods. The action is a notification sent to an Amazon Simple Notification Service (Amazon SNS) topic or *
* Amazon EC2 Auto Scaling policy. CloudWatch alarms do not invoke actions simply because they are in a particular state; the state must have changed and been maintained for a specified number of periods.
* Amazon CloudWatch Events - Match events and route them to one or more target functions or streams to make changes, capture state information, and take corrective action.
* AWS CloudTrail Log Monitoring - Share log files between accounts, monitor CloudTrail log files in real time by sending them to CloudWatch Logs, write log processing applications in Java, and validate that your log files have not changed after delivery by CloudTrail.
* Amazon Simple Notification Service - Configure event-driven triggers to receive SMS or email notifications about deployment and instance events, such as success or failure.

