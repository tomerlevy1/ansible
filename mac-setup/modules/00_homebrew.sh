#!/usr/bin/env bash

# Homebrew installation and package management module
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/utils.sh"

# Required taps, casks, and formulae
TAPS=(
  homebrew/cask-fonts
  koekeishiya/formulae
  FelixKratz/formulae
  espanso/espanso
)
CASKS=(
  font-jetbrains-mono-nerd-font
  maccy
  karabiner-elements
)
FORMULAE=(
  commitizen
  espanso
  eza
  fnm
  fzf
  gh
  git
  jq
  lazygit
  less
  neovim
  ripgrep
  sketchybar
  skhd
  starship
  stow
  tldr
  tmux
  tree
  yabai
  yq
  z
  zsh
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
)

# Ensure Homebrew is installed
if ! command_exists brew; then
  log_error "Homebrew is not installed. Please run the Homebrew installation step first."
  exit 1
fi

# Tap required repositories
for tap in "${TAPS[@]}"; do
  if brew tap | grep -q "^$tap$"; then
    log_success "Tap already added: $tap"
  else
    log_info "Adding tap: $tap"
    brew tap "$tap"
  fi
done

# Install required casks
for cask in "${CASKS[@]}"; do
  if brew list --cask | grep -q "^$cask$"; then
    log_success "Cask already installed: $cask"
  else
    log_info "Installing cask: $cask"
    brew install --cask "$cask"
  fi
done

# Install required formulae
for formula in "${FORMULAE[@]}"; do
  if brew list | grep -q "^$formula$"; then
    log_success "Formula already installed: $formula"
  else
    log_info "Installing formula: $formula"
    brew install "$formula"
  fi
done 
