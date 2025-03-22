return {
  'mfussenegger/nvim-lint',

  event = {
    'BufReadPre',
    'BufNewFile',
  },

  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      cpp = { 'cpplint' },
      -- python = { 'pylint' },
    }

    -- lint.linters.pylint.cmd = 'python'
    -- local newargs = {'-m', 'pylint'}
    -- for i = #newargs, 1, -1 do
    --   table.insert(lint.linters.pylint.args, 1, newargs[i])
    -- end
  end
}
