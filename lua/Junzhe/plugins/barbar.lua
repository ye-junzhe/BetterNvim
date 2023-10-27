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
        local keymap = require "vim.keymap"
        local opts = { noremap = true, silent = true }
        -- Move to previous/next
        keymap.set('n', '<S-H>', '<Cmd>BufferPrevious<CR>', opts)
        keymap.set('n', '<S-L>', '<Cmd>BufferNext<CR>', opts)
        -- Re-order to previous/next
        keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
        keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
        -- Goto buffer in position...
        keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
        keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
        keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
        keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
        keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
        keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
        keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
        keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
        keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
        keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
        -- Pin/unpin buffer
        keymap.set('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
        -- Close buffer
        keymap.set('n', '<C-c>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
        -- Wipeout buffer
        --                 :BufferWipeout
        -- Close commands
        --                 :BufferCloseAllButCurrent
        --                 :BufferCloseAllButPinned
        --                 :BufferCloseAllButCurrentOrPinned
        --                 :BufferCloseBuffersLeft
        --                 :BufferCloseBuffersRight
        -- Magic buffer-picking mode

        keymap.set('n', 'mp', '<Cmd>BufferPick<CR>', opts)
        -- Sort automatically by...

        keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
        keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
        keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
        keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
    end,
}
