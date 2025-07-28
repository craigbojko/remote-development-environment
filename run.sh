#!/usr/bin/env bash

# Project: rpi-dev-server
# FilePath: /run.sh
# File: run.sh
# Created Date: Saturday, January 4th 2025, 4:43:07 pm
# Author: Craig Bojko
# -----
# Last Modified: Tue Jul 15 2025
# Modified By: Craig Bojko
# -----
# Copyright (c) 2025 Pixel Ventures Ltd.
# ------------------------------------
# <<licensetext>>

# Run ansible playbook with all vars files

ansible-playbook \
  -i hosts \
  --extra-vars "@vars/remote-user.yaml" \
  --extra-vars "@vars/resilio.yaml" \
  --extra-vars "@vars/oh-my-zsh.yaml" \
  --verbose \
  playbook.yaml
