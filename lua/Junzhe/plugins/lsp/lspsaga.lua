-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
		keys = {
			tabe = "o",
			edit = "i",
		},
	},
	ui = {
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
		code_action = "",
	},
	symbol_in_winbar = {
		separator = "  ",
		respect_root = true,
	},
})
