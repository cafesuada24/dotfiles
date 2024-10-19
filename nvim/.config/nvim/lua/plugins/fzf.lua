return {
    dir = '/opt/fzf',
    -- 'junegunn/fzf',

    build = function()
        vim.fn['fzf#install']()
    end,

    opts = {},

    keys = require('config.keymaps').fzf,

}
