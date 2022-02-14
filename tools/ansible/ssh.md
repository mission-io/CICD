# SSH

## SSH Configuration in Contal Plane Machine
1. Install SSH Client
2. Install `pywinrm` if the target OS is windows
3. 
## SSH Connection in the target VM

1. Open the port `22` and port HTTP: 5985, HTTPS: `5986` (5985, `5986` for WinRM) in target windows OS firewall 
    Configure [WinRM](https://www.visualstudiogeeks.com/devops/how-to-configure-winrm-for-https-manually) if the target machine is Windows
2. Open the port `22` and port HTTP: 5985, HTTPS: `5986` (5985, `5986` for WinRM) in Cloud Provider `Security Group` / `Networking`.
3. Install the `OpenSSH` in target OS
4. Run the `OpenSSH` service in the target OS
5. connect using `ssh username@hostname`. Ex. ssh `admin@192.168.0.1` (or) `ssh -i key.pem username@hostname`
6. To Allow Unencrypted Password do the following command (Not Recomended)
```shell
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
```
 7. 

## The passwordless connection between bitbucket repo and EC2.

To generate a new SSH key pair
1. In Repository settings, go to SSH keys under ‘Pipelines’.
2. Click Generate keys to create a new SSH key pair.
3. Copy public key, and save it at a secure location
4. SSH to remote server and paste these copied public keys from step 3 at ~/.ssh/authorized_keys file
5. Add public IP in known hosts address & click on fetch

![image](https://user-images.githubusercontent.com/9244766/140699417-7bb1873d-9a29-492f-afa2-b8b3cf45dbc9.png)

Note: Use could also use parameter `host_key_checking = False` in `ansible.cfg` file
