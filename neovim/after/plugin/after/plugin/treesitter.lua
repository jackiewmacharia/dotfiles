require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "bash", "markdown", "markdown_inline" },
  auto_install = true,
  highlight = { enable = true },
})
