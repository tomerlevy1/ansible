#!/usr/bin/env bash

# Main orchestrator script for mac-setup

# Source utility functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

# Source user config if it exists
CONFIG_FILE="$SCRIPT_DIR/config.sh"
if [ -f "$CONFIG_FILE" ]; then
  source "$CONFIG_FILE"
  log_info "Loaded user config from config.sh"
fi

# Further logic will be added in subsequent steps. 