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

    opts = {
        fzf_colors = true,
        files = {
            git_icons = false,
            file_icons = false,
        },
        fzf_opts = {
            -- ['--no-scrollbar'] = true,
            ['--ansi'] = false,
            ['--info'] = 'default',
            ['--layout'] = 'reverse-list',
            ['--no-scrollbar'] = true,
        },
        -- defaults = {
        --     formatter = 'path.dirname_first',
        -- },
        previewers = {
            -- builtin = {
            --     extensions = {
            --         ['png'] = img_previewer,
            --         ['jpg'] = img_previewer,
            --         ['jpeg'] = img_previewer,
            --         ['gif'] = img_previewer,
            --         ['webp'] = img_previewer,
            --     },
            --     ueberzug_scaler = 'fit_contain',
            -- },
            codeaction_native = {
                pager = [[delta --side-by-side width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit']]
            }
        },
        ui_select = function(fzf_opts, items)
            return vim.tbl_deep_extend("force", fzf_opts, {
                prompt = " ",
                winopts = {
                    title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
                    title_pos = "center",
                },
            }, fzf_opts.kind == "codeaction_native" and {
                winopts = {
                    layout = "vertical",
                    -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
                    height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
                    width = 0.5,
                    preview = not vim.tbl_isempty(vim.lsp.get_active_clients({ bufnr = 0, name = "vtsls" })) and {
                        layout = "vertical",
                        vertical = "down:15,border-top",
                        hidden = "hidden",
                    } or {
                        layout = "vertical",
                        vertical = "down:15,border-top",
                    },
                },
            } or {
                winopts = {
                    width = 0.5,
                    -- height is number of items, with a max of 80% screen height
                    height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
                },
            })
        end,
        winopts = {
            width = 0.8,
            height = 0.8,
            row = 0.5,
            col = 0.5,
            preview = {
                scrollchars = { '┃', '' },
            },
        },
        -- winopts = {
        --     -- width = 0.8,
        --     -- height = 0.8,
        --     -- row = 0.5,
        --     -- col = 0.5,
        --     height = 0.7,
        --     width = 0.55,
        --     preview = {
        --         scrollbar = false,
        --         layout = 'vertical',
        --         vertical = 'up:40%',
        --         -- scrollchars = { "┃", "" },
        --         default = vim.fn.executable('bat') and 'bat_native' or 'builtin'
        --     },
        -- },
        lsp = {
            code_actions = {
                previewer = vim.fn.executable('delta') == 1 and 'codeaction_native' or nil,
            }
        },
    }
}
