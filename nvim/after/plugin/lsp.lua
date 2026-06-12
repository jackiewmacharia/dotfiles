require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed    = { 'pyright', 'ts_ls', 'jsonls', 'yamlls', 'bashls' },
  automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, bufnr)
  local map = function(mode, key, fn, desc)
    vim.keymap.set(mode, key, fn, { buffer = bufnr, desc = desc })
  end

  map('n', 'K',     vim.lsp.buf.hover,          'Show docs')
  map('n', '<C-.>', vim.lsp.buf.code_action,     'Code action')
  map('n', '<C-g>', vim.lsp.buf.definition,      'Go to definition')
  map('n', 'gr',    vim.lsp.buf.references,      'Find references')
  map('n', '<F2>',  vim.lsp.buf.rename,          'Rename symbol')
  map('n', 'gy',    vim.lsp.buf.type_definition, 'Go to type definition')
  map('n', 'gi',    vim.lsp.buf.implementation,  'Go to implementation')
  map('i', '<C-.>', vim.lsp.buf.code_action,     'Code action')
  map('i', '<C-g>', vim.lsp.buf.definition,      'Go to definition')
  map('i', '<F2>',  vim.lsp.buf.rename,          'Rename symbol')
end

-- nvim-lspconfig v3 API
vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach    = on_attach,
})

vim.lsp.enable({ 'pyright', 'ts_ls', 'jsonls', 'yamlls', 'bashls' })

vim.diagnostic.config({
  virtual_text     = true,
  signs            = true,
  underline        = true,
  update_in_insert = true,
  float            = { border = 'rounded', source = true },
})
