-- NOTE: LazyVim Example
-- https://github.com/appelgriebsch/LazyVim/blob/2bfa9f590c08ab896e95164ca77beaed493ba28e/lua/lazyvim/plugins/extras/lang/rust.lua
return {
    "mrcjkb/rustaceanvim",
    version = '^4', -- Recommended
    ft = { "rust" },
    opts = {
        server = {
            on_attach = function(_, bufnr)

                local opts = { noremap = true, silent = true }
                local keymap = vim.keymap -- for conciseness

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
                -- vim.keymap.set({ "n", "v" }, "<leader>ca", function()
                --     vim.cmd.RustLsp("codeAction")
                -- end, { buffer = bufnr, desc = "Code Action" })

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
                local opts = { noremap = true, silent = true, buffer = bufnr }

                -- rustaceanvim keybindings
                -- workspace diagnostics
                vim.keymap.set("n", "<leader>dw", function()
                    vim.cmd.RustLsp("workspaceDiagnostics")
                end, { buffer = bufnr, desc = "Workspace Diagnostics" })

                -- buffer diagnostics
                vim.keymap.set("n", "<leader>db", function()
                    vim.cmd.RustLsp("diagnostics")
                end, { buffer = bufnr, desc = "Buffer Diagnostics" })

                -- debuggables
                vim.keymap.set("n", "<leader>dr", function()
                    vim.cmd.RustLsp("debuggables")
                end, { buffer = bufnr, desc = "Rust debuggables" })

            end,
            default_settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                        runBuildScripts = true,
                        buildScripts = {
                            enable = true,
                        },
                    },
                    -- Add clippy lints for Rust.
                    checkOnSave = {
                        allFeatures = true,
                        command = "clippy",
                        extraArgs = { "--no-deps" },
                    },
                    procMacro = {
                        enable = true,
                        ignored = {
                            ["async-trait"] = { "async_trait" },
                            ["napi-derive"] = { "napi" },
                            ["async-recursion"] = { "async_recursion" },
                        },
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
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
                inlay_hints = {
                    auto = true,
                    show_parameter_hints = true,
                },
            },
        }
    },
    config = function(_, opts)
        vim.g.rustaceanvim = vim.tbl_deep_extend("force",
            {},
            opts or {})
    end
}
