call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'vim-scripts/SyntaxRange'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
Plug 'pbrisbin/vim-mkdir'
Plug 'kjwon15/vim-transparent'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'Yggdroot/indentLine'
Plug 'mtdl9/vim-log-highlighting'
Plug 'alok/notational-fzf-vim'
Plug 'lervag/vimtex'
Plug 'zivyangll/git-blame.vim'
Plug 'sheerun/vim-polyglot'

Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'

call plug#end()

