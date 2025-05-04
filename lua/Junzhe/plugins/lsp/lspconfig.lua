return {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { 'mrcjkb/rustaceanvim', lazy = false },
    },

    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local on_attach = function (_, _) end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure typescript server with plugin
        lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            root_dir = lspconfig.util.root_pattern("package.json"),
            single_file_support = true,
        })

        lspconfig["svelte"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            single_file_support = true
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure python server
        lspconfig["jedi_language_server"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["marksman"].setup({
            capabilities = capabilities,
            on_attach = function(client, _)
                client.server_capabilities.hoverProvider = false
            end,
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            -- cmd = { "clangd", "--background-index", "--clang-tidy" },
            -- filetypes = { "c", "cpp", "objc", "objcpp" },
            -- settings = {
            -- 	clangd = {
            -- 		semanticHighlighting = true,
            -- 		serverCompletionRanking = true,
            -- 		fallbackFlags = { "-std=c++11" },
            -- 		detectExtensionConflicts = true,
            -- 		checkUpdates = false,
            -- 		arguments = { "--all-scopes-completion", "--cross-file-rename" },
            -- 		restartAfterCrash = true,
            -- 		onConfigChanged = "prompt",
            -- 		header_search = { "/opt/homebrew/include", "/opt/homebrew/lib" },
            -- 		header_insertion = "never",
            -- 		header_insertion_decorators = "with-includepath",
            -- 		completion_style = "detailed",
            -- 		suggest_missing_includes = true,
            -- 	},
            -- },
        })
    end,
}
