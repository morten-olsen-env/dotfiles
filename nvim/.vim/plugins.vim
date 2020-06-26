call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'vim-scripts/SyntaxRange'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'pbogut/fzf-mru.vim'
Plug 'jreybert/vimagit'
Plug 'bluz71/vim-moonfly-colors'
Plug 'kjwon15/vim-transparent'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'arcticicestudio/nord-vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'Yggdroot/indentLine'
Plug 'mtdl9/vim-log-highlighting'

call plug#end()

