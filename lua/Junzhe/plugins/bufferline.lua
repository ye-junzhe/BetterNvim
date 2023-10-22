return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",

    config = function()
        require("bufferline").setup({
            options = {
                highlights = {
                    styles = { "italic", "bold" },
                },
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                numbers = "both",
                close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true, -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = true,
                -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                color_icons = true, -- whether or not to add the filetype icon highlights
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = true,
                show_tab_indicators = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                -- can also be a table containing 2 custom separators
                -- [focused and unfocused]. eg: { '|', '|' }
                separator_style = "slant",
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
                sort_by = {
                    "insert_after_current",
                },
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true, -- use a "true" to enable the default, or set your own character
                    },
                },
            },

        })
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
        keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
    end,

}
