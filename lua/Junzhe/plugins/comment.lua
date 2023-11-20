return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        -- import comment plugin safely
        local comment = require("Comment")

        local ts_context_commentstring = require("ts_context_commentstring")

        ts_context_commentstring.setup({
            enable_autocmd = false,
        })

        vim.g.skip_ts_context_commentstring_module = true

        -- enable comment
        comment.setup({
            -- for commenting tsx and jsx files
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
    end,
}
