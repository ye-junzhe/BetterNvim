return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "ts_ls",
                "html",
                "cssls",
                "lua_ls",
                "jedi_language_server",
                "jsonls",
                "clangd",
                "rust_analyzer",
                "yamlls",
                "taplo",
                "marksman",
                "svelte",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed

            -- General approach to prevent mason-lspconfig from setting up rust-analyzer
        })

        mason_lspconfig.setup_handlers = {
            ['rust_analyzer'] = function() end,
        }

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "pylint", -- python linter
                "eslint_d", -- js linter
            },

            automatic_installation = true,
        })
    end,
}
