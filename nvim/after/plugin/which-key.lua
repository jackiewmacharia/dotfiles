local wk = require('which-key')

wk.setup({})

wk.add({
  -- File tree
  { '<C-b>',      desc = 'Toggle file tree' },
  { '<C-t>',      desc = 'Focus file tree' },
  -- Search
  { '<C-p>',      desc = 'Find files' },
  { '<C-f>',      desc = 'Live grep' },
  -- LSP (CoC)
  { '<C-.>',      desc = 'Code action' },
  { '<C-g>',      desc = 'Go to definition' },
  { 'gr',         desc = 'Find references' },
  { '<F2>',       desc = 'Rename symbol' },
  -- Buffers
  { '<Tab>',      desc = 'Next buffer' },
  { '<S-Tab>',    desc = 'Prev buffer' },
  { '<leader>bd', desc = 'Close buffer' },
  -- Git
  { '<C-j>',      desc = 'Next git hunk' },
  { '<C-k>',      desc = 'Prev git hunk' },
  { '<leader>g',  group = 'Git' },
  { '<leader>gb', desc = 'Toggle line blame' },
  { '<leader>h',  group = 'Hunk' },
  { '<leader>hs', desc = 'Stage hunk' },
  { '<leader>hr', desc = 'Reset hunk' },
})

