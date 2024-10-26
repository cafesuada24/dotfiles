return {
    'ibhagwan/fzf-lua',

    cmd = 'FzfLua',

    dependencies = {
        {
            dir = '/opt/fzf',
            buid = './install --bin',
        },

        'nvim-tree/nvim-web-devicons',
    },

    keys = require('config.keymaps').fzf_lua,

    opts = function(_, opts)
        local config = require('fzf-lua.config')
        local actions = require('fzf-lua.actions')

        -- Trouble integration
        local has_trouble, trouble = pcall(require, 'trouble.source.fzf')
        if has_trouble then
            config.defaults.actions.files['ctrl-t'] = trouble.actions.open
        end

        local img_previewer = nil
        for _, v in ipairs({
            { cmd = 'ueberzug', args = {} },
            { cmd = 'chafa', args = { '{file}', '--format=symbols' } },
            { cmd = 'viu', args = { '-b' } },
        }) do
            if vim.fn.executable(v.cmd) == 1 then
                img_previewer = vim.list_extend({ v.cmd }, v.args)
                break
            end
        end


        return vim.tbl_deep_extend('force', {
            fzf_colors = true,
            fzf_opts = {
                ['--no-scrollbar'] = true,
            },
            defaults = {
                formatter = 'path.dirname_first',
            },

            previewers = {
                builtin = {
                    extensions = {
                        ['png'] = img_previewer,
                        ['jpg'] = img_previewer,
                        ['jpeg'] = img_previewer,
                        ['gif'] = img_previewer,
                        ['webp'] = img_previewer,
                    },
                    ueberzug_scaler = 'fit_contain',
                },
            },
            ui_select = function(fzf_opts, items)
            end,
            winopts = {
                width = 0.8,
                height = 0.8,
                row = 0.5,
                col = 0.5,
                preview = {
                    scrollchars = { "┃", "" },
                },
            },
        })
    end,
}
