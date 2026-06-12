local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

configs.setup({
  ensure_installed = {
    "lua", "vim", "vimdoc",
    "python", "javascript", "typescript",
    "bash", "markdown", "markdown_inline",
  },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
})

