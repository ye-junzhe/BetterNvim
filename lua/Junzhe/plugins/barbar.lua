return {
    'romgrk/barbar.nvim',
    event = { "BufReadPre", "BufNewFile" },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    config = function ()

        require("barbar").setup({
            highlight_visible = false,
            icons = {
                -- Configure the base icons on the bufferline.
                -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
                buffer_index = false,
                buffer_number = false,
                button = '',
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    -- [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
                    -- [vim.diagnostic.severity.WARN] = {enabled = true, icon = ' '},
                    -- [vim.diagnostic.severity.INFO] = {enabled = true, icon = ' '},
                    -- [vim.diagnostic.severity.HINT] = {enabled = true},
                },
                -- gitsigns = {
                --     added = {enabled = true, icon = '+'},
                --     changed = {enabled = true, icon = '~'},
                --     deleted = {enabled = true, icon = '-'},
                -- },
                filetype = {
                    -- Sets the icon's highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = true,

                    -- Requires `nvim-web-devicons` if `true`
                    enabled = true,
                },
                separator = {left = '▎', right = ''},

                -- If true, add an additional separator at the end of the buffer list
                separator_at_end = true,

                -- Configure the icons on the bufferline when modified or pinned.
                -- Supports all the base icon options.
                modified = {button = '●'},
                pinned = {button = '', filename = true},

                -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
                preset = 'default',

                -- Configure the icons on the bufferline based on the visibility of a buffer.
                -- Supports all the base icon options, plus `modified` and `pinned`.
                alternate = {filetype = {enabled = false}},
                current = {buffer_index = false},
                inactive = {button = '󰒲'},
                visible = {modified = {buffer_number = false}},
            },
        })

        vim.cmd([[
            " highlight TabLine guibg=NONE ctermbg=NONE
            highlight TabLineFill guibg=NONE ctermbg=NONE
            " highlight TabLineSel guibg=NONE ctermbg=NONE
            " For barbar
            highlight BufferTabpageFill guibg=NONE ctermbg=NONE
            " highlight BufferTabpages guibg=NONE ctermbg=NONE
            highlight BufferTabpagesSep guibg=NONE ctermbg=NONE
            highlight BufferOffset guibg=NONE ctermbg=NONE
            highlight BufferScrollArrow guibg=NONE ctermbg=NONE
            " barbar - current buffer
            highlight BufferCurrent guibg=NONE guifg=#A6E3A1 ctermbg=NONE
            highlight BufferCurrentADDED guibg=NONE ctermbg=NONE
            highlight BufferCurrentCHANGED guibg=NONE ctermbg=NONE
            highlight BufferCurrentDELETED guibg=NONE ctermbg=NONE
            highlight BufferCurrentERROR guibg=NONE guifg=#F38BA8 ctermbg=NONE
            highlight BufferCurrentWARN guibg=NONE guifg=#F9E2AF ctermbg=NONE
            highlight BufferCurrentHINT guibg=NONE guifg=#A6E3A1 ctermbg=NONE
            " highlight BufferCurrentIcon guibg=NONE ctermbg=NONE
            highlight BufferCurrentIndex guibg=NONE ctermbg=NONE
            " highlight BufferCurrentINFO guibg=NONE ctermbg=NONE
            highlight BufferCurrentMod guibg=NONE guifg=#A6E3A1 ctermbg=NONE
            highlight BufferCurrentNumber guibg=NONE ctermbg=NONE
            highlight BufferCurrentSign guibg=NONE ctermbg=NONE
            highlight BufferCurrentSignRight guibg=NONE ctermbg=NONE
            highlight BufferCurrentTarget guibg=NONE ctermbg=NONE

            " barbar - inactive buffer
            highlight BufferInactive guibg=NONE ctermbg=NONE
            highlight BufferInactiveADDED guibg=NONE ctermbg=NONE
            highlight BufferInactiveCHANGED guibg=NONE ctermbg=NONE
            highlight BufferInactiveDELETED guibg=NONE ctermbg=NONE
            highlight BufferInactiveERROR guibg=NONE ctermbg=NONE
            highlight BufferInactiveHINT guibg=NONE ctermbg=NONE
            highlight BufferInactiveIcon guibg=NONE ctermbg=NONE
            highlight BufferInactiveIndex guibg=NONE ctermbg=NONE
            highlight BufferInactiveINFO guibg=NONE ctermbg=NONE
            highlight BufferInactiveMod guibg=NONE ctermbg=NONE
            highlight BufferInactiveNumber guibg=NONE ctermbg=NONE
            highlight BufferInactiveSign guibg=NONE ctermbg=NONE
            highlight BufferInactiveSignRight guibg=NONE ctermbg=NONE
            highlight BufferInactiveTarget guibg=NONE ctermbg=NONE
            highlight BufferInactiveWARN guibg=NONE ctermbg=NONE

            highlight BufferVisible          guibg=NONE ctermbg=NONE
            highlight BufferVisibleADDED     guibg=NONE ctermbg=NONE
            highlight BufferVisibleCHANGED   guibg=NONE ctermbg=NONE
            highlight BufferVisibleDELETED   guibg=NONE ctermbg=NONE
            highlight BufferVisibleERROR     guibg=NONE ctermbg=NONE
            highlight BufferVisibleHINT      guibg=NONE ctermbg=NONE
            highlight BufferVisibleIcon      guibg=NONE ctermbg=NONE
            highlight BufferVisibleIndex     guibg=NONE ctermbg=NONE
            highlight BufferVisibleINFO      guibg=NONE ctermbg=NONE
            highlight BufferVisibleMod       guibg=NONE ctermbg=NONE
            highlight BufferVisibleNumber    guibg=NONE ctermbg=NONE
            highlight BufferVisibleSign      guibg=NONE ctermbg=NONE
            highlight BufferVisibleSignRight guibg=NONE ctermbg=NONE
            highlight BufferVisibleTarget    guibg=NONE ctermbg=NONE
            highlight BufferVisibleWARN      guibg=NONE ctermbg=NONE

            ]])
    end,
}
