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

<!--toc:start-->
- [Preview](#preview)
- [Introduction](#introduction)
- [Installation](#installation)
  - [To show glyphs properly, please install nerdfonts first](#to-show-glyphs-properly-please-install-nerdfonts-first)
  - [Optional: Backup existing nvim config](#optional-backup-existing-nvim-config)
  - [Clone the repository](#clone-the-repository)
- [Plugins and Lsps and Highlighting](#plugins-and-lsps-and-highlighting)
  - [Plugins](#plugins)
  - [***The most important***](#the-most-important)
  - [Lsps](#lsps)
  - [Syntax highlighting](#syntax-highlighting)
- [Keybindings 🎥](#keybindings-🎥)
<!--toc:end-->

## Introduction

This repo is to setup a modern IDE for coding in neovim **(Works on both macOS and Linux)**

- VSCode-like Auto-completion setup
- Plugin Manager: [Lazy.nvim](https://github.com/folke/lazy.nvim)
- Mason for native neovim LSP management
- Tree-sitter for highlighting
- Plugins: Lspsaga, Barbar, Lualine, Nvim-tree, Nvim-cmp, Todotree, Neogit ...
- **[Neovide](https://neovide.dev/) recommended**
- Font recommend: [JetBrainsMono](https://www.jetbrains.com/lp/mono/) Nerd Font Mono

## Installation

### To show glyphs properly, please install nerdfonts first

- https://www.nerdfonts.com/

### Optional: Backup existing nvim config

```bash
mv $HOME/.config/nvim $HOME/.config/nvim.old
```

### Clone the repository

```bash
git clone --depth 1 https://github.com/ye-junzhe/BetterNvim.git $HOME/.config/nvim
```

- **IF ON LINUX**

```bash
git clone --depth 1 https://github.com/ye-junzhe/BetterNvim.git -b linux $HOME/.config/nvim
```

## Plugins and Lsps and Highlighting

### Plugins

### ***The most important***

- Call `:Lazy` the first time you open nvim, and then press `U` to update all the plugins
- Remember to call `:MasonUpdate` first time entering neovim, else there won't be any packages showing in the Mason panel

### Lsps

- `:Mason` => Install Lsps(g? for help)
- All configs in [this folder](https://github.com/ye-junzhe/BetterNvim/tree/master/lua/Junzhe/plugins/lsp)
- special setup for Rust development using rust-tools

### Syntax highlighting

- `:TSInstall` => Install Tree-sitter highlighting for specific language
- Configs in [treesitter.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/plugins/treesitter.lua)

## Keybindings 🎥

Keybindings at [keymaps.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/core/keymaps.lua)
And the rest of are in the corresponding *.lua file of the plugin

`<D->` = `Command` on macOS

**The `<leader>` key has been changed to `<space>`**

# Basic

```bash
<leader>e => nvim-tree (g? for help)

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
<leader>t => Terminal
<leader>dw => Work space diagnostics
<leader>db => Buf diagnostics

# Barbar
Shift+h => Switch left
Shift+l => Switch right
mp => BufferPick
ctrl-p => BufferCloseAllButCurrentOrPinned

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
