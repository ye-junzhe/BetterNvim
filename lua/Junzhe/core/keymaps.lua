-- set leader key to space
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode and save
-- keymap.set("i", "jk", "<ESC>:w<CR>")
keymap.set("n", "<D-s>", ":w<CR>")
keymap.set("n", "W", ":w<CR>")
keymap.set("n", "Q", ":q<CR>")

-- ctrl+w or cmd+w to close the buffer
keymap.set("n", "<C-w>", ":bdelete<CR>")
keymap.set("n", "<D-w>", ":bdelete<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "|", "<C-w>v") -- split window vertically
keymap.set("n", "-", "<C-w>s") -- split window horizontally
keymap.set("n", "<D-d>", "<C-w>v") -- split window vertically
keymap.set("n", "<D-c>", "<C-w>s") -- split window horizontally
keymap.set("n", "<D-p>", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<D-w>", ":close<CR>") -- close current split window

keymap.set("n", "<D-t>", ":tabnew<CR>") -- open new tab
keymap.set("n", "<D-t>i", ":tabn<CR>") --  go to next tab
keymap.set("n", "<D-t>p", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<D-k>", ":tabclose<CR>") -- close current tab

-- adjust the split window
keymap.set("n", "<up>", ":res -5<CR>")
keymap.set("n", "<down>", ":res +5<CR>")
keymap.set("n", "<right>", ":vertical resize+5<CR>")
keymap.set("n", "<left>", ":vertical resize-5<CR>")

-- show absolute file path
keymap.set("n", "<C-g>", ":echo expand('%:p')<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- Hop
keymap.set("n", "<leader>j", ":HopLine<CR>")
keymap.set("n", "mk", ":HopPattern<CR>")
keymap.set("n", "ml", ":HopWord<CR>")

-- diffview
keymap.set("n", "<leader>fd", ":DiffviewFileHistory<CR>")

-- gitsigns
keymap.set("n", "<leader>gm", ":Gitsigns blame_line<CR>")
keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")
keymap.set("n", "<leader>gh", ":Gitsigns toggle_current_line_blame<CR>")

-- Telescope file and search commands
opts.desc = "Find files within current working directory, respects .gitignore"
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)

opts.desc = "Find string in current working directory as you type"
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", opts)

opts.desc = "Find string under cursor in current working directory"
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", opts)

opts.desc = "List open buffers in current Neovim instance"
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)

opts.desc = "List available help tags"
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

opts.desc = "Fuzzy find in current buffer"
keymap.set("n", "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)

opts.desc = "List recently opened files"
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", opts)

-- Telescope git commands
opts.desc = "List all git commits (use <CR> to checkout)"
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts) -- ["gc" for git commits]

opts.desc = "List git commits for current file/buffer (use <CR> to checkout)"
keymap.set("n", "<leader>gw", "<cmd>Telescope git_bcommits<CR>", opts) -- ["gw" for git buffer commits]

opts.desc = "List git branches (use <CR> to checkout)"
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts) -- ["gb" for git branch]

opts.desc = "List current changes per file with diff preview"
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts) -- ["gs" for git status]

opts.desc = "Show LSP references"
keymap.set("n", "gF", "<cmd>Telescope lsp_references<CR>", opts) -- Show definition and references

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show LSP implementations

opts.desc = "Show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- Show diagnostics for current buffer


-- Neogit
keymap.set("n", "<leader>gg", ":Neogit<CR>")

-- Lspsaga Keymaps
-- Diagnostic-related mappings
opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>k", ":Lspsaga show_line_diagnostics<CR>", opts) -- Show diagnostics for current line

opts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts) -- Jump to previous diagnostic in buffer

opts.desc = "Go to next diagnostic"
keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts) -- Jump to next diagnostic in buffer

opts.desc = "Show Lspsaga workspace diagnostics"
keymap.set("n", "<leader>dw", ":Lspsaga show_workspace_diagnostics<CR>", opts) -- Show diagnostics for entire workspace

opts.desc = "Show Lspsaga buffer diagnostics"
keymap.set("n", "<leader>db", ":Lspsaga show_buf_diagnostics<CR>", opts) -- Show diagnostics for current buffer

-- Terminal toggle
opts.desc = "Toggle Lspsaga terminal"
keymap.set("n", "<leader>t", ":Lspsaga term_toggle<CR>", opts) -- Toggle terminal in normal mode
keymap.set("t", "<leader>tt", ":Lspsaga term_toggle<CR>", opts) -- Toggle terminal in terminal mode
keymap.set({"n", "t"}, "<C-t>", ":Lspsaga term_toggle<CR>", opts) -- Toggle terminal in both modes

-- Finder and outline
opts.desc = "Show Lspsaga finder"
keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- Show definition and references

opts.desc = "Show Lspsaga outline"
keymap.set("n", "<leader>oo", "<cmd>Lspsaga outline<CR>", opts) -- Show outline on right-hand side

-- Definition and type definition
opts.desc = "Show Lspsaga peek definition"
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek definition and allow edits in window

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Lspsaga lsp_type_definitions<CR>", opts) -- Show LSP type definitions

-- Code action
opts.desc = "See available Lspsaga code actions"
keymap.set("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts) -- Show available code actions

-- Hover documentation
opts.desc = "Show Lspsaga hover documentation"
keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts) -- Show documentation for cursor position

-- LSP management
opts.desc = "Restart LSP"
keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- Restart LSP if necessary

-- Native LSP and Vim Keymaps
opts.desc = "Go to declaration"
keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration

opts.desc = "See available code actions"
keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts) -- Show code actions (normal and visual mode)

opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename using LSP

opts.desc = "Show LSP hover documentation"
keymap.set("n", "gH", vim.lsp.buf.hover, opts) -- Show documentation for cursor position

-- auto-session
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- barbar
-- Move to previous/next
keymap.set('n', '<S-H>', '<Cmd>BufferPrevious<CR>', opts)
keymap.set('n', '<S-L>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap.set('n', '<S-B>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap.set('n', '<S-F>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap.set('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap.set('n', '<C-c>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode

keymap.set('n', 'mp', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...

keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
