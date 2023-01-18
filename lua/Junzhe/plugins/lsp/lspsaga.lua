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
	},
	ui = {
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		colors = { normal_bg = "#1E1E2E" },
	},
	symbol_in_winbar = {
		separator = "  ",
	},
})
