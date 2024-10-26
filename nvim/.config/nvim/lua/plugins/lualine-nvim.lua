return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = function(_, opts)
        opts.sections = opts.sections or {}
        opts.sections.lualine_c = opts.sections.lualine_c or {}

        -- Integrate trouble
        local has_trouble, trouble = pcall(require, 'trouble')
        if has_trouble then
            local symbols = trouble.statusline({
                mode = 'lsp_document_symbols',
                group = {},
                title = false,
                filter = { range = true },
                format = '{kind_icon}{symbol.name:Normal}',
                hl_group = 'lualine_c_normal'
            })
            table.insert(opts.sections.lualine_c, {
                symbols.get,
                cond = symbols.has
            })
        end
    end,
}
