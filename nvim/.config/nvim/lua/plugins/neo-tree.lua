return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    cmd = 'Neotree',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    opts = {
        sources = { 'filesystem', 'buffers', 'git_status' },
        open_files_do_not_replace_types = { 'terminal', 'trouble', 'Trouble', 'qf', 'Outline' },
        filesystem = {
            use_libuv_file_watcher = true,
            follow_current_file = {
                enabled = true,
            },
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                    '__pycache__',
                    'node_modules'
                }
            },
        }
    },

    deactivate = function()
        vim.cmd([[Neotree close]])
    end,

    keys = require('config.keymaps').neo_tree,

    lazy = false,
}
