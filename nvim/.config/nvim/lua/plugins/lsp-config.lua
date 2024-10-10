return {
    'neovim/nvim-lspconfig',

    dependencies = {
        -- 'mason.nvim',
        -- 'mason-lspconfig.nvim'
        'mason-lspconfig.nvim'
    },

    -- lazy = false,
    
    -- config = function()
    --     require('mason').setup({})
    --     require('mason-lspconfig').setup({
    --     })
    --
    --     -- local lspconfig = require('lspconfig')
    --
    --     -- lspconfig.pyright.setup({})
    --     -- vim.api.nvim_create_autocmd('LspAttach', {
    --     -- end
    --     --     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    --     --     callback = function(ev)
    --     --         -- Enable completion triggered by <c-x><c-o>
    --     --         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    --     --         -- Buffer local mappings.
    --     --         -- See `:help vim.lsp.*` for documentation on any of the below functions
    --     --         local opts = { buffer = ev.buf }
    --     --         require('config.keymaps').lspconfig(opts)
    --     --     end
    --     -- })
    -- end
}
