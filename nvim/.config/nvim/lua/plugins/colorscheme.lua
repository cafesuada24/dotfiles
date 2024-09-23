return {
    "savq/melange-nvim",
    lazy = false,

    -- opts = {}
    config = function() 
	vim.opt.background = 'dark'
	vim.opt.termguicolors = true
	vim.cmd.colorscheme 'melange'
end
}
