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

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

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
            keymap.set("n", "<leader>k", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for cursor
            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
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
            single_file_support = false
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
            on_attach = on_attach,
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
