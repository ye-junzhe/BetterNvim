local colorschemes = {
    {
        "bluz71/vim-nightfly-guicolors",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme nightfly]])
        end,
    },

    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
}

return {
    colorschemes[1],
}
