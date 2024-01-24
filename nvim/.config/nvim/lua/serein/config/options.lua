local opt = vim.opt

-- Autowrite
opt.autowrite = true

-- Confirm to save changes before exiting modified buffer
opt.confirm = true

-- Format options
opt.formatoptions = 'jcroqlnt'

-- Grep
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'

-- Laststatus
opt.laststatus = 3

-- Popup blend
opt.pumblend = 10
opt.pumheight = 10

-- Sessions
-- opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp', 'folds' }

-- List mode
opt.list = true

-- Splitting
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = 'screen'


-- Clipboard
opt.clipboard = 'unnamedplus'

-- Encoding
opt.fileencoding = 'utf-8'

-- Number column
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- Sign column
opt.signcolumn = 'yes'

-- Searching
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Mouse
opt.mouse = 'a'

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.shiftround = true

-- Tab line
opt.showtabline = 2

-- Text wrap
opt.wrap = false

-- Swapfile
opt.swapfile = true

-- Timeoutlen
opt.timeoutlen = 1000

-- Update time
opt.updatetime = 300

-- Undofile
opt.undofile = true

-- Cursorline
opt.cursorline = true

-- Scrolloff
opt.scrolloff = 8
opt.sidescrolloff = 8

-- GUI font
opt.guifont = 'monospace:h17'

-- Conceal level
opt.conceallevel = 0

-- Completion
opt.completeopt = 'menu,menuone,noselect'

-- Popup menu
opt.pumheight = 10

-- Allow left-right wrap
--vim.cmd 'set whichwrap+=<,>,[,],h,l'
opt.whichwrap:append('<,>,[,],h,l')

-- Accept '-' as a keyword
opt.iskeyword:append('-')

-- Folding
-- opt.foldenable = false
opt.foldlevel = 99
opt.foldmethod = 'indent'

-- Netrw
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Termsguicolors
opt.termguicolors = true

-- Virtualblock
opt.virtualedit = 'block'

-- Command-line completion mode
opt.wildmode = 'longest:full,full'

-- Fillchars
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  -- fold = '⸱',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
