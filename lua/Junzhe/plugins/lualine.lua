return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        local colors = LUALINE_COLORSCHEME

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
        }
        local my_lualine_theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
                a = { bg = colors.green, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
                a = { bg = "#CBA6F8", fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            inactive = {
                a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
                b = { bg = colors.inactive_bg, fg = colors.semilightgray },
                c = { bg = colors.inactive_bg, fg = colors.semilightgray },
            },
        }
        -- Config
        local config = {
            options = {
                theme = my_lualine_theme,
                component_separators = '',
                section_separators = '',
            },
            sections = {
                -- these are to remove the defaults
                lualine_b = {},
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

        -- multicursors.nvim integration
        ins_left({
            function ()
                local ok, hydra = pcall(require, 'hydra.statusline')
                if ok then
                    return hydra.get_name()
                end
                return ''
            end,
            cond = function ()
                local ok, hydra = pcall(require, 'hydra.statusline')
                return ok and hydra.is_active()
            end,
            color = {
                fg = "#1E1E2E",
                bg = colors.red,
                gui = 'bold',
            },
        })

        ins_left({
            'branch',
            -- icon = '',
            color = { fg = "#A6E3A1", gui = 'bold' },
        })

        ins_left {
            'diff',
            color = { fg = "#A6E3A1", gui = 'bold' },
            cond = conditions.hide_in_width,
        }

        ins_left({
            "filename",
            path = 0,
            shorting_target = 40,
            cond = conditions.buffer_not_empty,
            symbols = {
                modified = '[󰷥]',      -- Text to show when the file is modified.
                readonly = '[]',      -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[匿]', -- Text to show for unnamed buffers.
                newfile = '[]',     -- Text to show for newly created file before first write
            },
            color = { bg = colors.base, fg = colors.blue, gui = "bold" },
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
            color = { bg = colors.base, fg = colors.green, gui = "bold" },
        })

        ins_left {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
            },
        }

        ins_right({
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#FF9E64" },
        })

        -- ins_right({
        --     "datetime",
        --     -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
        --     style = 'default',
        --     color = { fg = colors.blue, gui = "bold" },
        -- })

        ins_right({
            "fileformat",
            symbols = {
                -- unix = "Mc", -- e711
                unix = "", -- f306
                dos = "", -- e70f
            },
            color = { fg = "#F5C2E7" , gui = 'bold' },
        })

        ins_right({
            -- filesize component
            "filesize",
            color = { fg = colors.green, gui = "bold" },
            cond = conditions.buffer_not_empty,
        })

        -- Add components to right sections
        ins_right({
            "o:encoding", -- option component same as &encoding in viml
            fmt = string.upper, -- I'm not sure why it's upper case either ;)
            cond = conditions.hide_in_width,
            color = { fg = colors.blue, gui = "bold" },
        })

        lualine.setup(config)
    end,
}
