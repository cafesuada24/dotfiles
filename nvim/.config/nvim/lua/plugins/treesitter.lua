return {
    'nvim-treesitter/nvim-treesitter',

    lazy = false,

    build = ':TSUpdate',

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
        -- highlight = { enable = true },
        -- indent = { enable = true },
        -- sync_install = false,
        ensure_installed = {
            'bash',
            'c',
            'cpp',
            'json',
            'lua',
            'markdown',
            'markdown_inline',
            'python',
            'yaml',
            'vim',
            'vimdoc'
        },
        -- incremental_selection = {
        --     enable = true,
        --     keymaps = {
        --         init_selection = '<C-space>',
        --         node_incremental = '<C-space>',
        --         scope_incremental = false,
        --         node_decremental = '<bs>',
        --     },
        -- },
    },

    config = function(_, opts)
      nt = require("nvim-treesitter")
      nt.install(opts.ensure_installed)
      
      vim.api.nvim_create_autocmd('FileType', {
        pattern = opts.ensure_installed,
        callback = function() 
          vim.treesitter.start()
          -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- vim.wo.foldmethod = 'expr'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
}
