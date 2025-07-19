#!/bin/bash


DD_SITE="datadoghq.com"
HOSTNAME="XX-web-01"

if [ -z "$DD_API_KEY" ]; then
  echo "Error: DD_API_KEY is not set"
  exit 1
fi

hostnamectl set-hostname "$HOSTNAME"

DD_API_KEY=$DD_API_KEY \
DD_SITE=$DD_SITE \
DD_REMOTE_UPDATES=true \
DD_OTEL_ENABLED=true \
bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"



