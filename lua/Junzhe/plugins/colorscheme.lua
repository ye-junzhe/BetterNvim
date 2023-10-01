local colorschemes = {
    {
        "bluz71/vim-nightfly-guicolors",
        priority = 1000,
        config = function()
            vim.cmd([[
                colorscheme nightfly
                highlight NvimTreeFolderArrowClosed guifg=#3FC5FF 
                highlight NvimTreeFolderArrowOpen guifg=#3FC5FF
                ]])
        end,
    },

    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            vim.cmd([[
                colorscheme catppuccin-mocha
                vim.cmd([[ highlight NvimTreeIndentMarker guifg=#A6E3A1
                ]])
        end,
    },
}

return {
    colorschemes[1],
}
