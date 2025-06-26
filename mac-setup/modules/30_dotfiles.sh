#!/usr/bin/env bash

# Dotfiles and Neovim configuration module
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

# Clone dotfiles repo if not present
if [ ! -d "$HOME/.dotfiles" ]; then
    log_info "Cloning dotfiles repository..."
    git clone https://github.com/tomerlevy1/.dotfiles "$HOME/.dotfiles"
    log_success "Dotfiles cloned to $HOME/.dotfiles."
else
    log_success "Dotfiles already present at $HOME/.dotfiles."
fi

# Run install.sh from within .dotfiles if it exists and is executable
if [ -x "$HOME/.dotfiles/install.sh" ]; then
    log_info "Running .dotfiles/install.sh..."
    (cd "$HOME/.dotfiles" && ./install.sh)
    if [ $? -eq 0 ]; then
        log_success ".dotfiles/install.sh executed successfully."
    else
        log_error ".dotfiles/install.sh failed."
    fi
else
    log_info ".dotfiles/install.sh not found or not executable; skipping."
fi

# Ensure ~/.config directory exists
mkdir -p "$HOME/.config"

# Clone nvim repo if not present
if [ ! -d "$HOME/.config/nvim" ]; then
    log_info "Cloning Neovim configuration repository..."
    git clone https://github.com/tomerlevy1/nvim "$HOME/.config/nvim"
    log_success "Neovim config cloned to $HOME/.config/nvim."
else
    log_success "Neovim config already present at $HOME/.config/nvim."
fi

log_info "Setting up global gitignore..."
if [ ! -d "$HOME/.gitignore_global" ]; then
    log_error ".gitignore_global file not found"
else
    git config --global core.excludesfile ~/.gitignore_global
    if [ $? -eq 0 ]; then
        log_success "Global gitignore set successfully."
    else
        log_error "Failed to set global gitignore."
    fi
fi

