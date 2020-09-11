"""""""""""""""""""""""""""""
" Goyo
"""""""""""""""""""""""""""""

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set number relativenumber
  set nu rnu
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"""""""""""""""""""""""""""""
" Lightline
"""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:lightline#bufferline#show_number  = 2
"let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#clickable = 1

"""""""""""""""""""""""""""""""""
" JSX colors
"""""""""""""""""""""""""""""""""

hi tsxTagName guifg=#E06C75 ctermfg=Blue cterm=bold
hi tsxCloseString guifg=#F99575 ctermfg=DarkBlue
hi tsxCloseTag guifg=#F99575 ctermfg=DarkYellow
hi tsxCloseTagName guifg=#F99575 ctermfg=Red
hi tsxAttributeBraces guifg=#F99575 ctermfg=DarkBlue
hi tsxEqual guifg=#F99575 ctermfg=Blue
hi tsxAttrib guifg=#F8BD7F ctermfg=DarkYellow cterm=italic

"""""""""""""""""""""""""""""""""
" Ranger
"""""""""""""""""""""""""""""""""

let g:ranger_map_keys = 0
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

"""""""""""""""""""""""""""""""""
" notational-fzf
"""""""""""""""""""""""""""""""""

let g:nv_search_paths = ['~/wiki', '~/writing', '~/code', 'docs.md' , './notes.md']
nnoremap <silent> <c-s> :NV<CR>





"""""""""""""""""""""""""""""""""
" fzf preview
"""""""""""""""""""""""""""""""""

let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'
let g:fzf_preview_use_dev_icons = 1
