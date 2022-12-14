-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode and save
keymap.set("i", "jk", "<ESC>:w<CR>")
keymap.set("n", "<D-s>", ":w<CR>")
keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("n", "Q", ":q<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "|", "<C-w>v") -- split window vertically
keymap.set("n", "-", "<C-w>s") -- split window horizontally
keymap.set("n", "<D-d>", "<C-w>v") -- split window vertically
keymap.set("n", "<D-c>", "<C-w>s") -- split window horizontally
keymap.set("n", "<D-p>", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<D-w>", ":close<CR>") -- close current split window

keymap.set("n", "<D-t>", ":tabnew<CR>") -- open new tab
keymap.set("n", "<D-t>i", ":tabn<CR>") --  go to next tab
keymap.set("n", "<D-t>p", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<D-k>", ":tabclose<CR>") -- close current tab

-- 替换方向键为调节分屏大小
keymap.set("n", "<up>", ":res -5<CR>")
keymap.set("n", "<down>", ":res +5<CR>")
keymap.set("n", "<left>", ":vertical resize+5<CR>")
keymap.set("n", "<right>", ":vertical resize-5<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Vimspector
keymap.set("n", "Db", ":call vimspector#ToggleBreakpoint()<cr>")
keymap.set("n", "Dw", ":call vimspector#AddWatch()<cr>")
keymap.set("n", "De", ":call vimspector#Evaluate()<cr>")

keymap.set("n", "<F7>", ":call vimspector#Launch()<CR>")
keymap.set("n", "<F8>", ":call vimspector#StepInto()<CR>")
keymap.set("n", "<F9>", ":call vimspector#StepOut()<CR>")
keymap.set("n", "<F10>", ":call vimspector#StepOver()<CR>")
keymap.set("n", "<F12>", ":call vimspector#Reset()<CR>")

-- vim.cmd([[
-- " nmap <F9> <cmd>call vimspector#Launch()<cr>
-- " nmap <F5> <cmd>call vimspector#StepOver()<cr>
-- " nmap <F8> <cmd>call vimspector#Reset()<cr>
-- " nmap <F11> <cmd>call vimspector#StepOver()<cr>")
-- " nmap <F12> <cmd>call vimspector#StepOut()<cr>")
-- " nmap <F10> <cmd>call vimspector#StepInto()<cr>")
-- ]])

-- Hop
keymap.set("n", "<leader>j", ":HopLine<CR>")
keymap.set("n", "mk", ":HopPattern<CR>")
keymap.set("n", "ml", ":HopWord<CR>")

-- Tagbar
keymap.set("n", "<leader>q", ":TagbarToggle<CR>")

-- diffview
keymap.set("n", "<leader>fd", ":DiffviewFileHistory<CR>")

-- lazygit
keymap.set("n", "<leader>lg", ":LazyGit<CR>")

-- minimap
keymap.set("n", "<leader>w", ":MinimapToggle<CR>")

-- neoclip
keymap.set("n", "<leader>l", ":Telescope neoclip<CR>")

-- bufferline
keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", opt)
keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", opt)

-- todotree and telescope keybindings in todotree.lua and telescope.lua
