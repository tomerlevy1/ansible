#!/usr/bin/env bash

# Homebrew installation module
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

if command_exists brew; then
  log_success "Homebrew is already installed."
  exit 0
fi

log_info "Installing Homebrew..."
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if command_exists brew; then
  log_success "Homebrew installation successful."
else
  log_error "Homebrew installation failed."
  exit 1
fi 