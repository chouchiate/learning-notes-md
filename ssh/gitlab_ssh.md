## Gitlab ssh setup Instructions

### Copy Key to Clipboard
```bash
  tr -d '\n' < ~/.ssh/id_ed25519.pub | pbcopy
```

### Check Connection
```bash
  ssh -T git@gitlab.xxx-yyy.zzzz
```
### Debug message
```bash
Dericks-MacBook-Pro:.ssh derickchou$ ssh -Tvvv git@gitlab.xxx-yyy.zzzz
OpenSSH_7.9p1, LibreSSL 2.7.3
debug1: Reading configuration data /Users/derickchou/.ssh/config
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 48: Applying options for *
debug1: Connecting to gitlab.smart-aging.tech port 22.
debug1: Connection established.
debug1: identity file /Users/derickchou/.ssh/id_rsa type -1
debug1: identity file /Users/derickchou/.ssh/id_rsa-cert type -1
debug1: identity file /Users/derickchou/.ssh/id_dsa type -1
debug1: identity file /Users/derickchou/.ssh/id_dsa-cert type -1
debug1: identity file /Users/derickchou/.ssh/id_ecdsa type -1
debug1: identity file /Users/derickchou/.ssh/id_ecdsa-cert type -1
debug1: identity file /Users/derickchou/.ssh/id_ed25519 type -1
debug1: identity file /Users/derickchou/.ssh/id_ed25519-cert type -1
debug1: identity file /Users/derickchou/.ssh/id_xmss type -1
debug1: identity file /Users/derickchou/.ssh/id_xmss-cert type -1
debug1: Local version string SSH-2.0-OpenSSH_7.9
debug1: Remote protocol version 2.0, remote software version OpenSSH_8.2p1 Ubuntu-4ubuntu0.2
debug1: match: OpenSSH_8.2p1 Ubuntu-4ubuntu0.2 pat OpenSSH* compat 0x04000000
debug3: fd 5 is O_NONBLOCK
debug1: Authenticating to gitlab.smart-aging.tech:22 as 'git'
debug3: hostkeys_foreach: reading file "/Users/derickchou/.ssh/known_hosts"
debug3: record_hostkey: found key type ECDSA in file /Users/derickchou/.ssh/known_hosts:1
debug3: load_hostkeys: loaded 1 keys from gitlab.smart-aging.tech
debug3: order_hostkeyalgs: prefer hostkeyalgs: ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521
debug3: send packet: type 20
debug1: SSH2_MSG_KEXINIT sent
debug3: receive packet: type 20
debug1: SSH2_MSG_KEXINIT received
debug2: local client KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256,diffie-hellman-group14-sha1,ext-info-c
debug2: host key algorithms: ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com,ssh-ed25519,rsa-sha2-512,rsa-sha2-256,ssh-rsa
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: compression ctos: none,zlib@openssh.com,zlib
debug2: compression stoc: none,zlib@openssh.com,zlib
debug2: languages ctos: 
debug2: languages stoc: 
debug2: first_kex_follows 0 
debug2: reserved 0 
debug2: peer server KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256
debug2: host key algorithms: rsa-sha2-512,rsa-sha2-256,ssh-rsa,ecdsa-sha2-nistp256,ssh-ed25519
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1
debug2: compression ctos: none,zlib@openssh.com
debug2: compression stoc: none,zlib@openssh.com
debug2: languages ctos: 
debug2: languages stoc: 
debug2: first_kex_follows 0 
debug2: reserved 0 
debug1: kex: algorithm: curve25519-sha256
debug1: kex: host key algorithm: ecdsa-sha2-nistp256
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug3: send packet: type 30
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug3: receive packet: type 31
debug1: Server host key: ecdsa-sha2-nistp256 SHA256:33NxW1pCutaNH0lNAHl6nsgxXrALsg8O/0sr4USmips
debug3: hostkeys_foreach: reading file "/Users/derickchou/.ssh/known_hosts"
debug3: record_hostkey: found key type ECDSA in file /Users/derickchou/.ssh/known_hosts:1
debug3: load_hostkeys: loaded 1 keys from gitlab.smart-aging.tech
debug3: hostkeys_foreach: reading file "/Users/derickchou/.ssh/known_hosts"
debug3: record_hostkey: found key type ECDSA in file /Users/derickchou/.ssh/known_hosts:1
debug3: load_hostkeys: loaded 1 keys from 211.22.123.212
debug1: Host 'gitlab.smart-aging.tech' is known and matches the ECDSA host key.
debug1: Found key in /Users/derickchou/.ssh/known_hosts:1
debug3: send packet: type 21
debug2: set_newkeys: mode 1
debug1: rekey after 134217728 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug3: receive packet: type 21
debug1: SSH2_MSG_NEWKEYS received
debug2: set_newkeys: mode 0
debug1: rekey after 134217728 blocks
debug1: Will attempt key: derick@zzzz.xxx RSA SHA256:VLf6RzDpqglgFGwNYH8gWBPl8WPmb1aDG/ntqFyTs7s agent
debug1: Will attempt key: /Users/derickchou/.ssh/id_rsa 
debug1: Will attempt key: /Users/derickchou/.ssh/id_dsa 
debug1: Will attempt key: /Users/derickchou/.ssh/id_ecdsa 
debug1: Will attempt key: /Users/derickchou/.ssh/id_ed25519 
debug1: Will attempt key: /Users/derickchou/.ssh/id_xmss 
debug2: pubkey_prepare: done
debug3: send packet: type 5
debug3: receive packet: type 7
debug1: SSH2_MSG_EXT_INFO received
debug1: kex_input_ext_info: server-sig-algs=<ssh-ed25519,sk-ssh-ed25519@openssh.com,ssh-rsa,rsa-sha2-256,rsa-sha2-512,ssh-dss,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-ecdsa-sha2-nistp256@openssh.com>
debug3: receive packet: type 6
debug2: service_accept: ssh-userauth
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug3: send packet: type 50
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey
debug3: start over, passed a different list publickey
debug3: preferred publickey,keyboard-interactive,password
debug3: authmethod_lookup publickey
debug3: remaining preferred: keyboard-interactive,password
debug3: authmethod_is_enabled publickey
debug1: Next authentication method: publickey
debug1: Offering public key: derick@xxxxx.zzz RSA SHA256:VLf6RzDpqglgFGwNYH8gWBPl8WPmb1aDG/ntqFyTs7s agent
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 60
debug1: Server accepts key: derick@zzzz.xxx RSA SHA256:VLf6RzDpqglgFGwNYH8gWBPl8WPmb1aDG/ntqFyTs7s agent
debug3: sign_and_send_pubkey: RSA SHA256:VLf6RzDpqglgFGwNYH8gWBPl8WPmb1aDG/ntqFyTs7s
debug3: sign_and_send_pubkey: signing using rsa-sha2-512
debug3: send packet: type 50
debug3: receive packet: type 52
debug1: Authentication succeeded (publickey).
Authenticated to gitlab.smart-aging.tech ([211.22.123.212]:22).
debug1: channel 0: new [client-session]
debug3: ssh_session2_open: channel_new: 0
debug2: channel 0: send open
debug3: send packet: type 90
debug1: Requesting no-more-sessions@openssh.com
debug3: send packet: type 80
debug1: Entering interactive session.
debug1: pledge: network
debug3: receive packet: type 80
debug1: client_input_global_request: rtype hostkeys-00@openssh.com want_reply 0
debug3: receive packet: type 4
debug1: Remote: /var/opt/gitlab/.ssh/authorized_keys:86: key options: command user-rc
debug3: receive packet: type 4
debug1: Remote: /var/opt/gitlab/.ssh/authorized_keys:86: key options: command user-rc
debug3: receive packet: type 91
debug2: channel_input_open_confirmation: channel 0: callback start
debug2: fd 5 setting TCP_NODELAY
debug3: ssh_packet_set_tos: set IP_TOS 0x20
debug2: client_session2_setup: id 0
debug1: Sending environment.
debug3: Ignored env NVM_INC
debug3: Ignored env TERM_PROGRAM
debug3: Ignored env NVM_CD_FLAGS
debug3: Ignored env TERM
debug3: Ignored env SHELL
debug3: Ignored env TMPDIR
debug3: Ignored env Apple_PubSub_Socket_Render
debug3: Ignored env TERM_PROGRAM_VERSION
debug3: Ignored env ORIGINAL_XDG_CURRENT_DESKTOP
debug3: Ignored env NVM_DIR
debug3: Ignored env USER
debug3: Ignored env COMMAND_MODE
debug3: Ignored env SSH_AUTH_SOCK
debug3: Ignored env __CF_USER_TEXT_ENCODING
debug3: Ignored env PATH
debug3: Ignored env PWD
debug1: Sending env LANG = en_US.UTF-8
debug2: channel 0: request env confirm 0
debug3: send packet: type 98
debug3: Ignored env VSCODE_GIT_ASKPASS_EXTRA_ARGS
debug3: Ignored env XPC_FLAGS
debug3: Ignored env XPC_SERVICE_NAME
debug3: Ignored env SHLVL
debug3: Ignored env HOME
debug3: Ignored env VSCODE_GIT_ASKPASS_MAIN
debug3: Ignored env APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL
debug3: Ignored env LOGNAME
debug3: Ignored env VSCODE_GIT_IPC_HANDLE
debug3: Ignored env NVM_BIN
debug3: Ignored env VSCODE_GIT_ASKPASS_NODE
debug3: Ignored env GIT_ASKPASS
debug3: Ignored env SECURITYSESSIONID
debug3: Ignored env COLORTERM
debug3: Ignored env _
debug3: Ignored env OLDPWD
debug2: channel 0: request shell confirm 1
debug3: send packet: type 98
debug2: channel_input_open_confirmation: channel 0: callback done
debug2: channel 0: open confirm rwindow 0 rmax 32768
debug2: channel 0: rcvd adjust 2097152
debug3: receive packet: type 99
debug2: channel_input_status_confirm: type 99 id 0
debug2: shell request accepted on channel 0
Welcome to GitLab, @derick.chou!
debug3: receive packet: type 98
debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
debug3: receive packet: type 98
debug1: client_input_channel_req: channel 0 rtype eow@openssh.com reply 0
debug2: channel 0: rcvd eow
debug2: channel 0: chan_shutdown_read (i0 o0 sock -1 wfd 7 efd 9 [write])
debug2: channel 0: input open -> closed
debug3: receive packet: type 96
debug2: channel 0: rcvd eof
debug2: channel 0: output open -> drain
debug2: channel 0: obuf empty
debug2: channel 0: chan_shutdown_write (i3 o1 sock -1 wfd 8 efd 9 [write])
debug2: channel 0: output drain -> closed
debug3: receive packet: type 97
debug2: channel 0: rcvd close
debug3: channel 0: will not send data after close
debug2: channel 0: almost dead
debug2: channel 0: gc: notify user
debug2: channel 0: gc: user detached
debug2: channel 0: send close
debug3: send packet: type 97
debug2: channel 0: is dead
debug2: channel 0: garbage collecting
debug1: channel 0: free: client-session, nchannels 1
debug3: channel 0: status: The following connections are open:
  #0 client-session (t4 r0 i3/0 o3/0 e[write]/0 fd -1/-1/9 sock -1 cc -1)

debug3: send packet: type 1
debug3: fd 1 is not O_NONBLOCK
Transferred: sent 2728, received 2832 bytes, in 0.1 seconds
Bytes per second: sent 29733.9, received 30867.5
debug1: Exit status 0
Dericks-MacBook-Pro:.ssh derickchou$ 
```



