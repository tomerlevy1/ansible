# Ansible

This repo is used to store playbooks for my MacOS installation.
This is heavily inspired by [Jeff Geerling's MacOS playbook](https://github.com/geerlingguy/mac-dev-playbook) and [ThePrimeagen's Ansible playbook](https://github.com/ThePrimeagen/ansible).
  
## Installation

Clone this repository:

```bash
git clone https://github.com/tomerlevy1/ansible.git
```

Install Ansible and Homebrew:

```bash
./install_ansible
```

Start the installation process:

```bash
./ansible_run
```

## Usage

I can run the following command to install all the applications I need:

```bash
# TODO: Add the command to run the playbook
ansible-playbook main.yml
```

## Testing

Using [https://github.com/cirruslabs/tart](Tart)

This will download an image and run it as a container.
```bash
tart clone ghcr.io/cirruslabs/macos-sonoma-base:latest sonoma-base
tart run sonoma-base
```

To "restart" the VM (start fresh) we need to delete it and then clone & run it once more.
```bash
tart delete sonoma-base
```

## Applications & Tools

- [x] Homebrew
- [x] Git
- [x] Alacritty
- [x] Zsh
- [x] NeoVim
- [ ] Oh My Zsh
- [ ] Node.js
- [ ] .dotfiles
- [ ] Docker
- [ ] Google Chrome
- [ ] Firefox

### Homebrew Taps

- [x] homebrew/cask-fonts
- [x] koekeishiya/formulae
- [x] ngrok/ngrok
- [x] FelixKratz/formulae

### Homebrew Casks

- [x] font-jetbrains-mono-nerd-font
- [x] ngrok
- [x] maccy
- [x] alacritty
- [x] karabiner-elements

### Homebrew Formulae

- [x] tmux
- [x] jq
- [x] ripgrep
- [x] lazygit
- [x] git
- [x] stow
- [x] fnm
- [x] tldr
- [x] z
- [x] neovim
- [x] fzf
- [x] yabai
- [x] skhd
- [x] zsh
- [x] zsh-history-substring-search
- [x] commitizen
- [x] sketchybar
- [x] less
- [x] starship
- [x] tree
- [x] zsh-autosuggestions
- [x] zsh-syntax-highlighting

## TODO: 
- [ ] yabai and skhd: need to start the services
- [ ] need to create bin and tmux folders 
- [x] replace colorls with eza
- [ ] oh my zsh did not install
- [ ] zsh plugins did not work
- [ ] need to setup ssh for github
- [ ] dotfiles - clone and setup
- [ ] NeoVim setup with dotfiles
- [ ] gcc@11 brew
- [ ] lua brew
- [ ] maven brew 
- [ ] Docker
- [ ] 
- [ ] 
- [ ] 
- [ ] 
- [ ] 
- [ ] 

### TODO Homebrew 
- diff-so-fancy
- fd
- gcc@12
- gnu-sed
- go
- gradle
- luarocks
- maven
- thefuck
- tidy-html5
