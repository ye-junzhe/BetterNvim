local lualine = require("lualine")

local colors = {
	bg = "#1E1E2E",
	fg = "#CDD6F4",
	yellow = "#F9E2AF",
	green = "#A6E3A1",
	blue = "#89B4FA",
	red = "#F38BA8",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
}

-- Config
local config = {
	options = {
		theme = "catppuccin",
	},
	sections = {
		-- these are to remove the defaults
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.blue, gui = "bold" },
})

ins_left({
	-- filesize component
	"filesize",
	color = { fg = colors.blue, gui = "bold" },
	cond = conditions.buffer_not_empty,
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
	function()
		return "%="
	end,
})

ins_left({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { bg = colors.base, fg = colors.blue, gui = "bold" },
})

ins_right({
	"fileformat",
	symbols = {
		unix = "", -- e711
		dos = "", -- e70f
	},
})

-- Add components to right sections
ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = { fg = colors.blue, gui = "bold" },
})

-- ins_right({
-- 	"diff",
-- 	-- Is it me or the symbol for modified us really weird
-- 	symbols = { added = " ", modified = "柳 ", removed = " " },
-- 	diff_color = {
-- 		added = { fg = colors.green },
-- 		modified = { fg = colors.blue },
-- 		removed = { fg = colors.red },
-- 	},
-- 	cond = conditions.hide_in_width,
-- })

-- Now don't forget to initialize lualine
lualine.setup(config)
