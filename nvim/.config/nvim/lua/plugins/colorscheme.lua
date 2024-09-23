return {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() 
	vim.opt.background = 'dark'
	vim.opt.termguicolors = true
	vim.cmd.colorscheme 'melange'
    end
}
