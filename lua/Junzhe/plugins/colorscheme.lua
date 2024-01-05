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

                " For nvim tree
                highlight NvimTreeIndentMarker guifg=#A6E3A1
                highlight NvimTreeFolderArrowClosed guifg=#A6E3A1
                highlight NvimTreeFolderArrowOpen guifg=#A6E3A1
                highlight NvimTreeNormal guibg=NONE

                " For vertical split window border
                highlight WinSeparator guifg=#A6E3A1

                " For Diagnostic mesgs
                highlight DiagnosticVirtualTextError guibg=NONE
                highlight DiagnosticVirtualTextWarn guibg=NONE
                highlight DiagnosticVirtualTextInfo guibg=NONE
                highlight DiagnosticVirtualTextHint guibg=NONE
                highlight DiagnosticVirtualTextOk guibg=NONE

                " For float terms like hoverdoc
                highlight NormalFloat guibg=NONE

                ]])
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
            vim.cmd([[
                colorscheme tokyonight
                highlight BufferTabpageFill guibg=NONE
                highlight NvimTreeIndentMarker guifg=blue
                highlight NvimTreeFolderArrowClosed guifg=blue
                highlight NvimTreeFolderArrowOpen guifg=blue
                highlight WinSeparator guifg=blue
                ]])

                -- highlight SignColumn guibg=NONE
                -- highlight DiagnosticError guibg=NONE
                -- highlight DiagnosticWarn guibg=NONE
                -- highlight DiagnosticInfo guibg=NONE
                -- highlight DiagnosticHint guibg=NONE
                -- highlight DiagnosticOk guibg=NONE
                -- highlight DiagnosticFloatingError guibg=NONE
                -- highlight DiagnosticFloatingWarn guibg=NONE
                -- highlight DiagnosticFloatingInfo guibg=NONE
                -- highlight DiagnosticFloatingHint guibg=NONE
                -- highlight DiagnosticFloatingOk guibg=NONE
            --
        end
    }
}

local lualine_colorscheme = {
    -- nightfly
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

    -- catppuccin-mocha
    {
        bg = "#1E1E2E",
        innerbg = nil,
        fg = "#CDD6F4",
        yellow = "#F9E2AF",
        green = "#A6E3A1",
        blue = "#89B4FA",
        red = "#F38BA8",
        pink = "#F5C2E7",
        orange = "#FF9E64",
    },

    -- tokyonight-night
    {
        bg = "#24283B",
        innerbg = nil,
        fg = "#A9B1D6",
        yellow = "#FF9E64",
        green = "#9ECE6A",
        blue = "#2AC3DE",
        red = "#F7768E",
        pink = "#BB9AF7",
    },
}

LUALINE_COLORSCHEME = lualine_colorscheme[2] -- lualine theme

return {
    colorschemes[2], -- main theme
}
