-- REQUIREMENT: neovim v11.x.x
--
local g = vim.g

g.markdown_recommended_style = 0

-- Providers
g.python3_host_prog = '/home/serein/miniforge3/envs/nvim/bin/python'

-- LSP
g.completion_mode = 'blink'


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

-- Search
opt.smartcase = true
opt.ignorecase = true

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
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- UI
opt.winborder = 'rounded'

-- Licenses
g.tmplvim_author = 'Cafesuada'
g.tmplvim_default_environment = 'personal'
g.tmplvim_vars = {
  email = 'connghiencafe@protonmail.com'
}


-- Performance
opt.synmaxcol = 300
opt.redrawtime = 10000
opt.maxmempattern = 20000

opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup before writing
opt.swapfile = false -- Don't create swap files

-- Undo
opt.undofile = true -- Persistent undo
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.cache/nvim/undodir") -- Undo directory
local undodir = vim.fn.expand("~/.cache/nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

g.markdown_recommended_style = 0

vim.filetype.add({
  extension = {
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
