return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "HiPhish/rainbow-delimiters.nvim",
    },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            rainbow = {
                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = { enable = true },
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "rust",
                "toml",
                "glsl",
                "latex",
                "cpp",
                "c",
                "query",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>v",
                    node_incremental = "<leader>v",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            -- auto install above language parsers
            auto_install = true,
        })
        -- Treesitter folding
        -- https://neovim.io/doc/user/fold.html#fold-commands:~:text=the%20same%20time.-,2.%20Fold%20commands,-fold%2Dcommands%20E490
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    end,
}
