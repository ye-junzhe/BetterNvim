<div align="center">
 <h1> BetterNvim </h1>
 <a href="https://github.com/ye-junzhe/BetterNvim/#Installation">📦 Installation</a>
</div>

## Preview

![BetterNvim Dashboard](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Dashboard.png?raw=true)
![BetterNvim Demo](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Coding.png?raw=true)
![BetterNvim with other apps](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/pic/Desktop.png?raw=true)

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
- The `<leader>` key has been changed to `<space>`

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

Most Keybindings at [keymaps.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/core/keymaps.lua)

The rest of the settings are in the corresponding lua file of the plugin

`<D->` = `Command` on macOS, and it only works in neovide, changes needed if running on windows

### Demo 🎥
- Start screen
  ![Start screen](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/Start.gif?raw=true)
- Mason
  ![Mason](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/Mason.gif?raw=true)
- Treesitter
  ![Treesitter](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/Treesitter.gif?raw=true)
- LSPSaga
  ![LSPSaga](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/LSPSaga.gif?raw=true)
- Telescope
  ![Telescope](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/Telescope.gif?raw=true)
- Switch tabs(Bufferline)
  ![Switch tabs](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/Bufferline.gif?raw=true)
- Minimap
  ![Switch tabs](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/Minimap.gif?raw=true)
- Tagbar
  ![Tagbar](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/Tagbar.gif?raw=true)
- Todo-Tree
  ![Todotree](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/TodoTree.gif?raw=true)
- Hop
  ![Hop](https://github.com/ye-junzhe/Images/blob/main/BetterNvim/video/Hop.gif?raw=true)
- **and so many other features...**
