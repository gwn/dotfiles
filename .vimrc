syntax on

set nobackup
set nowritebackup
set backupcopy=yes
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
set tabstop=4
set shiftwidth=4
set nojoinspaces
set textwidth=80
set foldmethod=indent
set foldlevelstart=99

let mapleader='\'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:jsx_ext_required = 0 " vim-jsx plugin
let g:jedi#popup_on_dot = 0 " jedi-vim plugin
" let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0

au filetype python setl ts=4 sw=4 cinw+=elif,except,finally,def,class
au filetype python nmap <leader>R :!python %<CR>

au filetype go setl noexpandtab ts=8 sw=8
au filetype go nmap <leader>R :!go run %<CR>

au filetype text,markdown,mail setl nosmartindent textwidth=66
au VimEnter,BufNewFile,BufRead * if &filetype ==# '' | setl textwidth=66 | endif

au BufNewFile,BufRead *.vue set filetype=html

nmap <leader>t :TagbarToggle<CR>

au filetype make setl noexpandtab

colorscheme jellybeans

highlight LineNr ctermfg=darkgray
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight Folded ctermfg=7
