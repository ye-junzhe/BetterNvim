return {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        'smoka7/hydra.nvim',
    },
    config = function ()
        require('multicursors').setup {
            hint_config = false,
            {
                -- border = 'rounded',
                -- position = 'bottom-right',
            },
            mode_keys = {
                change = 's',
            }, -- set bindings to start these modes
            generate_hints = {
                normal = true,
                insert = true,
                extend = true,
                config = {
                    column_count = 3,
                },
            },
        }
    end,

    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
        {
            mode = { 'v', 'n' }, '<C-n>', '<cmd>MCstart<cr>', desc = 'Create a selection for selected text or word under the cursor',
        },
    },
}
