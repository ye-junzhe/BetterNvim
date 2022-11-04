-- FloaTerm configuration
vim.keymap.set("n", "<leader>ft", ":FloatermNew --name=myfloat<CR>") -- split window vertically
vim.keymap.set("n", "t", ":FloatermToggle myfloat<CR>") -- split window horizontally
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>") -- make split windows equal width & height
