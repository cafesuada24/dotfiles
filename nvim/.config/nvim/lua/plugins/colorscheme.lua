return {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.opt.background = 'dark'
        vim.opt.termguicolors = true
    end,
    config = function() 
        vim.cmd.colorscheme 'melange'
    end
}
