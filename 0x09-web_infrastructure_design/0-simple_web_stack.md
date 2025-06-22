```bash
0. Simple web stack

A lot of websites are powered by simple web infrastructure, a lot of time it is composed of a single server with a LAMP stack.

On a whiteboard, design a one server web infrastructure that hosts the website that is reachable via www.foobar.com. Start your explanation by having a user wanting to access your website.

Requirements:

    You must use:
        1 server
        1 web server (Nginx)
        1 application server
        1 application files (your code base)
        1 database (MySQL)
        1 domain name foobar.com configured with a www record that points to your server IP 8.8.8.8
    You must be able to explain some specifics about this infrastructure:
        What is a server
        What is the role of the domain name
        What type of DNS record www is in www.foobar.com
        What is the role of the web server
        What is the role of the application server
        What is the role of the database
        What is the server using to communicate with the computer of the user requesting the website
    You must be able to explain what the issues are with this infrastructure:
        SPOF
        Downtime when maintenance needed (like deploying new code web server needs to be restarted)
        Cannot scale if too much incoming traffic

Please, remember that everything must be written in English to further your technical ability in a variety of settings.



Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x09-web_infrastructure_design
    File: 0-simple_web_stack



```

# Simple One-Server Web Infrastructure for `www.foobar.com`

This document outlines a basic web infrastructure design powered by a single server. It uses Nginx, an application server, a MySQL database, and a registered domain name pointing to the server's public IP.

---

## User Journey

1. A user opens their browser and visits **www.foobar.com**.
2. DNS resolves this to **8.8.8.8**, the IP address of our server.
3. The request reaches the web server (**Nginx**), which acts as a reverse proxy.
4. Nginx passes the request to the **application server**, which executes business logic.
5. The application server may interact with the **MySQL database** as needed.
6. A response is generated and sent back to the user’s browser via Nginx.

---

## Infrastructure Components

| Component                  | Role                                                                    |
| -------------------------- | ----------------------------------------------------------------------- |
| **Server**                 | A single physical/virtual machine hosting all services (Nginx, app, DB) |
| **Domain Name**            | Translates `www.foobar.com` to a machine-readable IP address            |
| **DNS Record**             | An **A record** that maps `www.foobar.com` to **8.8.8.8**               |
| **Web Server (Nginx)**     | Handles incoming HTTP(S) requests and proxies them to the app server    |
| **Application Server**     | Processes dynamic logic and serves the application code                 |
| **Application Files**      | Source code and static assets of the web application                    |
| **Database (MySQL)**       | Stores persistent, structured data                                      |
| **Communication Protocol** | Uses HTTP/HTTPS over TCP/IP to serve responses to users                 |

---

## Infrastructure Limitations

| Issue                       | Explanation                                                 |
| --------------------------- | ----------------------------------------------------------- |
| **Single Point of Failure** | The entire system fails if the only server goes down        |
| **Maintenance Downtime**    | Deployment or updates require downtime as services restart  |
| **Scalability Constraints** | Cannot handle high traffic; no load balancing or redundancy |

---
