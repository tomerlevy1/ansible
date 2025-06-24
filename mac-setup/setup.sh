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

# Discover all .sh modules in the modules directory (sorted)
MODULES_DIR="$SCRIPT_DIR/modules"
MODULE_SCRIPTS=( )
if [ -d "$MODULES_DIR" ]; then
  while IFS= read -r -d '' file; do
    MODULE_SCRIPTS+=("$file")
  done < <(find "$MODULES_DIR" -type f -name '*.sh' -print0 | sort -z)
  log_info "Discovered ${#MODULE_SCRIPTS[@]} module(s) in $MODULES_DIR."
else
  log_error "Modules directory not found: $MODULES_DIR"
fi

# Execute each module script in order
for module in "${MODULE_SCRIPTS[@]}"; do
  log_info "Running module: $(basename "$module")"
  if bash "$module"; then
    log_success "Module succeeded: $(basename "$module")"
  else
    log_error "Module failed: $(basename "$module")"
    exit 1
  fi
  echo
done

# Further logic will be added in subsequent steps. 