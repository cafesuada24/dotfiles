local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Set <space> as keymap leader
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
