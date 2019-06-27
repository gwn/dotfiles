syntax on
filetype on
" filetype plugin indent on

se nobackup
se nowritebackup
se backupcopy=yes
se encoding=utf8
se noruler
se backspace=indent,eol,start
se nowrap
se hidden
se nocursorline
se expandtab
se autoindent
se smartindent
se ignorecase
se wrapscan
se incsearch
se hlsearch
se clipboard=unnamed
se fileformats=unix,dos,mac
se tabstop=4
se shiftwidth=4
se nojoinspaces
se textwidth=80
se foldmethod=indent
se foldlevelstart=99
se list
se listchars=tab:<->,trail:@

let mapleader=" "
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:jsx_ext_required = 0 " vim-jsx plugin
let g:jedi#popup_on_dot = 0 " jedi-vim plugin
" let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0

nm <C-j> 2j
nm <C-k> 2k
nm <leader>r :se ruler!<CR>
nm <leader>f za
nm <leader>F zA
nm <leader>w 80\|
nm <leader>n :noh<CR>
nm <leader>8 :se cc=80<CR>
nm <leader>* :se cc=0<CR>
nm <leader>p :read !xsel -b<CR>
nm <leader>a :echo @%<CR>
nm <leader>w :se wrap!<CR>

au filetype javascript nm <C-n> :!node %<CR>
au filetype javascript nm <C-l> :!npx eslint %<CR>
au filetype javascript setl ts=4 sw=4
au filetype python setl ts=4 sw=4 cinw+=elif,except,finally,def,class
au filetype go setl noexpandtab ts=8 sw=8
au filetype make setl noexpandtab nolist
au filetype text,markdown,mail,gitcommit setl nosmartindent textwidth=66
au VimEnter,BufNewFile,BufRead * if &filetype ==# '' | setl textwidth=66 | endif

nm <leader>t :TagbarToggle<CR>

colo jellybeans

hi LineNr ctermfg=darkgray
hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
hi Folded ctermbg=NONE
hi Folded ctermfg=8
