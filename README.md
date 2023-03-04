<div align="center">
 <h1> BetterNvim </h1>
 <p align="center">
     <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/ye-junzhe/BetterNvim?color=A6E3A1">
     <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/ye-junzhe/BetterNvim?color=A6E3A1">
     <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/ye-junzhe/BetterNvim?color=%2300007C&logoColor=%2300007C">
</p>
 <a href="https://github.com/ye-junzhe/BetterNvim/#Installation">📦 Installation</a>
</div>

## Preview

![BetterNvim Dashboard](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Dashboard.png?raw=true)
![BetterNvim Demo](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Coding.png?raw=true)
![BetterNvim Coding1](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Coding1.png?raw=true)
![BetterNvim Term](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Term.png?raw=true)

## Introduction

This repo is to setup a modern IDE for coding in neovim **(Mainly for macOS, if run on windows, needs some modifications ([see here](https://github.com/ye-junzhe/BetterNvim#:~:text=%3CD%2D%3E%20%3D%20Command%20on%20macOS%2C%20and%20it%20only%20works%20in%20neovide%2C%20changes%20needed%20if%20running%20on%20windows)))**

With more than 70 plugins installed

Still developing, so there are many commented out lines for future adjustment

- VSCode-like Auto-completion setup
- Mason for native neovim LSP management
- treesitter for highlighting
- Plugins: bufferline, lualine, nvim-tree, navic, noice, vimspector, todotree ...
- colorscheme : catppuccin
- special setup for Rust development
- **[Neovide](https://neovide.dev/) HIGHLY recommended**

## Installation

### Automatically

To **Install** neovim run this command:
(make sure you have git and bash installed before running)

```bash
curl -s https://raw.githubusercontent.com/ye-junzhe/BetterNvim/master/install.sh | bash -s
```

### Manual

Install it manually by:

**Optional**: Backup existing nvim config

```bash
mv $HOME/.config/nvim $HOME/.config/nvim.old
```

**Mandatory**

1. Cloning the repository

```bash
git clone https://github.com/ye-junzhe/BetterNvim.git $HOME/.config/nvim
```

2. Installing the Plugins

```bash
nvim +PackerSync
```

### Keybindings 🎥

Most Keybindings at [keymaps.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/core/keymaps.lua)

The rest of the settings are in the corresponding lua file of the plugin

`<D->` = `Command` on macOS, and it only works in neovide, changes needed if running on windows

**The `<leader>` key has been changed to `<space>`**

```
# Basic
<leader>e => File explorer
<leader>ff => File search
<leader>s => Word search
<leader>w => Code minimap
<leader>q => Tagbar
<leader>r => Todo-Tree
<leader>lg => Lazygit

# Lspsaga
gh => Hover doc
gd => Definition
gf => Find definition and references
<leader>a => Code actions

# Bufferline
Shift+h => Switch left
Shift+l => Switch right
ctrl+w => Close buffer

# Float terminal
t => Terminal

# Navigation
ctrl + h/j/k/l => navigate windows

# Hop
<leader>j => jump lines
ml => jump words

# Save and quit
ctrl + s => Save
Q => quit

# Bookmark
mm => Create and delete
mi => Add annotation
mc => Clear bookmarks
mx => Clear in all buffers
mn, mp => Navigate
ma => Show all
```
