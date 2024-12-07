return {
  'nvim-lualine/lualine.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  event = 'VeryLazy',

  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = ' '
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,

  opts = function(_, opts)
    opts.options = {
      theme = 'auto',
      globalstatus = vim.o.laststatus == 3,
      disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'ministarter' } },
    }
    opts.sections = opts.sections or {}
    opts.sections.lualine_c = opts.sections.lualine_c or {}
    opts.sections.lualine_y = {
      { 'progress', separator = ' ',                  padding = { left = 1, right = 0 } },
      { 'location', padding = { left = 0, right = 1 } },
    }
    opts.sections.lualine_z = {
      function()
        return ' ' .. os.date('%R')
      end,
    }
    opts.extensions = { 'neo-tree', 'lazy' }


    -- -- Integrate trouble
    -- local has_trouble, trouble = pcall(require, 'trouble')
    -- if has_trouble then
    --   local symbols = trouble.statusline({
    --     -- mode = 'lsp_document_symbols',
    --     mode = 'symbols',
    --     group = {},
    --     title = false,
    --     filter = { range = true },
    --     format = '{kind_icon}{symbol.name:Normal}',
    --     hl_group = 'lualine_c_normal'
    --   })
    --   table.insert(opts.sections.lualine_c, {
    --     symbols.get,
    --     cond = symbols.has
    --   })
    -- end
  end,
}
