return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.5',

  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local builtin = require('telescope.builtin')
    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set

    keymap('n', '<leader>ff', builtin.find_files, opts)
    keymap('n', '<leader>fg', builtin.live_grep, opts)
    keymap('n', '<leader>fb', builtin.buffers, opts)
    keymap('n', '<leader>fh', builtin.help_tags, opts)
    keymap('n', '<C-p>', builtin.git_files, opts)
    --[[
    keymap('n', '<leader>fws', function()
      local word = vim.fn.expand('<cword>')
      builtin.grep_string({ search = word })
    end)
    keymap('n', '<leader>fWs', function()
      local word = vim.fn.expand('<cWORD>')
      builtin.grep_string({ search = word })
    end)
    ]]--
  end
}
