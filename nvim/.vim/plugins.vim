call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'universal-ctags/ctags'
Plug 'mg979/vim-visual-multi'
Plug 'liuchengxu/vista.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'vim-scripts/SyntaxRange'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
Plug 'pbrisbin/vim-mkdir'
 Plug 'kjwon15/vim-transparent'
" Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
"Plug 'flazz/vim-colorschemes'
Plug 'thaerkh/vim-workspace'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'elzr/vim-json'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'mtdl9/vim-log-highlighting'
Plug 'alok/notational-fzf-vim'
Plug 'lervag/vimtex'
Plug 'zivyangll/git-blame.vim'

Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
let g:dracula_colorterm = 0
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()

colorscheme dracula

