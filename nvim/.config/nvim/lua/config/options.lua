local opt = vim.opt
local g = vim.g

-- Encoding
opt.encoding = 'utf-8'

-- Scroll
opt.scrolloff = 10

-- Backup
opt.backup = false
opt.writebackup = false

-- Update
opt.updatetime = 300

-- Terminal
opt.termguicolors = true

-- Number column
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.shiftround = true

-- Case
opt.smartcase = true

-- Syntax
opt.syntax = 'off'
opt.showmatch = true

-- Tabcompletion
opt.wildmode = 'list:longest'

-- Cursor
opt.cursorline = true

-- Splitting
opt.splitright = true
opt.splitbelow = true

-- Ruler
opt.ruler = true

-- Clipboard
opt.clipboard = 'unnamedplus'

-- Providers
g.python3_host_prog = '/home/serein/miniforge3/envs/nvim/bin/python'
