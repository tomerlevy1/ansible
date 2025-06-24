#!/usr/bin/env bash

# Zsh configuration module
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
fi

# Set Zsh as the default shell if not already
if [ "$SHELL" != "$(command -v zsh)" ]; then
  log_info "Setting Zsh as the default shell..."
  chsh -s "$(command -v zsh)"
  log_success "Zsh is now the default shell."
else
  log_success "Zsh is already the default shell."
fi 