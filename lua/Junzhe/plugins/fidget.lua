return {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function ()

        require("fidget").setup({
            window = {
                blend = 0,
            },
        })

    end
}
