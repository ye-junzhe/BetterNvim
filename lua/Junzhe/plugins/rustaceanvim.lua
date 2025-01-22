-- NOTE: LazyVim Example
-- https://github.com/appelgriebsch/LazyVim/blob/2bfa9f590c08ab896e95164ca77beaed493ba28e/lua/lazyvim/plugins/extras/lang/rust.lua
return {
    "mrcjkb/rustaceanvim",
    version = '^4', -- Recommended
    ft = { "rust" },
    opts = {
        server = {
            on_attach = function(client, bufnr)
                -- register which-key mappings
                local wk = require("which-key")
                -- wk.register({
                --     ["<leader>ca"] = { function() vim.cmd.RustLsp("codeAction") end, "Code Action" },
                --     ["<leader>dr"] = { function() vim.cmd.RustLsp("debuggables") end, "Rust debuggables" },
                -- }, { mode = "n", buffer = bufnr })
            end,
            default_settings = {
                -- rust-analyzer language server configuration
                ["rust-analyzer"] = {
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                        runBuildScripts = true,
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
        }
    },
    config = function(_, opts)
        vim.g.rustaceanvim = vim.tbl_deep_extend("force",
            {},
            opts or {})
    end
}
