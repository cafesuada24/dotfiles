-- local has_wk, wk = pcall(require, 'which-key')
local M = {}

M.init = function()
    local map = vim.keymap.set

    local opts = { noremap = true, silent = true }

    -- Keymappings
    map({ 'i', 'n' }, '<C-c>', '<Esc>', opts)

    -- Clear search with <esc>
    map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and Clear hlsearch' })

    -- Window Navigation
    map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
    map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
    map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
    map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

    -- Resize window using <ctrl> arrow keys
    map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
    map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
    map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
    map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

    -- Buffer
    map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
    map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

    -- Windows
    map('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
    map('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })

    -- better indenting
    map('v', '<', '<gv')
    map('v', '>', '>gv')

    -- Tabs
    map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
    map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
    map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
    map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })
    map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
    map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
    map('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
end

M.fzf_lua = {
    {
        '<C-p>',
        '<cmd>lua require("fzf-lua").files()<CR>',
        silent = true,
        desc = 'FZF files'
    },
    {
        '<leader>ca',
        '<cmd>FzfLua lsp_code_actions<cr>',
        desc = 'Open code action',
        mode = { 'n', 'v' }
    },

    -- git
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>',                                                             desc = 'Commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>',                                                              desc = 'Status' },

    -- search
    { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>',                                                    desc = 'Document Diagnostics' },
    { '<leader>sq', '<cmd>FzfLua quickfix<cr>',                                                                desc = 'Quickfix List' },

    -- lsp integration
    { 'gd',         '<cmd>FzfLua lsp_definitions     jump_to_single_result=true ignore_current_line=true<cr>', desc = 'Goto Definition' },
    { 'gr',         '<cmd>FzfLua lsp_references      jump_to_single_result=true ignore_current_line=true<cr>', desc = 'References',            nowait = true },
    { 'gI',         '<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>', desc = 'Goto Implementation' },
    { 'gy',         '<cmd>FzfLua lsp_typedefs        jump_to_single_result=true ignore_current_line=true<cr>', desc = 'Goto T[y]pe Definition' },
}

M.lspconfig = function(opts)
    local map = vim.keymap.set
    -- Enable completion triggered by <c-x><c-o>
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    -- map('n', 'gd', vim.lsp.buf.definition, opts)
    -- map('n', 'gI', vim.lsp.buf.implementation, opts)
    -- map('n', 'gy', vim.lsp.buf.type_definition, opts)
    -- map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gK', vim.lsp.buf.signature_help, opts)
    map('i', '<C-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<leader>cr', vim.lsp.buf.rename, opts)
    -- formatting
    map({ 'n', 'v' }, '<leader>cf', function()
        vim.lsp.buf.format({ async = true })
    end, { desc = 'Format' })
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
    },
    {
        '[q',
        function()
            if require('trouble').is_open() then
                require('trouble').prev({ skip_groups = true, jump = true })
            else
                local ok, err = pcall(vim.cmd.cprev)
                if not ok then
                    vim.notify(err, vim.log.levels.ERROR)
                end
            end
        end,
        desc = 'Previous Trouble/Quickfix Item',
    },
    {
        ']q',
        function()
            if require('trouble').is_open() then
                require('trouble').next({ skip_groups = true, jump = true })
            else
                local ok, err = pcall(vim.cmd.cnext)
                if not ok then
                    vim.notify(err, vim.log.levels.ERROR)
                end
            end
        end,
        desc = 'Next Trouble/Quickfix Item',
    },
}

M.neo_tree = {
    {
        '<leader>fe',
        '<cmd>Neotree toggle<CR>',
        desc = 'Toggle neotree (ROOT Dir)',
        mode = 'n',
    },
    { '<tab>', '<leader>fe', desc = 'Explorer NeoTree (Root Dir)', remap = true },
    -- { '<leader>E', '<leader>fE', desc = 'Explorer NeoTree (cwd)', remap = true },
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

M.gitsigns = function(gs, bufnr)
    local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    map('n', ']h', function()
        if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
        else
            gs.nav_hunk('next')
        end
    end, 'Next Hunk')
    map('n', '[h', function()
        if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
        else
            gs.nav_hunk('prev')
        end
    end, 'Prev Hunk')
    map('n', ']H', function() gs.nav_hunk('last') end, 'Last Hunk')
    map('n', '[H', function() gs.nav_hunk('first') end, 'First Hunk')
    map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
    map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
    map('n', '<leader>ghS', gs.stage_buffer, 'Stage Buffer')
    map('n', '<leader>ghu', gs.undo_stage_hunk, 'Undo Stage Hunk')
    map('n', '<leader>ghR', gs.reset_buffer, 'Reset Buffer')
    map('n', '<leader>ghp', gs.preview_hunk_inline, 'Preview Hunk Inline')
    map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Blame Line')
    map('n', '<leader>ghB', function() gs.blame() end, 'Blame Buffer')
    map('n', '<leader>ghd', gs.diffthis, 'Diff This')
    map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Diff This ~')
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
end

M.which_key = {
    {
        '<leader>?',
        function()
            require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
    },
}

M.which_key_spec = {
    {
        mode = { 'n', 'v' },
        { '<leader><tab>', group = 'tabs' },
        { '<leader>c', group = 'code' },
        { '<leader>f', group = 'file/find' },
        { '<leader>g', group = 'git' },
        { '<leader>gh', group = 'hunks' },
        { '<leader>q', group = 'quit/session' },
        { '<leader>s', group = 'search' },
        { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
        { '<leader>x', group = 'diagnostics/quickfix', icon = { icon = '󱖫 ', color = 'green' } },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'gs', group = 'surround' },
        { 'z', group = 'fold' },
        {
            '<leader>b',
            group = 'buffer',
            expand = function()
                return require('which-key.extras').expand.buf()
            end,
        },
        {
            '<leader>w',
            group = 'windows',
            proxy = '<c-w>',
            expand = function()
                return require('which-key.extras').expand.win()
            end,
        },
        -- better descriptions
        { 'gx', desc = 'Open with system app' },
    },
}

return M
-- if not has_wk then
--     return M
-- end
--
-- local N = {}
--
-- N.init = function()
--     wk.add({
--         { '<leader>nh', '<cmd>nohlsearch<cr>', desc = 'Clear Search Highlight' },
--         {'<C-h>', '<C-w>h', 'Move to Left Window' },
--         {'<C-l>', '<C-w>l', desc = 'Move to Right Window'},
--         ['<C-k>'] = { '<C-w>k', 'Move to Upper Window' },
--         ['<C-j>'] = { '<C-w>j', 'Move to Lower Window' },
--         ['<C-Left>'] = { '<C-w><', 'Resize Window Left' },
--         ['<C-Right>'] = { '<C-w>>', 'Resize Window Right' },
--         ['<C-Up>'] = { '<C-w>+', 'Resize Window Up' },
--         ['<C-Down>'] = { '<C-w>-', 'Resize Window Down' },
--     }, { mode = 'n', noremap = true, silent = true })
--
--     wk.register({
--         ['<C-c>'] = { '<Esc>', 'Escape' },
--     }, { mode = { 'n', 'i' }, noremap = true, silent = true })
-- end
--
-- N.lspconfig = function()
--     wk.add({
--         { '<leader>l',   group = 'LSP' },
--         { '<leader>ld',  vim.lsp.buf.definition,     desc = 'Go to Definition' },
--         { '<leader>lD',  vim.lsp.buf.declaration,    desc = 'Go to Declaration' },
--         { '<leader>li',  vim.lsp.buf.implementation, desc = 'Go to Implementation' },
--         { '<leader>lr',  vim.lsp.buf.references,     desc = 'Find References' },
--         { '<leader>ls',  vim.lsp.buf.signature_help, desc = 'Signature Help' },
--         { '<leader>lh',  vim.lsp.buf.hover,          desc = 'Hover Documentation' },
--         { '<leader>lf',  vim.lsp.buf.format,         desc = 'Format Document' },
--         { '<leader>la',  vim.lsp.buf.code_action,    desc = 'Code Action' },
--         { '<leader>lrn', vim.lsp.buf.rename,         desc = 'Rename Symbol' },
--         { '<leader>ldg', vim.diagnostic.open_float,  desc = 'Show Diagnostics' },
--         { '<leader>ldn', vim.diagnostic.goto_next,   desc = 'Next Diagnostic' },
--         { '<leader>ldp', vim.diagnostic.goto_prev,   desc = 'Previous Diagnostic' },
--     })
-- end
--
-- return N
