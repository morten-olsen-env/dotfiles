let g:vimwiki_list = [
    \{'path': '~/wiki/index.wiki'}
\]

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

colorscheme moonfly

let wiki_1 = {}
let wiki_1.path = '~/wiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}




""""""""""""""""""""""""
" startify
""""""""""""""""""""""""

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_padding_left = 6
let g:startify_custom_header = [
      \"",
      \"     ..|'''.|                             '||'                 ",
      \"   .|'     '    ...   ... ..  ... ...      ||  .. ...     .... ",
      \"   ||         .|  '|.  ||' ''  ||'  ||     ||   ||  ||  .|   ''",
      \"   '|.      . ||   ||  ||      ||    |     ||   ||  ||  ||     ",
      \"    ''|....'   '|..|' .||.     ||...'     .||. .||. ||.  '|...'",
      \"                               ||                              ",
      \"                              ''''",
      \ ]

"""""""""""""""""""""""""""""
" COC
"""""""""""""""""""""""""""""

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" Autoshow help dialog onhover
"autocmd CursorHoldI * :call <SID>show_hover_doc()
"autocmd CursorHold * :call <SID>show_hover_doc()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"""""""""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""""""""

highlight VertSplit cterm=NONE


let g:lightline = {
      \ 'colorscheme': 'jellybeans',
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

" yellow
hi tsxTagName guifg=#E06C75 ctermfg=Blue cterm=bold
hi tsxCloseString guifg=#F99575 ctermfg=DarkBlue
hi tsxCloseTag guifg=#F99575 ctermfg=DarkYellow
hi tsxCloseTagName guifg=#F99575 ctermfg=Red
hi tsxAttributeBraces guifg=#F99575 ctermfg=DarkBlue
hi tsxEqual guifg=#F99575 ctermfg=Blue
hi tsxAttrib guifg=#F8BD7F ctermfg=DarkYellow cterm=italic

let g:ranger_map_keys = 0
