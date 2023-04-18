-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup({
	function(use)
		-- packer can manage itself
		use("wbthomason/packer.nvim")

		use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

		use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme

		use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

		use("szw/vim-maximizer") -- maximizes and restores current window

		-- essential plugins
		use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
		use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

		-- commenting with gc
		use("numToStr/Comment.nvim")

		-- file explorer
		use("nvim-tree/nvim-tree.lua")

		-- vs-code like icons
		use("kyazdani42/nvim-web-devicons")

		-- statusline
		use("nvim-lualine/lualine.nvim")

		-- fuzzy finding w/ telescope
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
		use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
		use("junegunn/fzf")

		-- autocompletion
		use("hrsh7th/nvim-cmp") -- completion plugin
		use("hrsh7th/cmp-buffer") -- source for text in buffer
		use("hrsh7th/cmp-path") -- source for file system paths

		use("hrsh7th/vim-vsnip") -- VSCode(LSP)'s snippet feature in vim/nvim.
		use("hrsh7th/cmp-nvim-lua")
		use("hrsh7th/cmp-nvim-lsp-signature-help")
		use("hrsh7th/cmp-vsnip")

		-- snippets
		use("L3MON4D3/LuaSnip") -- snippet engine
		use("saadparwaiz1/cmp_luasnip") -- for autocompletion
		use("rafamadriz/friendly-snippets") -- useful snippets

		-- managing & installing lsp servers, linters & formatters
		use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
		use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

		-- configuring lsp servers
		use("neovim/nvim-lspconfig") -- easily configure language servers
		use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			requires = {
				{ "nvim-tree/nvim-web-devicons" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		})
		use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
		use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

		-- formatting & linting
		use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
		use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

		-- treesitter configuration
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
		})

		-- auto closing
		use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

		-- git integration
		use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

		-- float terminal
		use("voldikss/vim-floaterm")

		--  vertical lines at each indentation level for code indented with spaces
		use("lukas-reineke/indent-blankline.nvim")

		-- rust-tools
		use("simrat39/rust-tools.nvim")

		-- Debug tools
		-- use("puremourning/vimspector")

		-- jump to specific line, word, pattern etc
		use({
			"phaazon/hop.nvim",
			branch = "v2",
			config = function()
				require("hop").setup({})
			end,
		})

		-- monokai colorscheme
		use("tanvirtin/monokai.nvim")

		-- overview of the file structure
		use("preservim/tagbar")
		use({
			"simrat39/symbols-outline.nvim",
			config = function()
				require("symbols-outline").setup({})
			end,
		})

		-- TODO tree
		use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

		-- -- Trouble
		-- use({
		-- 	"folke/trouble.nvim",
		-- 	requires = "kyazdani42/nvim-web-devicons",
		-- 	config = function()
		-- 		require("trouble").setup({
		-- 			-- your configuration comes here
		-- 			-- or leave it empty to use the default settings
		-- 			-- refer to the configuration section below
		-- 		})
		-- 	end,
		-- })

		-- gruvbox color theme
		use({ "ellisonleao/gruvbox.nvim" })

		--  inlayhints
		-- use("lvimuser/lsp-inlayhints.nvim")

		-- nvim start screen
		use({
			"startup-nvim/startup.nvim",
			requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
			config = function()
				require("startup").setup({ theme = "Evil" })
			end,
		})

		-- catppuccin color theme
		use({ "catppuccin/nvim", as = "catppuccin" })

		-- tokyo night color theme
		use("folke/tokyonight.nvim")

		-- bufferline
		use({
			"akinsho/bufferline.nvim",
			tag = "v3.*",
			requires = "kyazdani42/nvim-web-devicons",
			-- config = function()
			-- 	require("bufferline").setup({})
			-- end,
		})

		-- image viewer
		-- use({
		-- 	"edluffy/hologram.nvim",
		-- 	config = function()
		-- 		require("hologram").setup({ auto_display = true })
		-- 	end,
		-- })

		-- command mode autocompletion
		use({ "gelguy/wilder.nvim" })

		-- LaTeX Generator
		-- use("lervag/vimtex")

		-- for Cargo & Cmake
		use({ "Shatur/neovim-tasks" })

		-- view git diff
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

		-- winbar
		use({
			"fgheng/winbar.nvim",
			config = function()
				require("winbar").setup({})
			end,
		})

		-- use({
		-- 	"folke/noice.nvim",
		-- 	config = function()
		-- 		require("noice").setup()
		-- 	end,
		-- 	requires = {
		-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		-- 		"MunifTanjim/nui.nvim",
		-- 		-- OPTIONAL:
		-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
		-- 		--   If not available, we use `mini` as the fallback
		-- 		"rcarriga/nvim-notify",
		-- 	},
		-- })

		-- install without yarn or npm
		use({ "iamcco/markdown-preview.nvim" })

		-- more highlights
		use({
			"m-demare/hlargs.nvim",
			requires = { "nvim-treesitter/nvim-treesitter" },
		})

		-- beacon show jump cursor line
		use("danilamihailov/beacon.nvim")

		-- crates
		use({
			"saecki/crates.nvim",
			tag = "v0.3.0",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("crates").setup()
			end,
		})

		-- nvim-gps show signatures
		use({
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
		})

		-- showing context in winbar
		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
		})

		-- Highlight vriables and stuff
		use({ "RRethy/vim-illuminate" })

		-- lazygit
		use({ "kdheepak/lazygit.nvim" })

		-- minimap
		-- use("wfxr/minimap.vim")

		-- color 16
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup({})
			end,
		})

		-- rainbow parentheses
		use({ "p00f/nvim-ts-rainbow" })

		-- match pairs
		use({ "Yggdroot/hiPairs" })

		-- vim bookmarks
		use({ "MattesGroeger/vim-bookmarks" })

		-- zen mode
		use({
			"folke/zen-mode.nvim",
			config = function()
				require("zen-mode").setup({})
			end,
		})

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	-- using floating window
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
