return {
    'folke/which-key.nvim',

    event = 'VeryLazy',

    opts = {
        defaults = {},
        spec = require('config.keymaps').which_key_spec,
    },

    keys = require('config.keymaps').which_key,
}
