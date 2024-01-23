return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.5',

  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
    vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
  end
}
