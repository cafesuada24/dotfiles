local M = {}

M.init = function()
    local map = vim.keymap.set
    

    -- Keymappings

end

M.fzf = {
    {
        '<C-p>',
        '<cmd>FZF<cr>',
        silent = true,
        desc = 'Open FZF'
    },
}

return M
