-- PERF:
-- HACK:
-- TODO:
-- NOTE:
-- FIX:
-- WARNING:
-- @OPTIMIZE:

return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup()
        local keymap = vim.keymap
        keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
        end, { desc = "Next todo comment" })

        keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
        end, { desc = "Previous todo comment" })

        keymap.set("n", "]t", function()
            require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
        end, { desc = "Next error/warning todo comment" })
        -- keymap.set("n", "<leader>t", ":TodoLocList<CR>")
        keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "TODOs" })
        keymap.set("n", "<leader>fq", ":TodoQuickFix<CR>", { desc = "TodoQuickFix" })
    end,
}
