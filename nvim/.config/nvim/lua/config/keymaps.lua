local M = {}

M.init = function()
    local map = vim.keymap.set

    local opts = { noremap = true, silent = true }

    map('n', '<leader>nh', '<cmd>nohlsearch<CR>', opts)

    -- Window Navigation
    map('n', '<C-h>', '<C-w>h', opts)
    map('n', '<C-l>', '<C-w>l', opts)
    map('n', '<C-k>', '<C-w>k', opts)
    map('n', '<C-j>', '<C-w>j', opts)

    -- Window resizing
    map('n', '<C-Left>', '<C-w><', opts)
    map('n', '<C-Right>', '<C-w>>', opts)
    map('n', '<C-Up>', '<C-w>+', opts)
    map('n', '<C-Down>', '<C-w>-', opts)

    -- Keymappings
    map('n', '<C-c>', '<Esc>', opts)
    map('i', '<C-c>', '<Esc>', opts)
end

M.fzf = {
    {
        '<C-p>',
        '<cmd>FZF<cr>',
        silent = true,
        desc = 'Open FZF'
    },
}

M.fzf_lua = {
    {
        '<C-p>',
        "<cmd>lua require('fzf-lua').files()<CR>",
        silent = true,
        desc = 'FZF files'
    }
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

M.trouble = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    }
}

M.neo_tree = {
    {
        '<tab>',
        '<cmd>Neotree toggle<CR>',
        desc = 'Toggle neotree (ROOT Dir)',
        mode = 'n',
    },
    {
        '<leader>ge',
        '<cmd>Neotree toggle source=git_status<cr>',
        desc = 'Toggle neotree gitstatus',
        mode = 'n',
    },
    {
        '<leader>be',
        '<cmd>Neotree toggle source=buffers<cr>',
        desc = 'Toggle neotree buffers',
        mode = 'n',
    },
}


return M
