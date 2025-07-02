# alx-system_engineering-devops

```bash
alias ls='rm *'
```

It creates an alias that replaces the ls command with rm \*, meaning every time you run ls, it deletes all files in the current directory instead of listing them.

```bash
    echo "hello $(whoami)"
```

Returns the logged in user

```bash
    export PATH="$PATH:/action"
```

This command modifies the PATH environment variable by appending /action to the existing search paths.

```bash
    echo $PATH | tr ':' '\n' | grep -v '^$' | wc -l
```

echo $PATH – Prints the current PATH variable.

tr ':' '\n' – Converts colons (:) into new lines, effectively splitting the PATH into separate directories.

grep -v '^$' – Removes empty lines (in case there are consecutive colons like ::::).

wc -l – Counts the number of lines, which represents the number of directories.

```bash
    printenv
    env
```

Prints all the environment variables

```bash
    echo "=== Environment Variables ==="
    printenv

    echo -e "\n=== Local Variables ==="
    set

    echo -e "\n=== Functions ==="
    declare -F
```

printenv – Lists environment variables.

set – Lists all shell variables, including local and environment variables.

declare -F – Lists defined functions in the current shell session.

```bash
    #!/bin/bash

    BEST="School"
    echo "BEST is set to: $BEST"


```

BEST="School" – Defines a new local variable named BEST with the value "School".

echo "BEST is set to: $BEST" – Prints the variable to confirm it's set.

```bash
    #!/bin/bash
    export BEST="School"
    echo "BEST is globally set to: $BEST"
```

export BEST="School" – Makes BEST a global variable, meaning it remains available in the current shell and any subprocesses.
echo "BEST is globally set to: $BEST" – Confirms the variable was set.

```bash
    #!/bin/bash
    echo $((128 + TRUEKNOWLEDGE))
```

$((128 + TRUEKNOWLEDGE)) – Performs arithmetic addition using the value of TRUEKNOWLEDGE.
echo – Prints the result to the terminal.

```bash
    #!/bin/bash
    echo $((POWER / DIVIDE))
```

$((POWER / DIVIDE)) – Performs arithmetic division using values from POWER and DIVIDE.
echo – Prints the result to the terminal.

```bash
    #!/bin/bash
    echo "$BREATH^$LOVE" | bc
```

$BREATH^$LOVE – Performs exponentiation (BREATH raised to LOVE).
bc – A command-line calculator that evaluates the expression.

```bash
    #!/bin/bash
    echo "ibase=2; $BINARY" | bc
```

ibase=2; $BINARY – Tells bc that the input ($BINARY) is in base 2.
bc – Converts the binary number to base 10 and outputs the result.

```bash
    #!/bin/bash
    echo {a..z}{a..z} | tr ' ' '\n' | grep -v '^oo$'

```

{a..z}{a..z} – Expands to all possible two-letter combinations.
tr ' ' '\n' – Converts spaces into new lines for formatted output.
grep -v '^oo$' – Filters out "oo" from the list.

```bash
    #!/bin/bash
    printf "%.2f\n" "$NUM"
```

%.2f – Formats the number as a floating-point with two decimal places.
"$NUM" – Uses the value stored in the NUM environment variable.
\n – Ensures the output ends with a new line.

## 0x0C. Web server

```bash
0. Transfer a file to your server

Write a Bash script that transfers a file from our client to a server:

Requirements:
    Accepts 4 parameters
    The path to the file to be transferred
    The IP of the server we want to transfer the file to
    The username scp connects with
    The path to the SSH private key that scp uses
    Must end with a new line
    Must be executable
    Display Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY if less than 3 parameters passed
    scp must transfer the file to the user home directory ~/
    Strict host key checking must be disabled when using scp
```

```bash
1. Install nginx web server

Readme:

    -y on apt-get command

Web servers are the piece of software generating and serving HTML pages, let’s install one!

Requirements:
    Write shell script to;
    Install nginx on your web-01 server
    Nginx should be listening on port 80
    When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string Hello World!
    As an answer file, write a Bash script that configures a new Ubuntu machine to respect above requirements (this script will be run on the server itself)
    You can’t use systemctl for restarting nginx

In this example 34.198.248.145 is the IP of my web-01 server. If you want to query the Nginx that is locally installed on your server, you can use curl 127.0.0.1.

If things are not going as expected, make sure to check out Nginx logs, they can be found in /var/log/.

Maarten’s PRO-tip: When you use sudo su on your web-01 you can become root like this to test your file:

```

```bash
2. Setup a domain name

.TECH --> https://get.tech/ Domains is one of the top domain providers. They are known for the stability and quality of their DNS hosting solution. We partnered with .TECH Domains so that you can learn about DNS.

YOU can have a free .tech domain for 1 year by following these steps:

    Access the tools space
    Unlock the GitHub student pack: WARNING - this invitation link is unique to you and can’t be reclaimed! If you have any issue, please contact GitHub education support


    The cost of the domain should be now at $0
    You can finalize it by creating an account in .Tech domains
    And manage your domain there!

Provide the domain name in your answer file.

Requirement:

    provide the domain name only (example: foobar.tech), no subdomain (example: www.foobar.tech)
    configure your DNS records with an A entry so that your root domain points to your web-01 IP address Warning: the propagation of your records can take time (~1-2 hours)
    go to your profile and enter your domain in the Project website url field
```

```bash
3. Redirection

Readme:

Replace a line with multiple lines with sed

Configure your Nginx server so that /redirect_me is redirecting to another page.

Requirements:

    The redirection must be a “301 Moved Permanently”
    You answer file should be a Bash script containing commands to automatically configure a Ubuntu machine to respect above requirements
    Using what you did with 1-install_nginx_web_server, write 3-redirection so that it configures a brand new Ubuntu machine to the requirements asked in this task



Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x0C-web_server
    File: 3-redirection

```

```bash
4. Not found page 404

Configure your Nginx server to have a custom 404 page that contains the string Ceci n'est pas une page.

Requirements:

    The page must return an HTTP 404 error code
    The page must contain the string Ceci n'est pas une page
    Using what you did with 3-redirection, write 4-not_found_page_404 so that it configures a brand new Ubuntu machine to the requirements asked in this task

```

```bash
5. Install Nginx web server (w/ Puppet)

Time to practice configuring your server with Puppet! Just as you did before, we’d like you to install and configure an Nginx server using Puppet instead of Bash. To save time and effort, you should also include resources in your manifest to perform a 301 redirect when querying /redirect_me.

Requirements:

    Nginx should be listening on port 80
    When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string Hello World!
    The redirection must be a “301 Moved Permanently”
    Your answer file should be a Puppet manifest containing commands to automatically configure an Ubuntu machine to respect above requirements
```

## 0x0F. Load balancer

```bash
0. Double the number of webservers

In this first task you need to configure web-02 to be identical to web-01. Fortunately, you built a Bash script during your web server project, and they’ll now come in handy to easily configure web-02. Remember, always try to automate your work!

Since we’re placing our web servers behind a load balancer for this project, we want to add a custom Nginx response header. The goal here is to be able to track which web server is answering our HTTP requests, to understand and track the way a load balancer works. More in the coming tasks.

### server-one --> 1268749-web-01

### server-two --> 1268749-web-02

### loadbalancer --> 1268749-lb-01

Requirements:

    Configure Nginx so that its HTTP response contains a custom header (on 1268749-web-01 and 1268749-web-02)
        The name of the custom HTTP header must be X-Served-By
        The value of the custom HTTP header must be the hostname of the server Nginx is running on
    Write 0-custom_http_response_header so that it configures a brand new Ubuntu machine to the requirements asked in this task
        Ignore SC2154 for shellcheck



Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x0F-load_balancer
    File: 0-custom_http_response_header

```

### server-one --> 1268749-web-01

### server-two --> 1268749-web-02

### loadbalancer --> 1268749-lb-01

```bash

1. Install your load balancer

Install and configure HAproxy on your 1268749-lb-01 server.

Requirements:

    Configure HAproxy so that it send traffic to web-01 and web-02
    Distribute requests using a roundrobin algorithm
    Make sure that HAproxy can be managed via an init script
    Make sure that your servers are configured with the right hostnames: 1268749-web-01 and 1268749-web-02. If not, follow this tutorial.
    For your answer file, write a Bash script that configures a new Ubuntu machine to respect above requirements



Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x0F-load_balancer
    File: 1-install_load_balancer

```

```bash
2. Add a custom HTTP header with Puppet

Just as in task 0, we’d like you to automate the task of creating a custom HTTP header response, but with Puppet.

    The name of the custom HTTP header must be X-Served-By
    The value of the custom HTTP header must be the hostname of the server Nginx is running on
    Write 2-puppet_custom_http_response_header.pp so that it configures a brand new Ubuntu machine to the requirements asked in this task



Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x0F-load_balancer
    File: 2-puppet_custom_http_response_header.pp

```
