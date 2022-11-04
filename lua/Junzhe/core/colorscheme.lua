-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, theme = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

require("monokai").setup({})
require("monokai").setup({ palette = require("monokai").pro })
require("monokai").setup({ palette = require("monokai").soda })
require("monokai").setup({ palette = require("monokai").ristretto })
