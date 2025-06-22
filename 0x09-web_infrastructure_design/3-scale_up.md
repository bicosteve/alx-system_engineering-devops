```bash
3. Scale up

    Application server vs web server

Requirements:

    You must add:
        1 server
        1 load-balancer (HAproxy) configured as cluster with the other one
        Split components (web server, application server, database) with their own server
    You must be able to explain some specifics about this infrastructure:
        For every additional element, why you are adding it

Please, remember that everything must be written in English to further your technical ability in a variety of settings.



Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x09-web_infrastructure_design
    File: 3-scale_up


```

# Scaled Web Infrastructure for `www.foobar.com`

This document describes a scale-up of our distributed web architecture to improve high availability, separation of concerns, and horizontal scalability. Components are now decoupled and deployed on dedicated servers.

---

## Why Scale Up?

Scaling vertically (adding resources to one machine) reaches limits. So we scale horizontally by distributing components across separate servers and introducing redundancy, enabling smoother performance under load and better fault isolation.

---

## Key Additions and Their Purpose

### 1. Additional Server

We are adding a **fourth server** to split the previously shared components. Now each critical role—**web server**, **application server**, and **database**—has its own machine. This improves resource management and isolates failures.

### 2. HAProxy Cluster Configuration

We now have **two HAProxy load balancers** in an **active-passive cluster**. One HAProxy acts as the primary, and the second monitors it with a heartbeat mechanism. If the primary fails, the passive node is promoted automatically.

- This eliminates the load balancer as a single point of failure.
- Clustering ensures high availability at the entry point of our infrastructure.

### 3. Split Component Architecture

Each major function now runs on a separate server:

- **Web Server (Nginx)**: Receives HTTP/HTTPS requests, serves static assets, and proxies dynamic requests.
- **Application Server**: Handles backend logic using a framework (e.g., Django, Flask, or Go server).
- **Database Server**: Hosts MySQL as the centralized data store. Reads/writes come only from the app server.

This separation allows for independent scaling. For instance, if app logic becomes CPU-intensive, we can replicate and load balance app servers without affecting database performance.

---

## Web Server vs Application Server

- **Web Server** (e.g., Nginx):

  - Handles client HTTP/HTTPS requests
  - Serves static files (CSS, JS, images)
  - Forwards dynamic content requests to the application server

- **Application Server** (e.g., Gunicorn, uWSGI, Go binary):
  - Executes backend logic
  - Processes user input, handles sessions, communicates with the database
  - Returns dynamic content (HTML, JSON) to the web server

The web server is the gateway; the app server is the brain.

---

## Summary

By adding:

- One more **dedicated server**
- A **clustered HAProxy** setup
- And splitting **web**, **app**, and **database** concerns

We unlock a more fault-tolerant, scalable architecture. This modularity allows us to grow independently by component and avoid noisy neighbor problems in resource contention.
