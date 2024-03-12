local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Set <space> as keymap leader
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Text moving
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- General
keymap('n', '<leader>nh', ':nohl<CR>', opts)

keymap('n', 'x', '"_x', opts)

keymap('n', '<leader>to', ':tabnew<CR>', opts)
keymap('n', '<leader>tx', ':tabclose<CR>', opts)
keymap('n', '<leader>tn', ':tabnext<CR>', opts)
keymap('n', '<leader>tp', ':tabprev<CR>', opts)

keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)


