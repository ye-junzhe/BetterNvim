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
                highlight NvimTreeIndentMarker guifg=#A6E3A1
                highlight NvimTreeFolderArrowClosed guifg=#A6E3A1
                highlight NvimTreeFolderArrowOpen guifg=#A6E3A1
                highlight WinSeparator guifg=#A6E3A1
                ]])
        end,
    },
}

local lualine_colorscheme = {
    -- catppuccin-mocha
    {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        red = "#FF4A4A",
        fg = "#c3ccdc",
        bg = "#112638",
        inactive_bg = "#2c3043",
    },

    -- nightfly
    {
        bg = "#1E1E2E",
        fg = "#CDD6F4",
        yellow = "#F9E2AF",
        green = "#A6E3A1",
        blue = "#89B4FA",
        red = "#F38BA8",
    }
}

LUALINE_COLORSCHEME = lualine_colorscheme[2] -- lualine theme

return {
    colorschemes[2], -- main theme
}
