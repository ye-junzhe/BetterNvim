return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lspsaga").setup({
            -- keybinds for navigation in lspsaga window
            scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
            -- use enter to open file with definition preview
            definition = {
                edit = "<CR>",
                keys = {
                    tabe = "o",
                    edit = "i",
                },
            },
            ui = {
                -- border type can be single,double,rounded,solid,shadow.
                border = "rounded",
                code_action = "",
            },
            symbol_in_winbar = {
                separator = "  ",
                respect_root = true,
                folder_level = 3,
            },
        })
        vim.keymap.set("n", "<leader>dw", ":Lspsaga show_workspace_diagnostics<CR>")
        vim.keymap.set("n", "<leader>db", ":Lspsaga show_buf_diagnostics<CR>")
        vim.keymap.set("n", "<leader>t", ":Lspsaga term_toggle<CR>")
    end,
}
