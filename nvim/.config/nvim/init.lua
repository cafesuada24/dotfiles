-- Setup <leader> and <localleader>
-- This is required by Lazy.nvim
-- Other configurations
require('config.options')
require('config.leader')
require('core.lazy')
require('config.keymaps').init()
require('config.autocmd')
require('core.lsp')
