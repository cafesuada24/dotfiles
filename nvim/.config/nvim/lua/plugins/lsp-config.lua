return {
    'neovim/nvim-lspconfig',

    event = { 'BufReadPre', 'BufNewFile' },

    lazy = false,

    dependencies = {
        'mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },

    opts = function()
        local ret = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                spacing = 4,
                source = 'if_many',
                prefix = '●',
                -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                -- this only works on a recent 0.10.0 build. Will be set to '●' when not supported
                -- prefix = 'icons',
                },
                severity_sort = true,
            },
            inlay_hints = {
                enabled = true,
                exclude = { 'vue' },
            },
            codelens = {
                enabled = true,
            },
            document_highlight = {
                enabled = true,
            },
            servers = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                    codeLens = {
                        enable = true,
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                    doc = {
                        privateName = { '^_' },
                    },
                    hint = {
                        enable = true,
                        setType = false,
                        paramType = true,
                        paramName = 'Disable',
                        semicolon = 'Disable',
                        arrayIndex = 'Disable',
                    },
                },
            }
        }

        return ret
    end,

    config = function(_, opts)
        local nvim_lsp = require('lspconfig')
        -- nvim_lsp.setup(opts)

        local capabilities = require('cmp').default_capabilities
        require('mason-lspconfig').setup_handlers({
            function (server_name)
                nvim_lsp[server_name].setup({
                    capabilities = capabilities,
                })
            end,
        })
    end
}
