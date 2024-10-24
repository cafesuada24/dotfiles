return {
  'folke/trouble.nvim',
  opts = {
    modes = {
        lsp = {
                win = { position = 'right' }
            },
        }
    }, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = require('config.keymaps').trouble,
}
