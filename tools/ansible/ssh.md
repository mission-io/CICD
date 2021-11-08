# SSH


## The passwordless connection between bitbucket repo and EC2.

To generate a new SSH key pair
1. In Repository settings, go to SSH keys under ‘Pipelines’.
2. Click Generate keys to create a new SSH key pair.
3. Copy public key, and save it at a secure location
4. SSH to remote server and paste these copied public keys from step 3 at ~/.ssh/authorized_keys file
5. Add public IP in known hosts address & click on fetch

![image](https://user-images.githubusercontent.com/9244766/140699417-7bb1873d-9a29-492f-afa2-b8b3cf45dbc9.png)

Note: Use could also use parameter `host_key_checking = False` in `ansible.cfg` file
