return {
    'junegunn/fzf.vim',
    enabled = false,

    dependencies = {
        {
            dir = '/opt/fzf',
            build = function()
                vim.fn['fzf#install']()
            end,
        }
    },


    -- init = function()
    --     vim.cmd([[
    --         let g:fzf_vim = {}
    --         let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
    --     ]])
    -- end,

    keys = require('config.keymaps').fzf,

    config = function()
        local g = vim.g
        g.fzf_vim = {}

        g.fzf_vim.preview_window = {'up:30%', 'ctrl-/'}
    end,

    lazy = false
}
