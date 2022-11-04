local _M = {}
_M.methods = {}

---checks if the character preceding the cursor is a space character
---@return boolean true if it is a space character, false otherwise
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	---@diagnostic disable-next-line
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end
_M.methods.check_backspace = check_backspace

local function T(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

---wraps vim.fn.feedkeys while replacing key codes with escape codes
---Ex: feedkeys("<CR>", "n") becomes feedkeys("^M", "n")
---@param key string
---@param mode string
local function feedkeys(key, mode)
	vim.fn.feedkeys(T(key), mode)
end
_M.methods.feedkeys = feedkeys

---checks if emmet_ls is available and active in the buffer
---@return boolean true if available, false otherwise
local is_emmet_active = function()
	local clients = vim.lsp.buf_get_active_clients()

	for _, client in pairs(clients) do
		if client.name == "emmet_ls" then
			return true
		end
	end
	return false
end
_M.methods.is_emmet_active = is_emmet_active

---when inside a snippet, seeks to the nearest luasnip field if possible, and checks if it is jumpable
---@param dir ?number 1 for forward, -1 for backward; defaults to 1
---@return boolean true if a jumpable luasnip field is found while inside a snippet
local function jumpable(dir)
	local luasnip_ok, luasnip = pcall(require, "luasnip")
	if not luasnip_ok then
		return false
	end

	local win_get_cursor = vim.api.nvim_win_get_cursor
	local get_current_buf = vim.api.nvim_get_current_buf

	local function inside_snippet()
		-- for outdated versions of luasnip
		if not luasnip.session.current_nodes then
			return false
		end

		local node = luasnip.session.current_nodes[get_current_buf()]
		if not node then
			return false
		end

		local snip_begin_pos, snip_end_pos = node.parent.snippet.mark:pos_begin_end()
		local pos = win_get_cursor(0)
		pos[1] = pos[1] - 1 -- LuaSnip is 0-based not 1-based like nvim for rows
		return pos[1] >= snip_begin_pos[1] and pos[1] <= snip_end_pos[1]
	end

	---sets the current buffer's luasnip to the one nearest the cursor
	---@return boolean true if a node is found, false otherwise
	local function seek_luasnip_cursor_node()
		-- for outdated versions of luasnip
		if not luasnip.session.current_nodes then
			return false
		end

		local pos = win_get_cursor(0)
		pos[1] = pos[1] - 1
		local node = luasnip.session.current_nodes[get_current_buf()]
		if not node then
			return false
		end

		local snippet = node.parent.snippet
		local exit_node = snippet.insert_nodes[0]

		-- exit early if we're past the exit node
		if exit_node then
			local exit_pos_end = exit_node.mark:pos_end()
			if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		node = snippet.inner_first:jump_into(1, true)
		while node ~= nil and node.next ~= nil and node ~= snippet do
			local n_next = node.next
			local next_pos = n_next and n_next.mark:pos_begin()
			local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
				or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

			-- Past unmarked exit node, exit early
			if n_next == nil or n_next == snippet.next then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end

			if candidate then
				luasnip.session.current_nodes[get_current_buf()] = node
				return true
			end

			local ok
			ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
			if not ok then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		-- No candidate, but have an exit node
		if exit_node then
			-- to jump to the exit node, seek to snippet
			luasnip.session.current_nodes[get_current_buf()] = snippet
			return true
		end

		-- No exit node, exit from snippet
		snippet:remove_from_jumplist()
		luasnip.session.current_nodes[get_current_buf()] = nil
		return false
	end

	if dir == -1 then
		return inside_snippet() and luasnip.jumpable(-1)
	else
		return inside_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable()
	end
end
_M.methods.jumpable = jumpable

function _M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local cmp_rg = require("cmp-rg")
	local project = require("project_nvim.project")

	local function isvalidcwd(req_cwd)
		local cwd = vim.fn.getcwd()
		local ok, root = pcall(function()
			vim.api.nvim_set_current_dir(req_cwd)
			local root, _ = project.get_project_root()
			return root
		end)
		vim.api.nvim_set_current_dir(cwd)

		if not ok then
			error(root)
		end

		if not root then
			return false
		end

		root = string.gsub(root, _G.path_separator .. "+$", "")

		return vim.startswith(req_cwd, root)
	end

	local function rg1_complete(self, request, callback)
		request.option.cwd = request.option.cwd or vim.fn.getcwd()

		if isvalidcwd(request.option.cwd) then
			self.inner.complete(self.inner, request, callback)
		else
			callback({ items = {}, isIncomplete = false })
		end
	end

	cmp.register_source("rg1", setmetatable({ inner = cmp_rg.new() }, { __index = { complete = rg1_complete } }))

	local kind_icons = {
		Class = "",
		Color = "",
		Constant = "ﲀ",
		Constructor = "",
		Enum = "練",
		EnumMember = "",
		Event = "",
		Field = "",
		File = "",
		Folder = "",
		Function = "",
		Interface = "ﰮ ",
		Keyword = "",
		Method = "",
		Module = "",
		Operator = "",
		Property = "",
		Reference = "",
		Snippet = "",
		Struct = "",
		Text = "",
		TypeParameter = "",
		Unit = "塞",
		Value = "",
		Variable = "",
	}
	local source_names = {
		nvim_lsp = "[Lsp]",
		treesitter = "[Tre]",
		luasnip = "[Snp]",
		buffer = "[Buf]",
		nvim_lua = "[Lua]",
		path = "[Pat]",
		calc = "[Clc]",
		emoji = "[Emj]",
		rg1 = "[Rg]",
		orgmode = "[Org]",
	}
	local duplicates = {
		buffer = 1,
		path = 1,
		nvim_lsp = 0,
		luasnip = 1,
	}
	local duplicates_default = 0

	vim.o.completeopt = "menu,menuone,noinsert,noselect"

	cmp.setup({
		completion = {
			keyword_length = 1,
		},
		experimental = {
			ghost_text = true,
			native_menu = false,
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.kind = kind_icons[vim_item.kind]
				vim_item.menu = source_names[entry.source.name]
				vim_item.dup = duplicates[entry.source.name] or duplicates_default

				return vim_item
			end,
		},
		window = {
			documentation = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			},
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "treesitter" },
			{ name = "buffer" },
			{ name = "rg1" },
			{ name = "path" },
			{ name = "calc" },
			{ name = "emoji" },
			{ name = "crates" },
			{ name = "orgmode" },
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		preselect = true,
		mapping = {
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-y>"] = cmp.config.disable,
			["<C-n>"] = cmp.config.disable,
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand({})
				elseif jumpable() then
					luasnip.jump(1)
				elseif check_backspace() then
					fallback()
				elseif is_emmet_active() then
					return vim.fn["cmp#complete"]()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<Esc>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping(function(fallback)
				if
					cmp.visible()
					and cmp.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					})
				then
					return
				else
					fallback()
				end
			end),
		},
	})
end

return _M
