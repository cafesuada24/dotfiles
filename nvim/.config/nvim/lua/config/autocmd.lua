if not table.unpack then
  table.unpack = unpack
end

local function augroup(name)
  return vim.api.nvim_create_augroup('commands_' .. name, { clear = true })
end

local function debounce(ms, fn)
  local timer = vim.uv.new_timer()
  return function(...)
    local argv = { ... }
    timer:start(ms, 0, function()
      timer:stop()
      vim.schedule_wrap(fn)(table.unpack(argv))
    end)
  end
end

local completion = vim.g.completion_mode or 'blink' -- or 'native' for built-in completion
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup('lsp_attach'),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buf = args.buf
    if not client then
      return
    end
    -- Built-in completion
    if completion == 'native' and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    -- Inlay hints
    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
    if client:supports_method('textDocument/documentColor') then
      vim.lsp.document_color.enable(true, { bufnr = buf }, {
        style = 'virtual',
      })
    end

    local keymaps = require('config.keymaps').lsp_keymaps
    for _, km in ipairs(keymaps) do
      -- Only bind if there's no `has` requirement, or the server supports it
      if not km.has or client.server_capabilities[km.has] then
        vim.keymap.set(
          km.mode or 'n',
          km.keys,
          km.func,
          { buffer = buf, desc = 'LSP: ' .. km.desc, nowait = km.nowait }
        )
      end
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost', 'InsertLeave' }, {
  group = augroup('lint'),
  callback = debounce(100, function()
    require('lint').try_lint()
  end)
})

-- Ruff
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup('lsp_attach_disable_ruff_hover'),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})
