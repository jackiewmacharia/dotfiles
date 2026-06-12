require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local opts = { buffer = bufnr }
    vim.keymap.set('n', '<C-j>', gs.next_hunk, opts)
    vim.keymap.set('n', '<C-k>', gs.prev_hunk, opts)
    -- Stage/reset hunk under cursor
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, opts)
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, opts)
    -- Inline blame
    vim.keymap.set('n', '<leader>gb', gs.toggle_current_line_blame, opts)
  end,
})
