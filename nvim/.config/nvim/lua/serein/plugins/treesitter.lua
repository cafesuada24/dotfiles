return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function () 
    local configs = require('nvim-treesitter.configs')

    configs.setup({
        ensure_installed = { 'lua', 'vimdoc', 'javascript', 'html', 'css', 'python', 'cpp', 'markdown', 'bash', 'markdown_inline' },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
  end
}
