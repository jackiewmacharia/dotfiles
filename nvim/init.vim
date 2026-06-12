" Main Neovim config
" Settings in plugin/ and after/plugin/ are auto-loaded

set termguicolors

call plug#begin()
  " Snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'

  " Completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Editing
  Plug 'numToStr/Comment.nvim'
  Plug 'windwp/nvim-autopairs'

  " Navigation
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'

  " UI
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'folke/which-key.nvim'

  " Themes
  Plug 'folke/tokyonight.nvim'
  Plug 'nyoom-engineering/oxocarbon.nvim'
  Plug 'drewtempelmeyer/palenight.vim'

  " Git
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'tpope/vim-fugitive'

  " Syntax
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Markdown
  Plug 'MeanderingProgrammer/render-markdown.nvim'
call plug#end()
