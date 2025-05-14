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
![BetterNvim Coding](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Coding.png?raw=true)
![BetterNvim HoverDoc](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/HoverDoc.png?raw=true)
![BetterNvim Errors](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Errors.png?raw=true)
![BetterNvim FloatTerm](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/FloatTerm.png?raw=true)

<!--toc:start-->
- [Preview](#preview)
- [Introduction](#introduction)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Glyphs](#glyphs)
  - [Optional: Backup existing nvim config](#optional-backup-existing-nvim-config)
  - [Clone the repository](#clone-the-repository)
- [Plugins and Lsps and Highlighting](#plugins-and-lsps-and-highlighting)
  - [Plugins](#plugins)
  - [**Initialization**](#initialization)
  - [Lsps](#lsps)
  - [Syntax highlighting](#syntax-highlighting)
- [Keybindings 🎥](#keybindings-🎥)
  - [Basic](#basic)
<!--toc:end-->

## Introduction

This repo is to setup a modern IDE style coding experience in Neovim.

- Supported OS
    - macOS(Tested on the latest macOS)
    - GNU/Linux(Tested on Debian 12 Bookworm)
    - Windows Subsystem for Linux(Tested on WSL Ubuntu)

- Features:
    - VSCode-like Auto-completion setup
    - Plugin Manager: [Lazy.nvim](https://github.com/folke/lazy.nvim)
    - Mason for native Neovim LSP management
    - Tree-sitter for syntax highlighting
    - Plugins: Lspsaga, Barbar, Lualine, Nvim-tree, Nvim-cmp, Todotree, Neogit ...
    - **[Neovide](https://neovide.dev/) recommended** for much smoother GUI animation

## Installation

### Prerequisites

- Neovim >= 0.10.0
- CMake
- Make
- fzf
- ripgrep
- fd-find
- node
- python3
- tree-sitter-cli (Linux)

### Glyphs

To show glyphs properly, please install Nerd Fonts first, and set your terminal to use it

- https://www.nerdfonts.com/

### Optional: Backup existing nvim config

```bash
mv $HOME/.config/nvim $HOME/.config/nvim.old
```

### Clone the repository

```bash
git clone --depth 1 https://github.com/ye-junzhe/BetterNvim.git $HOME/.config/nvim
```

### Additional step for Linux

If Neovim on your machine is compiled from source, set a hard link to /usr/bin, for sudoers to find it

```
ln /path/to/nvim /usr/bin/nvim
```

## Plugins and Lsps and Highlighting

### Plugins

### **Initialization**

- Enter `:Lazy`, then press `U` to update all the plugins
- Enter `:MasonUpdate` else there won't be any packages showing in the Mason panel
- Enter `TSUpdate` to update all Tree-sitter parsers

### Lsps

- `:Mason` => Install Lsps(g? for help)
- All configs in [this folder](./lua/Junzhe/plugins/lsp/)
- Mainly focusing on Rust development

### Syntax highlighting

- `:TSInstall` => Install Tree-sitter highlighting for specific language
- Configs in [treesitter.lua](./lua/Junzhe/plugins/nvim-treesitter.lua)

## Keybindings 🎥

Keybindings at [keymaps.lua](./lua/Junzhe/core/keymaps.lua)
And the rest of are in the corresponding *.lua file of the plugin

`<D->` = `Command` on macOS

**The `<leader>` key has been changed to `<space>`**

### Basic

```bash
<leader>e => nvim-tree (g? for help)
i => Change directory
I => Chanege to the parent folder
o => Unfold
O => Fold

# Telescope
<leader>ff => File search
<leader>fr => Recent file search
<leader>fw => Word search in current buffer
<leader>fs => Word search in all files
<leader>ft => Todo-Tree

# Lspsaga
gh => Hover doc
gd => Definition(In definition window, o/i => edit)
gf => Find definition and references
<leader>oo => show symbols(silimar to tagbar)
<leader>a => Code actions
<leader>t(open)/tt(close) || ctrl-t => Float Term
<leader>dw => Work space diagnostics
<leader>db => Buf diagnostics

# Barbar
Shift+h => Switch left
Shift+l => Switch right
Shift+f => Switch buffer forword
Shift+b => Switch buffer backword
mp => BufferPick
ctrl-p => BufferPin
ctrl-c => BufferCloseAllButCurrentOrPinned

# Navigation
ctrl + h/j/k/l => navigate windows

# Hop
<leader>j => jump lines
ml => jump words

# Save and quit
W => Save
Q => Quit

# Bookmark
mm => Create and delete
mi => Add annotation
mc => Clear bookmarks
mx => Clear in all buffers
mn => Next bookmark
ma => Show all

# Neogit(Magit clone for Neovim)
<leader>gg => Open Neogit
```
