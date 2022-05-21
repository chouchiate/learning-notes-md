## [windows] - powershell notes

### SSH
*  Use ssh-agent to securely store the private keys within a Windows security context, associated with your Windows login. 
* Start the ssh-agent service as Administrator and use ssh-add to store the private key.

```powershell
# By default the ssh-agent service is disabled. Allow it to be manually started for the next step to work.
# Make sure you're running as an Administrator.
Get-Service ssh-agent | Set-Service -StartupType Manual

# Start the service
Start-Service ssh-agent

# This should return a status of Running
Get-Service ssh-agent

# Now load your key files into ssh-agent
ssh-add ~\.ssh\id_ed25519
```