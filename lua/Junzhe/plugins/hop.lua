return {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

        -- Hop
        vim.keymap.set("n", "<leader>j", ":HopLine<CR>")
        vim.keymap.set("n", "mk", ":HopPattern<CR>")
        vim.keymap.set("n", "ml", ":HopWord<CR>")
    end,
}
