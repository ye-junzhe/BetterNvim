-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, background = pcall(vim.cmd, "set background=dark")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

local status, theme = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

vim.cmd([[ 
syntax enable
set background=dark
colorscheme gruvbox
]])

-- require("monokai").setup({})
-- require("monokai").setup({ palette = require("monokai").pro })
-- require("monokai").setup({ palette = require("monokai").soda })
-- require("monokai").setup({ palette = require("monokai").ristretto })
