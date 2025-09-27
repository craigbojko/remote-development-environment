#!/usr/bin/env bash

# Project: rpi-dev-server
# FilePath: /run.sh
# File: run.sh
# Created Date: Saturday, January 4th 2025, 4:43:07 pm
# Author: Craig Bojko
# -----
# Last Modified: Thu Sep 25 2025
# Modified By: Craig Bojko
# -----
# Copyright (c) 2025 Pixel Ventures Ltd.
# ------------------------------------
# <<licensetext>>

#!/usr/bin/env bash

environment=$1
tags=""
askVaultPass=""
shift  # Remove the first argument (environment)

if [ -z "$environment" ]; then
  echo "Usage: $0 <environment> [--key=value...]"
  echo "Example: $0 dev-server --hostname=my-host --port=9999"
  exit 1
fi

if [ ! -f "environments/$environment/playbook.yaml" ]; then
  echo "Environment '$environment' does not exist."
  exit 1
fi

echo "Arguments: $@"

# Build extra-vars from remaining arguments
extra_vars=""
for arg in "$@"; do
  # Check if argument starts with --
  if [[ $arg == --* ]]; then
    # Remove the -- prefix and add to extra vars
    key_value="${arg#--}"
    key="${key_value%%=*}"
    value="${key_value#*=}"

    # Skip if key or value is empty
    if [ -z "$key" ] || [ -z "$value" ]; then
      continue
    fi

    if [ "$key" == "tags" ]; then
      tags="--tags $value"
      continue
    fi

    extra_vars="$extra_vars --extra-vars $key=$value"
  fi
done

if [ $environment == "k3s-node" ]; then
  askVaultPass="--ask-vault-pass"
fi

## If password file exists, use it
if [ -f ./.ansible_vault_pass ]; then
  askVaultPass="--vault-password-file ./.ansible_vault_pass"
fi

echo "Running playbook for environment: $environment"
echo "With extra vars: $extra_vars"
echo "With tags: $tags"
echo "With vault option: $askVaultPass"

# Set the script directory as working directory and config path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Script directory: $SCRIPT_DIR"
cd "$SCRIPT_DIR"
export ANSIBLE_CONFIG="$SCRIPT_DIR/ansible.cfg"

ansible-playbook \
  -i hosts \
  --verbose \
  --extra-vars '@vars/defaults.yaml' \
  $extra_vars \
  $tags \
  $askVaultPass \
  environments/$environment/playbook.yaml
