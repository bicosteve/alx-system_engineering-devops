```bash
1. Distributed web infrastructure

On a whiteboard, design a three server web infrastructure that hosts the website www.foobar.com.

Requirements:

    You must add:
        2 servers
        1 web server (Nginx)
        1 application server
        1 load-balancer (HAproxy)
        1 set of application files (your code base)
        1 database (MySQL)
    You must be able to explain some specifics about this infrastructure:
        For every additional element, why you are adding it
        What distribution algorithm your load balancer is configured with and how it works
        Is your load-balancer enabling an Active-Active or Active-Passive setup, explain the difference between both
        How a database Primary-Replica (Master-Slave) cluster works
        What is the difference between the Primary node and the Replica node in regard to the application
    You must be able to explain what the issues are with this infrastructure:
        Where are SPOF
        Security issues (no firewall, no HTTPS)
        No monitoring

Please, remember that everything must be written in English to further your technical ability in a variety of settings.


Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x09-web_infrastructure_design
    File: 1-distributed_web_infrastructure


```

# Distributed Web Infrastructure for `www.foobar.com`

This document describes a scalable three-server web infrastructure for hosting `www.foobar.com`, leveraging a load balancer, two application servers, and a MySQL database.

---

## Request Flow

1. User enters **www.foobar.com** in the browser.
2. DNS resolves it to the load balancer’s IP (e.g., 8.8.8.8).
3. The **HAProxy** load balancer distributes the request to one of two backend servers.
4. Each backend includes **Nginx + application code** to process requests.
5. If needed, the backend queries the **MySQL** database and returns a response.

---

## Components Breakdown

| Component                  | Role                                                |
| -------------------------- | --------------------------------------------------- |
| **Server 1**               | Runs **HAProxy** to balance traffic                 |
| **Server 2**               | Hosts **Nginx + App Server 1**                      |
| **Server 3**               | Hosts **Nginx + App Server 2 + MySQL (Primary DB)** |
| **Domain Name (A Record)** | Points `www.foobar.com` to Server 1's IP            |

---

## Load Balancing Details

- **HAProxy Algorithm**: `Round Robin`
- **How It Works**: Each incoming request is forwarded to the next available server in sequence.
- **Setup Type**: _Active-Active_ — Both app servers are actively serving requests.

### Active-Active vs. Active-Passive

- **Active-Active**: All servers actively serve traffic, improving throughput and resilience.
- **Active-Passive**: One server is idle, acting as a failover backup only.

---

## Database: Primary-Replica Architecture

### How It Works

- **Primary (Master)**: Handles all `write` operations (INSERT/UPDATE/DELETE) and can optionally handle `read` queries.
- **Replica (Slave)**: Passively receives updates from the primary and serves `read-only` queries to reduce load.

### Application Viewpoint

- All **writes** go to the **Primary**
- **Reads** can be split between Primary and Replica with appropriate routing logic or middleware

---

## Infrastructure Issues

| Issue                              | Description                                                        |
| ---------------------------------- | ------------------------------------------------------------------ |
| **Single Point of Failure (SPOF)** | HAProxy is a SPOF; no redundancy here                              |
| **Security Risks**                 | Lacks HTTPS encryption and firewall protection                     |
| **No Monitoring**                  | No observability tools to detect issues or gather performance data |

---

## Summary

This infrastructure offers better fault tolerance and traffic management than a single-server setup.
