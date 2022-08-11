## [aws] - IOT core walkthrough

### connect to EC2 instance
> Amazon EC2 Instance using AWS Systems Manager Session Manager.
[session manager](https://us-east-1.console.aws.amazon.com/systems-manager/session-manager/sessions?region=us-east-1)

* start a session with EC2

---
### aws iot create key and certificates

```bash
$ aws iot create-keys-and-certificate --set-as-active \
--certificate-pem-outfile certs/certificate.pem \
--public-key-outfile certs/public.key \
--private-key-outfile certs/private.key
```

* Creates the certificate and keys
* Sets the certificate and keys as active
* Outputs the contents of the * certificate and keys to ~/simulator/certs/

> Normally, you might create a certificate and policy through the AWS Console in AWS IoT Core. So that we can store the credentials for our simulator, it’s helpful and convenient to create the certificate and keys, and store them within this environment.

---
### IOT Core
* select monitor
  [path](https://us-east-1.console.aws.amazon.com/iot/home?region=us-east-1#/dashboard)
* and go to iot monitor dashboard
* shows all of the successful connections and metrics on the number of messages sent and received. Once your IoT thing is sending data, you will be able to see the active connections and metrics.

---
### check certificates generated
* left navigation pane, select Security > Certificates
    - you will see the key generated from system manager session

---
### Create Thing Type
>  left navigation pane, select Manage > All devices > Thing types.

---
### Create the Thing
>  left navigation pane, select Manage > All devices > Things.

* Select Unnamed shadow (classic)
* Select Edit shadow statement.
* Delete the code from the Edit shadow statement text box.
* Copy and paste the code snippet below into the text box.
```json
{
  "state": {
    "desired": {
      "airConditioningIsOn": false
    },
    "reported": {
      "airConditioningIsOn": false
    }
  }
}
```

* Scroll to the bottom of the screen, then select Next
* In the Configure device certificate  page, select Skip creating a certificate at this time.
* Select Create thing

---
### Attach the policy and Thing to the certificate
> In this task, you will attach the policy and thing to the certificate you created.

In the left navigation pane, select Security > Certificates.
There should be one card on the screen with the ID of your certificate.

Select  at the beginning of the ID, then select Actions menu.

Select Attach policy, then configure:

Select  ThermostatPolicy
Select Attach policies
Select  at the beginning of the ID, then select Actions menu again.

Select Attach to things, then configure:

Select  Thermostat
Select Attach to thing

---
### Create an IoT rule to send a notification

> CREATE AN SNS TOPIC [sns service](https://us-east-1.console.aws.amazon.com/sns/v3/home?region=us-east-1#/homepage)

* FIFO
    - Strictly-preserved message ordering
    - Exactly-once message delivery
    - High throughput, up to 300 - publishes/second
    - Subscription protocols: SQS
* Standard
  - Best-effort message ordering
  - At-least once message delivery
  - Highest throughput in publishes/second
  - Subscription protocols: SQS, Lambda, - HTTP, SMS, email, mobile application - endpoints


On the Services menu, select Simple Notification Services.

Instead of using the wizard that may appear on you main page, let’s create our topic using the menu on the left.

 If the menu is not visible, select the  Navigation icon in the left.

Select Topics.

Select Create topic then configure:

Type:  Standard
Name:

ThermostatNotification
Display name:

Thermostat

---
### CREATE AN IOT RULE


In the AWS Management Console, on the Services menu, select IoT Core.

In the left navigation pane, select Message Routing > Rules.

Select Create rule

In the Specify rule properties section, configure:

Rule name:

EmailRule
Rule description:

Send email when temperature > 60 AND temperature < 80
Click Next

In the Configure SQL statement section, delete the query in the SQL statement text box.

Copy and paste below query into the SQL statement text box.

```sql
SELECT * FROM 'house' WHERE temperature > 60 AND temperature < 80
```

### CONFIGURE AN ACTION TO PUBLISH TO YOUR AMAZON SNS TOPIC

> Next, set an action to publish to your Amazon SNS topic.

* In Attach rule actions page, under Rule actions section, for Action 1 form, configure:
* Choose an action: Select Simple Notification Service (SNS) option in the dropdown.
* SNS topic: Choose the topic ARN that contains ThermostatNotification
* Message format: RAW
* IAM role: iot-role
* The iot-role was created as part of the lab setup.

Click Next

In Review and create section, scroll to the bottom of the screen, then select Create

---
### Run the simulator

> Go back to your Amazon EC2 terminal session.

** You may need to reconnect to the terminal session. If so, please ensure that you are in the simulator directory. If you need to restart your session, remember to issue the command:


```bash
$ cd simulator

# This will install all of the dependencies of the application. It may take a moment to complete.
$ npm config set registry http://registry.npmjs.org/
$ npm install
# Copy and paste this command to run the simulator application:
node simulator.js

```
> Once the simulator is running, you should see the output below, with the temperature slowly increasing with each publish. Notice that the air conditioning is currently off.



---

### Create a subscription topic for your Thing and publish it

In the left navigation pane of the AWS IoT Console, select Test > MQTT test client.
This will open an MQTT test client.

In the MQTT test client window, configure:
Click Subscribe to a topic: tab and configure Topic filter: as

house
Select Subscribe

---
### Change device state with the device shadow


In the AWS IoT navigation pane, select Manage > All devices > Things.

Click Thermostat.

This will open your thing. This will provide you with details about the thing that you created, including the device shadow topics that are created by the service.

In the Thermostat navigation pane, click Device Shadows.

Click Classic Shadow.

To the right of Device Shadow document, select Edit.

This will enable you to manually update the device shadow in the Device Shadow state text box.

Delete the code in the Device Shadow state text box.

Copy and paste the code snippet below into the text box.

```json
{
  "state": {
    "desired": {
      "airConditioningIsOn": true
    }
  }
}

```
Select Update.

Return to your terminal session that is running your application.

You should see that the state on the device changed from “Air conditioning is off” to “Air conditioning is on,” and the temperature should be decreasing instead of increasing.

---
### Troubleshooting
Error: Cannot find module ‘aws-iot-device-sdk’

Error: Cannot find module ‘colors’

This error is caused by a Node.js module that was not installed. When you ran the command “npm install,” it should have installed the latest AWS IoT Device SDK. Try the following commands from the Amazon EC2 instance:
```bash
$ cd /home/ec2-user/simulator
$ npm install

```

If this doesn’t work, try removing the currently installed node modules with this command:

```bash
$ cd /home/ec2-user/simulator
$ sudo rm -rf node\_modules
$ npm install

```

Error: Invalid “keyPath” option supplied.

This error is caused by a problem loading your certificates or private keys. Ensure that your credentials were created. Run these two commands:

```bash
$ cd /home/ec2-user/simulator/certs

$ ls -al

[ec2-user@ip-10-0-1-125 simulator]$ cd ..
[ec2-user@ip-10-0-1-125 ~]$ cd /home/ec2-user/simulator/certs
[ec2-user@ip-10-0-1-125 certs]$ ls -al
total 16
drwxr-xr-x 2 ec2-user root       82 Aug 10 06:21 .
drwxr-xr-x 4 ec2-user root      123 Aug 10 07:02 ..
-rw------- 1 ec2-user ec2-user 1220 Aug 10 06:21 certificate.pem
-rw------- 1 ec2-user ec2-user 1675 Aug 10 06:21 private.key
-rw------- 1 ec2-user ec2-user  451 Aug 10 06:21 public.key
-rw-r--r-- 1 ec2-user root     1188 Aug 10 06:12 root.pem
```

You should see something like this with a certificate, private key, public key, and root-ca certificate:

1 ec2-user 1896053708 1220 Aug 8 15:07 certificate.pem 1 ec2-user 1896053708 1675 Aug 8 15:07 private.key 1 ec2-user 1896053708 451 Aug 8 15:07 public.key 1 ec2-user 1896053708 1732 Aug 8 15:07 root.pem

npm WARN enoent ENOENT: no such file or directory, open ‘/home/ec2-user/package.json’

This error simply means you are in the wrong directory when you ran the npm install command. Run these two commands:

```bash
cd /home/ec2-user/simulator

npm install

```