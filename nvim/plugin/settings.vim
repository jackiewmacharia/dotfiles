" General settings

set showmatch               " show matching brackets
set ignorecase              " case insensitive search
set mouse=a                 " enable mouse click
set hlsearch                " highlight search results
set incsearch               " incremental search
set tabstop=2               " tab width
set softtabstop=2           " tab feel in insert mode
set expandtab               " tabs to spaces
set shiftwidth=2            " indent width
set autoindent              " match indent on new line
set number                  " line numbers
set wildmode=longest,list   " bash-like tab completions
set cc=80                   " 80 column guide
set clipboard=unnamedplus   " use system clipboard
set cursorline              " highlight current line
set spell                   " spell check
set noswapfile              " no swap files
set noequalalways           " prevent windows from auto-resizing
set backupdir=~/.cache/vim  " backup file location
set updatetime=1000         " used for autosave and gitgutter
set backspace=indent,eol,start  " backspace across lines

inoremap <S-Tab> <C-d>

filetype plugin indent on
syntax on

" Autosave after 1s of inactivity
autocmd CursorHold,CursorHoldI * silent! write

