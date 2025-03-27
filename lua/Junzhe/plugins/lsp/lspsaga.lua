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
                    edit = "o",
                    tabe = "i",
                    vsplit = "s",
                    split = "S",
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
                folder_level = 0,
            },
        })
    end,
}
