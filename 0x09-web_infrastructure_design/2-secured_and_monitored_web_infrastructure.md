```bash
2. Secured and monitored web infrastructure.

On a whiteboard, design a three server web infrastructure that hosts the website www.foobar.com, it must be secured, serve encrypted traffic, and be monitored.

Requirements:

    You must add:
        3 firewalls
        1 SSL certificate to serve www.foobar.com over HTTPS
        3 monitoring clients (data collector for Sumologic or other monitoring services)
    You must be able to explain some specifics about this infrastructure:
        For every additional element, why you are adding it
        What are firewalls for
        Why is the traffic served over HTTPS
        What monitoring is used for
        How the monitoring tool is collecting data
        Explain what to do if you want to monitor your web server QPS
    You must be able to explain what the issues are with this infrastructure:
        Why terminating SSL at the load balancer level is an issue
        Why having only one MySQL server capable of accepting writes is an issue
        Why having servers with all the same components (database, web server and application server) might be a problem

Please, remember that everything must be written in English to further your technical ability in a variety of settings.



Repo:

    GitHub repository: alx-system_engineering-devops
    Directory: 0x09-web_infrastructure_design
    File: 2-secured_and_monitored_web_infrastructure
```

---

# Secured and Monitored Web Infrastructure for `www.foobar.com`

This document presents a secure and observable three-server web infrastructure built to host `www.foobar.com` over HTTPS, defend against network threats using firewalls, and provide real-time monitoring for system health and performance.

## Infrastructure Overview

A user accesses `www.foobar.com` via their browser. The request is resolved by DNS to the IP of a load balancer (HAProxy) that listens over HTTPS. This load balancer routes requests to one of two backend application servers, each serving content using Nginx and your application code. These backend servers communicate with a MySQL database. Every server includes a firewall for traffic filtering and a monitoring agent that reports telemetry to a centralized system.

## Security Components

The load balancer has an SSL certificate installed to terminate HTTPS connections from users. This enables secure, encrypted communication and ensures that traffic can't be easily intercepted or tampered with in transit. Serving content over HTTPS also builds user trust and boosts SEO rankings.

Each of the three servers—load balancer, app servers, and database server—has its own firewall. These firewalls are configured to allow only necessary traffic through. For example, the load balancer only accepts traffic on port 443 (HTTPS), the app servers only accept requests from the load balancer, and the database only accepts connections from the app servers. This sharply limits the attack surface.

## Monitoring and Observability

Every server runs a monitoring agent. These agents collect system metrics like CPU usage, memory consumption, disk I/O, and network traffic. They also harvest logs from services like Nginx, HAProxy, and MySQL. Collected data is pushed or scraped by a centralized monitoring solution like Sumologic, Prometheus, or Datadog for analysis and visualization.

To monitor queries per second (QPS) on the Nginx web server, you can enable the `stub_status` module. This provides metrics like the number of current connections and total requests served. These can be scraped periodically, and QPS can be calculated and plotted on dashboards to monitor traffic trends and performance.

## Infrastructure Weaknesses

One limitation of this setup is that SSL termination happens at the load balancer. That means traffic between the load balancer and the backend servers might be unencrypted unless you re-encrypt it internally using mutual TLS or SSL passthrough. Otherwise, sensitive data could be intercepted if the internal network is compromised.

Another issue is that the database has only a single writable MySQL node. This creates a bottleneck. If that node goes down, all write operations fail. You’d need to introduce replication and automatic failover to improve availability and write scalability.

Lastly, if every server includes all components—Nginx, app code, and a database instance—it introduces tight coupling. It becomes harder to scale or isolate problems. Ideally, roles should be separated across services: databases on dedicated machines, stateless app servers behind the load balancer, and a fault-tolerant storage layer.

## Summary

This infrastructure improves significantly on earlier versions by encrypting traffic, protecting network boundaries, and collecting rich telemetry for visibility. To take it further, you can add redundancy for your load balancer and database, re-encrypt internal traffic, and adopt role-based service separation.
