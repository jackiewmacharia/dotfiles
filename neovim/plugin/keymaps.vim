" Key mappings

" ── nvim-tree ─────────────────────────────────────────────
nnoremap <C-b> :NvimTreeToggle<CR>
inoremap <C-b> <Esc>:NvimTreeToggle<CR>
nnoremap <C-t> :NvimTreeFocus<CR>

" ── File search (Telescope) ───────────────────────────────
nnoremap <C-p> :Telescope find_files<CR>
inoremap <C-p> <Esc>:Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>
inoremap <C-f> <Esc>:Telescope live_grep<CR>

" ── Code actions ──────────────────────────────────────────
nmap <C-.> <Plug>(coc-codeaction-cursor)
imap <C-.> <Esc><Plug>(coc-codeaction-cursor)

" ── Go to definition ──────────────────────────────────────
nmap <C-g> <Plug>(coc-definition)
imap <C-g> <Esc><Plug>(coc-definition)

" ── Find references ───────────────────────────────────────
nmap gr <Plug>(coc-references)

" ── Rename symbol ─────────────────────────────────────────
nmap <C-m> <Plug>(coc-rename)
imap <C-m> <Esc><Plug>(coc-rename)

" ── Toggle comment ────────────────────────────────────────
nmap <C-/> <Plug>NERDCommenterToggle
imap <C-/> <Esc><Plug>NERDCommenterToggle

" ── Undo/Redo ─────────────────────────────────────────────
nnoremap <C-z> u
inoremap <C-z> <Esc>ui

" ── Quit all panes ────────────────────────────────────────
nnoremap <C-q> :qa<CR>

" ── Buffer tabs ───────────────────────────────────────────
nnoremap <Tab> :BufferLineCycleNext<CR>
nnoremap <S-Tab> :BufferLineCyclePrev<CR>
nnoremap <C-w> :bdelete<CR>

" ── Git hunk navigation ───────────────────────────────────
nnoremap <C-j> :GitGutterNextHunk<CR>
nnoremap <C-k> :GitGutterPrevHunk<CR>

" ── Spell navigation ──────────────────────────────────────
nnoremap <C-,> [s
