nnoremap <silent> <leader> :WhichKey ','<CR>
" ===========================
" Leader keybindings
" ===========================

call which_key#register(',', "g:which_key_map")
let g:which_key_map = {}

let g:which_key_map['w'] = { 'name': 'wiki' }
let g:which_key_map['h'] = { 'name': 'which_key_ignore' }
let g:which_key_map[','] = { 'name': 'which_key_ignore' }
let g:which_key_map['/'] = { 'name': 'which_key_ignore' }
let g:which_key_map['a'] = { 'name': 'which_key_ignore' }
let g:which_key_map[','] = { 'name': 'which_key_ignore' }
let g:which_key_map['M'] = { 'name': 'which_key_ignore' }

let g:which_key_map['!'] = 'ripgrep'
nnoremap <Leader>!  :Rg!<cr>

let g:which_key_map['q'] = { 'name': 'close-buffer' }
nmap <Leader>q :bd<CR>

let g:which_key_map['n'] = { 'name': 'nerdtree' }
let g:which_key_map.n.t = 'Toggle nerdtree'
nmap <Leader>nt :NERDTreeToggle<CR>

let g:which_key_map['d'] = { 'name': 'display' }
let g:which_key_map.d.f = 'distraction-free'
nmap <Leader>df :Goyo<CR>

let g:which_key_map['f'] = { 'name': 'files' }
let g:which_key_map.f.w = 'Save file'
nmap <leader>fw :w!<cr>
let g:which_key_map.f.o = 'Find file'
nmap <Leader>fo :Files<CR>
let g:which_key_map.f.e = 'Explore'
nmap <Leader>fe :Ranger<CR>
let g:which_key_map.f.c = 'Change PWD to dir of current buffer'
map <leader>fc :cd %:p:h<cr>:pwd<cr>
let g:which_key_map.f.r = 'find-recent-file'
nnoremap <silent> <Leader>fr :FZFMru<CR>

let g:which_key_map['b'] = { 'name': 'buffers' }
let g:which_key_map.b.f = 'find buffer'
nmap <leader>bf :Buffers<CR>
let g:which_key_map.b.d = 'close current buffer'
map <leader>bd :bd<cr>
let g:which_key_map.b.a = 'close all buffers'
map <leader>ba :bufdo bd<cr>

let g:which_key_map['z'] = { 'name': 'fold' }
let g:which_key_map.z.c = 'fold function'
nmap <leader>zc zfa}

let g:which_key_map['m'] = { 'name': 'misc' }
let g:which_key_map.m.t = 'Toggle mouse'
nmap <Leader>mt :call ToggleMouse()<CR>
let g:which_key_map.m.z = 'Toggle centering'
nnoremap <Leader>mz :let &scrolloff=999-&scrolloff<CR>
let g:which_key_map.m.p = 'Toggle paste mode'
map <leader>mp :setlocal paste!<cr>
let g:which_key_map.m.s = 'Toggle spell checking'
map <leader>ms :setlocal spell!<cr>
let g:which_key_map.m.r = 'Reload config'
map <leader>mr :source ~/.vimrc<cr>

let g:which_key_map['g'] = { 'name': 'git' }
let g:which_key_map.g.n = 'git-next-hunk'
nmap <leader>gn :GitGutterNextHunk<cr>
let g:which_key_map.g.p = 'git-prev-hunk'
nmap <leader>gp :GitGutterPrevHunk<cr>
let g:which_key_map.g.a = 'git-stage-hunk'
nmap <leader>ga :GitGutterStageHunk<cr>
let g:which_key_map.g.u = 'git-undo-hunk'
nmap <leader>gu :GitGutterUndoHunk<cr>
let g:which_key_map.g.s = 'git-status'
nnoremap <leader>gs :Magit<CR>

let g:which_key_map['c'] = { 'name': 'coc actions' }
nmap <silent> <leader>cgd <Plug>(coc-definition)
nmap <silent> <leader>cgy <Plug>(coc-type-definition)
nmap <silent> <leader>cgi <Plug>(coc-implementation)

nmap <leader>cle :<C-u>CocList diagnostics<cr>
nmap <leader>cls :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>clc  :<C-u>CocList commands<cr>
nnoremap <silent> <leader>clx  :<C-u>CocList extensions<cr>

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" vmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction)

" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
nmap <leader>cfc  <Plug>(coc-fix-current)
nmap <silent> csr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>cr <Plug>(coc-rename)

nnoremap <silent> <Leader>v+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>v- :exe "resize " . (winheight(0) * 2/3)<CR>


