#!/usr/bin/env bash

# Interactive setup script for mac-setup
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

log_info "Starting interactive setup..."

# Interactive Zsh default shell change
if command_exists zsh; then
  CURRENT_SHELL=$(dscl . -read ~ UserShell | awk '{print $2}')
  ZSH_PATH="$(command -v zsh)"
  if [ "$CURRENT_SHELL" != "$ZSH_PATH" ]; then
    log_info "Changing your default shell to Zsh. You may be prompted for your password."
    if ! grep -q "$ZSH_PATH" /etc/shells; then
      log_info "Adding $ZSH_PATH to /etc/shells (requires sudo)..."
      echo "$ZSH_PATH" | sudo tee -a /etc/shells
    fi
    chsh -s "$ZSH_PATH"
    log_success "Default shell changed to Zsh. Please restart your terminal."
  else
    log_success "Zsh is already your default shell."
  fi
else
  log_error "Zsh is not installed. Please run the unattended setup first."
  exit 1
fi

# Add more interactive steps here as needed (e.g., SSH key generation) 