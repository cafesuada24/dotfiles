local M = {}

M.init = function()
    local map = vim.keymap.set
    
    map('n', '<leader>nh', '<cmd>nohlsearch<CR>')

        -- Window Navigation
    map("n", "<C-h>", "<C-w>h")
    map("n", "<C-l>", "<C-w>l")
    map("n", "<C-k>", "<C-w>k")
    map("n", "<C-j>", "<C-w>j")
    

    -- Keymappings

end

M.fzf = {
    {
        '<C-p>',
        '<cmd>FZF<cr>',
        silent = true,
        desc = 'Open FZF'
    },
}

M.lspconfig = function(opts)
    local map = vim.keymap.set 
    -- Enable completion triggered by <c-x><c-o>
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    map('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
end
return M
