return {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
        vim.api.nvim_set_keymap(
            "n",
            "<a-n>",
            '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
            { noremap = true }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<a-p>",
            '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
            { noremap = true }
        )

        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end,
}
