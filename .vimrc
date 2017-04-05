syntax on

set encoding=utf8
set ruler
set backspace=indent,eol,start
set nowrap
set hidden
set cursorline
set expandtab
set autoindent
set smartindent
set ignorecase
set wrapscan
set incsearch
set hlsearch
set clipboard=unnamed
set fileformats=unix,dos,mac
set tabstop=2
set shiftwidth=2
set nojoinspaces
set textwidth=80
set foldmethod=indent

let mapleader='\'
let g:netrw_banner = 0 | let g:netrw_liststyle = 3
let g:jsx_ext_required = 0 " vim-jsx plugin
let g:jedi#popup_on_dot = 0 "jedi-vim plugin

au filetype python setl ts=4 sw=4 ai si cinw+=elif,except,finally,def,class
au filetype make set noexpandtab

colorscheme jellybeans

highlight LineNr ctermfg=darkgray
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight Folded ctermfg=7
