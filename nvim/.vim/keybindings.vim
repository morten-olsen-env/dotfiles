" ===========================
" Non-leader keybindings
" ===========================

nmap <C-p> :Files<CR>
" Escape search with esc
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" move among buffers with Meta
map <M-k> :bnext<CR>
map <M-j> :bprev<CR>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" remove search highlights"
nmap <silent> ,/ :nohlsearch<CR>

" edit file as sudo
cmap w!! w !sudo tee % >/dev/null

" learner mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nmap s <Plug>(easymotion-s2)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

