return {
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        sync_install = false,
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
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<C-space>',
                node_incremental = '<C-space>',
                scope_incremental = false,
                node_decremental = '<bs>',
            },
        },
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
