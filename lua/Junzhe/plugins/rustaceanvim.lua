-- NOTE: LazyVim Example
-- https://github.com/appelgriebsch/LazyVim/blob/2bfa9f590c08ab896e95164ca77beaed493ba28e/lua/lazyvim/plugins/extras/lang/rust.lua
return {
    "mrcjkb/rustaceanvim",
    version = '^4', -- Recommended
    ft = { "rust" },
    opts = {
        server = {
            on_attach = function(_, bufnr) end,
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
