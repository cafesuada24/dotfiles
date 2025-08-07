-- REQUIREMENT: neovim v11.x.x
--
local g = vim.g

g.markdown_recommended_style = 0

-- Providers
g.python3_host_prog = '/home/serein/miniforge3/envs/nvim/bin/python'


local opt = vim.opt

opt.confirm = true
opt.showmode = false -- We have status line
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Menu
opt.completeopt = 'menu,menuone,noselect'


-- Smoothscroll
opt.smoothscroll = true


-- Wrap
opt.wrap = false

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

-- Popup
opt.pumblend = 10
opt.pumheight = 10

-- Grep
opt.grepprg = 'rg --vimgrep'

-- Case
opt.smartcase = true

-- Syntax
opt.syntax = 'off'
opt.showmatch = true

-- Tabcompletion
opt.wildmode = 'longest:full,full'

-- Cursor
opt.cursorline = true

-- Splitting
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = 'screen'

-- Ruler
opt.ruler = true

-- Clipboard
opt.clipboard = 'unnamedplus'

-- UI
opt.winborder = 'rounded'

