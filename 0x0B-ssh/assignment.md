```bash
    General
    What is a server
    Where servers usually live
    What is SSH
    How to create an SSH RSA key pair
    How to connect to a remote host using an SSH RSA key pair
    The advantage of using #!/usr/bin/env bash instead of /bin/bash


    Allowed editors: vi, vim, emacs
    All your files will be interpreted on Ubuntu 20.04 LTS
    All your files should end with a new line
    A README.md file, at the root of the folder of the project, is mandatory
    All your Bash script files must be executable
    The first line of all your Bash scripts should be exactly #!/usr/bin/env bash
    The second line of all your Bash scripts should be a comment explaining what is the script doing
```

```bash
0. Use a private key

Write a Bash script that uses ssh to connect to your server using the private key ~/.ssh/school with the user ubuntu.

Requirements:
    Only use ssh single-character flags
    You cannot use -l
    You do not need to handle the case of a private key protected by a passphrase
    All your files should end with a new line

Answer
ssh -i ~/.ssh/school ubuntu@41.90.211.195

Explanation:
    -i specifies the identity (private key) file.

    ubuntu@your_server_ip uses the syntax where ubuntu is the user (instead of using -l ubuntu).



Repo:
    GitHub repository: alx-system_engineering-devops
    Directory: 0x0B-ssh
    File: 0-use_a_private_key
```

```bash
1. Create an SSH key pair

Write a Bash script that creates an RSA key pair.

Requirements:

    Name of the created private key must be school
    Number of bits in the created key to be created 4096
    The created key must be protected by the passphrase betty
    All your files should end with a new line

Answer
ssh-keygen -t rsa -b 4096 -f school -N "betty"

Breakdown:

    -t rsa: Specifies RSA as the key type.

    -b 4096: Sets the key size to 4096 bits.

    -f school: Names the private key file school (the public key will be school.pub).

    -N "betty": Sets the passphrase for the key to betty.

chmod +x 1-create_ssh_key_pair # makes it executable


Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x0B-ssh
    File: 1-create_ssh_key_pair
```

```bash
2. Client configuration file
mandatory

Your machine has an SSH configuration file for the local SSH client, let’s configure it to our needs so that you can connect to a server without typing a password. Share your SSH client configuration in your answer file.

Requirements:
    Your SSH client configuration must be configured to use the private key ~/.ssh/school
    Your SSH client configuration must be configured to refuse to authenticate using a password
    All your files should end with a new line


Explanation
Host gcp-node02
    HostName bix-node02
    User bico
    IdentityFile ~/.ssh/school
    PasswordAuthentication no

chmod 600 ~/.ssh/config # security reasons

Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x0B-ssh
    File: 2-ssh_config
```

```bash
3. Let me in!

Now that you have successfully connected to your server, we would also like to join the party.

Add the SSH public key below to your server so that we can connect using the ubuntu user.
All your files should end with a new line


Steps

# Create user
sudo adduser bico

# Create the .ssh dir for user
sudo mkdir -p /home/bico/.ssh
sudo chmod 700 /home/bico/.ssh
sudo chown bico:bico /home/bico/.ssh

# copy the public keys to the server
ssh-copy-id -i ~/.ssh/school.pub bico@bix-node-01


chmod 700 /home/bico/.ssh
chmod 600 /home/bico/.ssh/authorized_keys
chown -R bico:bico /home/bico/.ssh

ssh -i ~/.ssh/school bico@bix-node-01


Repo:
    GitHub repository: alx-system_engineering-devops
    Directory: 0x0B-ssh
```

```bash
4. Client configuration file (w/ Puppet)

Let’s practice using Puppet to make changes to our configuration file. Just as in the previous configuration file task, we’d like you to set up your client SSH configuration file so that you can connect to a server without typing a password.

Requirements:

    Your SSH client configuration must be configured to use the private key ~/.ssh/school
    Your SSH client configuration must be configured to refuse to authenticate using a
    All your files should end with a new line

Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x0B-ssh
    File: 100-puppet_ssh_config.pp

```
