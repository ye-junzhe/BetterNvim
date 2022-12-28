-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- get lualine molokai theme
local lualine_molokai = require("lualine.themes.molokai")

-- get lualine dracula theme
local lualine_dracula = require("lualine.themes.dracula")

-- get lualine_gruvbox theme
local lualine_gruvbox = require("lualine.themes.gruvbox")

-- new colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- -- change nightlfy theme colors
-- lualine_nightfly.normal.a.bg = new_colors.blue
-- lualine_nightfly.insert.a.bg = new_colors.green
-- lualine_nightfly.visual.a.bg = new_colors.violet
-- lualine_nightfly.command = {
-- 	a = {
-- 		gui = "bold",
-- 		bg = new_colors.yellow,
-- 		fg = new_colors.black, -- black
-- 	},
-- }

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = "catppuccin",
		-- theme = "nightfly",
	},
	sections = {

		-- lualine_x = {
		-- 	{
		-- 		require("noice").api.status.message.get_hl,
		-- 		cond = require("noice").api.status.message.has,
		-- 	},
		-- 	{
		-- 		require("noice").api.status.command.get,
		-- 		cond = require("noice").api.status.command.has,
		-- 		color = { fg = "#ff9e64" },
		-- 	},
		-- 	{
		-- 		require("noice").api.status.mode.get,
		-- 		cond = require("noice").api.status.mode.has,
		-- 		color = { fg = "#ff9e64" },
		-- 	},
		-- 	{
		-- 		require("noice").api.status.search.get,
		-- 		cond = require("noice").api.status.search.has,
		-- 		color = { fg = "#ff9e64" },
		-- 	},
		-- },
		lualine_c = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = true, -- Display new file status (new file means no write after created)
				path = 3, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory
				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[No Name]", -- Text to show for unnamed buffers.
					newfile = "[New]", -- Text to show for new created file before first writting
				},
			},
		},
		lualine_x = {
			{
				"fileformat",
				symbols = {
					unix = "", -- e711
					dos = "", -- e70f
				},
			},
		},
		-- lualine_z = {
		-- 	{
		-- 		"filetype",
		-- 		colored = true, -- Displays filetype icon in color if set to true
		-- 		icon_only = false, -- Display only an icon for filetype
		-- 		icon = { align = "right" }, -- Display filetype icon on the right hand side
		-- 		-- icon =    {'X', align='right'}
		-- 		-- Icon string ^ in table is ignored in filetype component
		-- 	},
		-- },
		-- lualine_b = {
		-- 	{
		-- 		"diagnostics",
		--
		-- 		-- Table of diagnostic sources, available sources are:
		-- 		--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
		-- 		-- or a function that returns a table as such:
		-- 		--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
		-- 		sources = { "nvim_diagnostic", "coc" },
		--
		-- 		-- Displays diagnostics for the defined severity types
		-- 		sections = { "error", "warn", "info", "hint" },
		--
		-- 		diagnostics_color = {
		-- 			-- Same values as the general color option can be used here.
		-- 			error = "DiagnosticError", -- Changes diagnostics' error color.
		-- 			warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
		-- 			info = "DiagnosticInfo", -- Changes diagnostics' info color.
		-- 			hint = "DiagnosticHint", -- Changes diagnostics' hint color.
		-- 		},
		-- 		symbols = { error = "E", warn = "W", info = "I", hint = "H" },
		-- 		colored = true, -- Displays diagnostics status in color if set to true.
		-- 		update_in_insert = false, -- Update diagnostics in insert mode.
		-- 		always_visible = false, -- Show diagnostics even if there are none.
		-- 	},
		-- },
		-- lualine_a = {
		-- 	{
		-- 		"buffers",
		-- 		show_filename_only = false, -- Shows shortened relative path when set to false.
		-- 		hide_filename_extension = false, -- Hide filename extension when set to true.
		-- 		show_modified_status = true, -- Shows indicator when the buffer is modified.
		--
		-- 		mode = 4, -- 0: Shows buffer name
		-- 		-- 1: Shows buffer index
		-- 		-- 2: Shows buffer name + buffer index
		-- 		-- 3: Shows buffer number
		-- 		-- 4: Shows buffer name + buffer number
		-- 	},
		-- },
	},
})
