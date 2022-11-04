local status, floaterm = pcall(require, "floaterm")
if not status then
	return
end
local keymap = vim.keymap
-- FloaTerm configuration
keymap.set("n", "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
keymap.set("n", "t", ":FloatermToggle myfloat<CR>")
keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")
