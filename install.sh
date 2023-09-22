#!/bin/bash

# Check if neovim is installed
nvim_Warning() {
    echo "Install neovim, and try again"
    exit
}

# Check if node is installed
node_Warning() {
    echo "Install node and try again"
    exit
}

# Check if git is installed
git_Warning() {
    echo "Install git and try again"
    exit
}

# Rename old nvim directory
rename_Dir() {
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    echo "Your current neovim config transfered to ~/.config/nvim.old"
    clone
}

# Clone new nvim directory
clone() {
    echo "Cloning..."
    git clone https://github.com/ye-junzhe/BetterNvim ~/.config/nvim
    nvim +PackerSync
}

# Check if neovim is installed and warn if not
which nvim >/dev/null && echo "Neovim is installed" || nvim_Warning

# Check if node is installed and warn if not
which node >/dev/null && echo "Node is installed" || node_Warning

# Check if git is installed and warn if not
which git >/dev/null && echo "Git is installed" || git_Warning

# If nvim directory exists, rename it; otherwise clone new nvim directory
[ -d "$HOME/.config/nvim" ] && rename_Dir || clone
