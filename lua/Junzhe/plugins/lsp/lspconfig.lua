-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local navic = require("nvim-navic")

local rt = require("rust-tools")
local keymap = vim.keymap -- for conciseness

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			navic.attach(_, bufnr)

			local opts = { noremap = true, silent = true, buffer = bufnr }
			-- Hover actions
			vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
			-- vim.keymap.set("n", "gh", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			-- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
			-- lsp_finder
			keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
			keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
			keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
			keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
			keymap.set("n", "<leader>k", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
			keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
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

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>k", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	-- <C-b> & <C-f> to sroll in hover doc
	keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
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
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
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

require("lspconfig").clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	settings = {
		clangd = {
			semanticHighlighting = true,
			serverCompletionRanking = true,
			fallbackFlags = { "-std=c++11" },
			detectExtensionConflicts = true,
			checkUpdates = false,
			arguments = { "--all-scopes-completion", "--cross-file-rename" },
			restartAfterCrash = true,
			onConfigChanged = "prompt",
			header_search = { "/opt/homebrew/include", "/opt/homebrew/lib" },
			header_insertion = "never",
			header_insertion_decorators = "with-includepath",
			completion_style = "detailed",
			suggest_missing_includes = true,
		},
	},
})
lspconfig["jedi_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["omnisharp_mono"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["golangci_lint_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["texlab"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["solargraph"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
-- lspconfig["rust_analyzer"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	settings = {
-- 		rust = {
-- 			imports = {
-- 				granularity = {
-- 					group = "module",
-- 				},
-- 				prefix = "self",
-- 			},
-- 			cargo = {
-- 				buildScripts = {
-- 					enable = true,
-- 				},
-- 			},
-- 			procMacro = {
-- 				enable = true,
-- 			},
-- 			inlayHints = {
-- 				bindingModeHints = {
-- 					enable = true,
-- 				},
-- 				chainingHints = {
-- 					enable = true,
-- 				},
-- 				closingBraceHints = {
-- 					enable = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- })
lspconfig["taplo"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["yamlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
