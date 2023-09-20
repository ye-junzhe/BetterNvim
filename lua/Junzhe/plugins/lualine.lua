return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        local colors_nightfly = {
            blue = "#65D1FF",
            green = "#3EFFDC",
            violet = "#FF61EF",
            yellow = "#FFDA7B",
            red = "#FF4A4A",
            fg = "#c3ccdc",
            bg = "#112638",
            inactive_bg = "#2c3043",
        }
        local colors_catppuccin = {
            bg = "#1E1E2E",
            fg = "#CDD6F4",
            yellow = "#F9E2AF",
            green = "#A6E3A1",
            blue = "#89B4FA",
            red = "#F38BA8",
        }

        local colors_table = { colors_nightfly, colors_catppuccin }

        local colors = colors_table[1]

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
                a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
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
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
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

        lualine.setup(config)
    end,
}
