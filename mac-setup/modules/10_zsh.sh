#!/usr/bin/env bash

# Zsh installation module (non-interactive)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

# Ensure Zsh is installed
if ! command_exists zsh; then
  log_info "Installing Zsh..."
  if command_exists brew; then
    brew install zsh
  else
    log_error "Homebrew is not installed. Cannot install Zsh."
    exit 1
  fi
else
  log_success "Zsh is already installed."
fi 