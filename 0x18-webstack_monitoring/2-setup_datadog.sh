#!/bin/bash

# Replace with your actual Datadog API and App keys
DD_API_KEY="***"
DD_APP_KEY="***"

# Create dashboard with 4 widgets
response=$(curl -s -X POST "https://api.datadoghq.com/api/v1/dashboard" \
  -H "Content-Type: application/json" \
  -H "DD-API-KEY: ${DD_API_KEY}" \
  -H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
  -d '{
    "title": "Webstack Monitoring Dashboard",
    "widgets": [
      {
        "definition": {
          "type": "timeseries",
          "requests": [
            { "q": "avg:system.cpu.user{*}", "display_type": "line" }
          ],
          "title": "CPU Usage"
        }
      },
      {
        "definition": {
          "type": "timeseries",
          "requests": [
            { "q": "avg:system.mem.used{*}", "display_type": "line" }
          ],
          "title": "Memory Usage"
        }
      },
      {
        "definition": {
          "type": "timeseries",
          "requests": [
            { "q": "avg:system.io.r_s{*}", "display_type": "line" }
          ],
          "title": "Disk Read Requests"
        }
      },
      {
        "definition": {
          "type": "timeseries",
          "requests": [
            { "q": "avg:system.io.w_s{*}", "display_type": "line" }
          ],
          "title": "Disk Write Requests"
        }
      }
    ],
    "layout_type": "ordered"
  }')

# Extract dashboard ID
dashboard_id=$(echo "$response" | jq -r '.id')

# Save to answer file
mkdir -p 0x18-webstack_monitoring
echo "$dashboard_id" > 0x18-webstack_monitoring/2-setup_datadog
