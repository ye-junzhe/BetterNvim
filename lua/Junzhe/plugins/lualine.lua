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
	},
	sections = {
		lualine_a = {
			{
				"fileformat",
				symbols = {
					unix = "", -- e712
					dos = "", -- e70f
					mac = "", -- e711
				},
			},
		},
	},
})
