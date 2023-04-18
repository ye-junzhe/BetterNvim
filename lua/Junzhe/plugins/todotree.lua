local status, todotree = pcall(require, "todo-comments")
if not status then
	return
end

local keymap = vim.keymap

-- PERF:
-- HACK:
-- TODO:
-- NOTE:
-- FIX:
-- WARNING:
--@OPTIMIZE:

todotree.setup({
	keymap.set("n", "]t", function()
		require("todo-comments").jump_next()
	end, { desc = "Next todo comment" }),

	keymap.set("n", "[t", function()
		require("todo-comments").jump_prev()
	end, { desc = "Previous todo comment" }), -- You can also specify a list of valid jump keywords

	keymap.set("n", "]t", function()
		require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
	end, { desc = "Next error/warning todo comment" }),
	keymap.set("n", "<leader>r", ":TodoLocList<CR>"),
	keymap.set("n", "<leader>rt", ":TodoTelescope<CR>"),
	keymap.set("n", "<leader>fq", ":TodoQuickFix<CR>"),
})
