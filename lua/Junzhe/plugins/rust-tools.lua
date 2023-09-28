return {
    "simrat39/rust-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local opts = { noremap = true, silent = true }

        local keymap = vim.keymap -- for conciseness
        local rt = require("rust-tools")

        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    -- set keybinds

                    -- references
                    opts.desc = "Show LSP references"
                    keymap.set("n", "gf", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
                    opts.desc = "Show Lspsaga find"
                    keymap.set("n", "gF", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references

                    -- outline
                    opts.desc = "Lspsaga outline"
                    keymap.set("n", "<leader>oo", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

                    -- definition
                    opts.desc = "Show Lspsaga peek_definition"
                    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
                    opts.desc = "Go to declaration"
                    keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
                    -- opts.desc = "Show LSP definitions"
                    -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                    -- implementation
                    opts.desc = "Show LSP implementations"
                    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                    -- type definition
                    opts.desc = "Show LSP type definitions"
                    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                    -- code action
                    opts.desc = "See available Lspsaga code actions"
                    keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
                    opts.desc = "See available code actions"
                    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                    -- smart rename
                    opts.desc = "Smart rename"
                    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                    -- hover doc
                    opts.desc = "Show documentation for what is under cursor"
                    keymap.set("n", "gH", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
                    opts.desc = "Show Lspsaga documentation for what is under cursor"
                    keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

                    -- diagnostics
                    opts.desc = "Show buffer diagnostics"
                    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
                    opts.desc = "Show line diagnostics"
                    keymap.set("n", "<leader>k", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
                    opts.desc = "Go to previous diagnostic"
                    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
                    opts.desc = "Go to next diagnostic"
                    keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                    opts.desc = "Restart LSP"
                    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
                end,

                rust = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    procMacro = {
                        enable = true,
                    },
                    inlayHints = {
                        bindingModeHints = {
                            enable = true,
                        },
                        chainingHints = {
                            enable = true,
                        },
                        closingBraceHints = {
                            enable = true,
                        },
                    },
                },
            },
        })
    end,
}
