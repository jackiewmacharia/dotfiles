vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  auto_reload_on_write = true,
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    highlight_git = true,
    highlight_diagnostics = "name",
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        diagnostics = true,
      },
      git_placement = "after",
      diagnostics_placement = "after",
      glyphs = {
        git = {
          unstaged  = "M",
          staged    = "S",
          unmerged  = "!",
          renamed   = "R",
          untracked = "U",
          deleted   = "D",
          ignored   = "",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint    = "H",
      warning = "W",
      error   = "E",
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  filters = {
    dotfiles = false,
    custom = { "node_modules", "\\.git$", "dist" },
  },
})

local function set_git_highlights()
  -- Git status
  vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL",   { fg = "#9d7cd8" })
  vim.api.nvim_set_hl(0, "NvimTreeGitFileStagedHL",  { fg = "#c678dd" })
  vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL",     { fg = "#98c379" })
  vim.api.nvim_set_hl(0, "NvimTreeGitFileDeletedHL", { fg = "#e06c75" })
  vim.api.nvim_set_hl(0, "NvimTreeGitDirtyIcon",     { fg = "#9d7cd8" })
  vim.api.nvim_set_hl(0, "NvimTreeGitStagedIcon",    { fg = "#c678dd" })
  vim.api.nvim_set_hl(0, "NvimTreeGitNewIcon",       { fg = "#98c379" })
  vim.api.nvim_set_hl(0, "NvimTreeGitDeletedIcon",   { fg = "#e06c75" })
  -- Folders
  vim.api.nvim_set_hl(0, "NvimTreeFolderName",       { fg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#7aa2f7" })
  -- Diagnostics
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticErrorIcon",     { fg = "#e06c75" })
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticWarnIcon",      { fg = "#e5a95a" })
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticErrorFileHL",   { fg = "#e06c75" })
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticWarnFileHL",    { fg = "#e5a95a" })
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticErrorFolderHL", { fg = "#e06c75" })
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticWarnFolderHL",  { fg = "#e5a95a" })
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticHintIcon",      { fg = "#e5a95a" })
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticHintFileHL",    { fg = "#e5a95a" })
  vim.api.nvim_set_hl(0, "NvimTreeDiagnosticHintFolderHL",  { fg = "#e5a95a" })
end

-- Apply immediately after setup, and on every relevant event
set_git_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_git_highlights })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "NvimTree*",
  callback = set_git_highlights,
})

-- Open on startup and apply highlights after render
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
    vim.defer_fn(set_git_highlights, 200)
  end,
})

