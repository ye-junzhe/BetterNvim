# BetterNvim

This repo is to setup a modern IDE for coding in neovim **(Mainly for macOS, if run on windows, needs some modifications ([see Usage](https://github.com/ye-junzhe/BetterNvim#usage)))**

With more than 60 plugins installed:
([see here](https://github.com/ye-junzhe/BetterNvim#usage))

Still developing, so there are many commented out lines for future adjustment

- VSCode-like Auto-completion setup
- Mason for native neovim LSP management
- treesitter for highlighting
- bufferline, lualine, nvim-tree, navic, noice, vimspector, todotree
- colortheme: catppuccin
- specially setup for Rust development
- [Neovide](https://neovide.dev/) is recommended
- The `<leader>` key has been changed to `<space>`

## Usage

Most Keybindings at [keymaps.lua](https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/core/keymaps.lua)

The rest of the settings are in the corresponding lua file of the plugin

`<D->` means `Command` on macOS, and it only works in neovide, changes needed if running on windows
