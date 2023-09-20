return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            vim.keymap.set("n", "<leader>gm", ":Gitsigns blame_line<CR>"),
            vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>"),
            vim.keymap.set("n", "<leader>gh", ":Gitsigns toggle_current_line_blame<CR>"),
        })
    end,
}
