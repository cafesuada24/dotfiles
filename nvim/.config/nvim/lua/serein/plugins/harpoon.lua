return {
  'ThePrimeagen/harpoon',

  dependencies = { 'nvim-lua/plenary.nvim' },

  event = 'VeryLazy',

  config = function()
    -- local harpoon = require('harpoon')

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    function mark_file()
      require("harpoon.mark").add_file()
      vim.notify('File added!')
    end

    keymap('n', '<leader>a', mark_file, opts)
    keymap('n', '<TAB>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
  end
}
