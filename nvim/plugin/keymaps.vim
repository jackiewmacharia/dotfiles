" Key mappings
" LSP keys (K, Ctrl+., Ctrl+g, gr, F2, gy, gi) are set per-buffer in lsp.lua

let mapleader = " "

" ── nvim-tree ─────────────────────────────────────────────
nnoremap <C-b> :NvimTreeToggle<CR>
inoremap <C-b> <Esc>:NvimTreeToggle<CR>
nnoremap <C-t> :NvimTreeFocus<CR>

" ── File search (Telescope) ───────────────────────────────
nnoremap <C-p> :Telescope find_files<CR>
inoremap <C-p> <Esc>:Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>
inoremap <C-f> <Esc>:Telescope live_grep<CR>

" ── Undo/Redo ─────────────────────────────────────────────
nnoremap <C-z> u
inoremap <C-z> <Esc>ui

" ── Quit all panes ────────────────────────────────────────
nnoremap <C-q> :qa<CR>

" ── Buffer tabs ───────────────────────────────────────────
nnoremap <Tab> :BufferLineCycleNext<CR>
nnoremap <S-Tab> :BufferLineCyclePrev<CR>
nnoremap <leader>bd :bdelete<CR>

" ── Spell navigation ──────────────────────────────────────
nnoremap <C-,> [s
