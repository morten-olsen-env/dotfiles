syntax on
filetype plugin indent on
"set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

packloadall
silent! helptags ALL

let g:jsx_ext_required = 0

"set lbr						" Enable line breaks
set showbreak=+++	" Wrap-broken line prefix
set textwidth=0	" Line wrap (number of cols)
set wrapmargin=0
set showmatch	    " Highlight matching brace
set visualbell	  " Use visual bell (no beeping)
set incsearch 		" Makes search act like search in modern browsers
set lazyredraw		" Don't redraw while executing macros (good performance config)
set foldcolumn=1
set ruler
set pastetoggle=<F2>
set background=dark
set autoread
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set scrolloff=999
set timeoutlen=500
set foldmethod=manual
highlight Normal ctermbg=NONE
set number relativenumber
set nu rnu
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set nobackup
set noswapfile
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
" set wildignore=*.swp,*.bak,*.pyc,*.class
set hlsearch 
set t_Co=256
set backspace=2 " make backspace work like most other apps
let mapleader = ","
let g:airline#extensions#tabline#enabled = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:NERDTreeWinPos = "right"
let g:bookmark_auto_close = 1
let g:bookmark_auto_save = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_map_keys = 0

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
set mouse=a

" A buffer becomes hidden when it is abandoned
set hid

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set colorcolumn=100

" Specify the behavior when switching between buffers 
try
 set switchbuf=useopen,usetab,newtab
 set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe
"normal! g'\"" | endif

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=manual
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Force rescan of js/tsx files (hurts performance)
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

set foldmethod=syntax
set foldlevel=99
let g:tex_flavor = "latex"

colorscheme nord
