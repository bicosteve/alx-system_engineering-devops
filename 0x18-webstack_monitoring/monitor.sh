#!/bin/bash

# Replace these with your actual Datadog API and App keys
DD_API_KEY=""
DD_APP_KEY=""

# Hostname tag (adjust to match your instance)
HOST_TAG="host:XX-web-01"

# Create monitor for read requests per second
curl -X POST "https://api.datadoghq.com/api/v1/monitor" \
  -H "Content-Type: application/json" \
  -H "DD-API-KEY: ${DD_API_KEY}" \
  -H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
  -d '{
        "name": "High Read Requests per Second",
        "type": "metric alert",
        "query": "avg(last_5m):avg:system.io.r_s{'${HOST_TAG}'} > 100",
        "message": "Read requests per second are high on '${HOST_TAG}'",
        "tags": ["disk_io", "read_monitor"],
        "priority": 1,
        "options": {
            "thresholds": {
                "critical": 100
            },
            "notify_audit": false,
            "include_tags": true,
            "require_full_window": false,
            "notify_no_data": false,
            "renotify_interval": 0
        }
      }'

# Create monitor for write requests per second
curl -X POST "https://api.datadoghq.com/api/v1/monitor" \
  -H "Content-Type: application/json" \
  -H "DD-API-KEY: ${DD_API_KEY}" \
  -H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
  -d '{
        "name": "High Write Requests per Second",
        "type": "metric alert",
        "query": "avg(last_5m):avg:system.io.w_s{'${HOST_TAG}'} > 100",
        "message": "Write requests per second are high on '${HOST_TAG}'",
        "tags": ["disk_io", "write_monitor"],
        "priority": 1,
        "options": {
            "thresholds": {
                "critical": 100
            },
            "notify_audit": false,
            "include_tags": true,
            "require_full_window": false,
            "notify_no_data": false,
            "renotify_interval": 0
        }
      }'
