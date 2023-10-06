-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode and save
-- keymap.set("i", "jk", "<ESC>:w<CR>")
keymap.set("n", "<D-s>", ":w<CR>")
keymap.set("n", "W", ":w<CR>")
keymap.set("n", "Q", ":q<CR>")

-- ctrl+w or cmd+w to close the buffer
keymap.set("n", "<C-w>", ":bdelete<CR>")
keymap.set("n", "<D-w>", ":bdelete<CR>")

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

-- adjust the split window
keymap.set("n", "<up>", ":res -5<CR>")
keymap.set("n", "<down>", ":res +5<CR>")
keymap.set("n", "<right>", ":vertical resize+5<CR>")
keymap.set("n", "<left>", ":vertical resize-5<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- Tagbar
keymap.set("n", "<leader>q", ":TagbarToggle<CR>")

-- diffview
keymap.set("n", "<leader>fd", ":DiffviewFileHistory<CR>")

-- lazygit
keymap.set("n", "<leader>lg", ":LazyGit<CR>")

-- open register
vim.keymap.set("n", "<leader>fg", ":registers<CR>")
