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

This repo is to setup a modern IDE for coding in neovim **(Windows and Linux not tested)**

With more than 70 plugins installed

Still developing, so there are many commented out lines for future adjustment

- VSCode-like Auto-completion setup
- Mason for native neovim LSP management
- treesitter for highlighting
- Plugins: Lspsaga, bufferline, lualine, nvim-tree, vimspector, todotree ...
- colorscheme : catppuccin
- **[Neovide](https://neovide.dev/) recommended**
- Font recommend: [JetBrainsMono](https://www.jetbrains.com/lp/mono/) Nerd Font Mono

## Installation

- ### Please install [Oh My Zsh](https://ohmyz.sh/#install:~:text=sh%20%2Dc%20%22%24(curl%20%2DfsSL%20https%3A//raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)%22) and [p10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh:~:text=troubleshooting%20for%20help.-,Oh%20My%20Zsh,-Clone%20the%20repository) first

### Automatically

To **Install** NeoVim run this command:
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

### Tagbar

Tagbar requires [ctags](https://github.com/preservim/tagbar#:~:text=example%20gutentags.-,Dependencies,-Vim%20%3E%3D%207.3.1058%20or) to work, modify this line in [options.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/core/options.lua)

```
vim.g.tagbar_ctags_bin = "/path/to/ctags/bin"
```

## Plugins and Lsps and Highlighting

### Plugins

### ***The most important***

- `:w` => In [plugins-setup.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/plugins-setup.lua) to write the file and auto update neovim plugins
- Remember to call `:MasonUpdate` first time entering neovim, else there won't be any packages showing in the Mason panel
- Be sure to install Meslo font to show icons properly (If you are using iTerm2, just install [oh my zsh](https://github.com/ohmyzsh/ohmyzsh), and follow the instructions)

### Lsps

- `:Mason` => Install Lsps(g? for help)
- All configs in [this folder](https://github.com/ye-junzhe/BetterNvim/tree/master/lua/Junzhe/plugins/lsp)
- special setup for Rust development
- I write C/C++ code a lot so I have special clangd setup as well, you can also modify it freely in this [file](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/plugins/lsp/lspconfig.lua)
  
### Syntax highlighting

- `:TSInstall` => Install tree-sitter highlighting for specific language
- Configs in [treesitter.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/plugins/treesitter.lua)

```

## Keybindings 🎥

Most Keybindings at [keymaps.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/core/keymaps.lua)

The rest of the settings are in the corresponding lua file of the plugin

`<D->` = `Command` on macOS, and it only works in neovide

**The `<leader>` key has been changed to `<space>`**
# Basic
<leader>e => File explorer(g? for help)
<leader>q => Tagbar
<leader>r => Todo-Tree
<leader>lg => Lazygit
<leader>w => Code minimap

# Telescope
<leader>ff => File search
<leader>fr => Recent file search
<leader>fw => Word search in current buffer
<leader>fs => Word search in all files

# Lspsaga
gh => Hover doc
gd => Definition(In definition window, o/i => edit)
gf => Find definition and references
<leader>o => show symbols(silimar to tagbar)
<leader>a => Code actions
<leader>t => Terminal
<leader>dw => Work space diagnostics
<leader>db => Buf diagnostics

# Bufferline
Shift+h => Switch left
Shift+l => Switch right
ctrl+w => Close buffer

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
mn, mp => Navigate
ma => Show all
```
