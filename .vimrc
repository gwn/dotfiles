""" vundle """
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle list
Bundle 'gmarik/vundle'
Bundle "taglist.vim"
Bundle "scrooloose/nerdtree"
Bundle "joonty/vdebug"
Bundle "ledger/vim-ledger"
Bundle "godlygeek/tabular"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-fugitive"
" Bundle "shawncplus/phpcomplete.vim"
" Bundle "spf13/PIV"
" Bundle "joonty/vim-phpqa"
" Bundle "myusuf3/numbers.vim"

filetype plugin indent on
""" end vundle """


""" config """
set encoding=utf8
set ruler
set backspace=indent,eol,start
set nowrap
set hidden " allow unsaved buffers in background
set number
set cursorline
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set tags=tags;/

syntax on

let mapleader='\'

" filetype specific config
autocmd BufNewFile,BufRead *.twig-html set syntax=html
autocmd BufNewFile,BufRead *.php set tabstop=4 shiftwidth=4

" stylings
highlight LineNr ctermfg=darkgray
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE

" plugin config
let g:NERDTreeWinPos="right"
let tlist_php_settings='php;f:function' 
" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
"                       \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

"" end config """


""" mappings """
map <leader>f :echo @%<CR> " echo current filename
map <leader>c :call ToggleColorColumn()<CR> " put a gray column at col 80
map <leader>u :set number!<CR>
map <leader>w :set wrap!<CR>
map <leader>r :set ruler!<CR>
map <C-l> :bn<CR>
map <C-h> :bp<CR>

" plugin mappings
map <leader>t :TlistToggle<CR>
map <leader>n :NERDTreeToggle<CR>

let g:vdebug_keymap = {
\    "run" : "<leader>d",
\    "run_to_cursor" : "<leader>r",
\    "step_over" : "<C-o>",
\    "step_into" : "<C-i>",
\    "step_out" : "<C-u>",
\    "close" : "<leader>C",
\    "detach" : "<leader>D",
\    "set_breakpoint" : "<leader>b",
\    "get_context" : "<leader>c",
\    "eval_under_cursor" : "<leader>E",
\    "eval_visual" : "<Leader>e",
\}

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" php helpers
:autocmd FileType php noremap <leader>m :w!<CR>:!/usr/bin/php %<CR>
:autocmd FileType php noremap <leader>l :!/usr/bin/php -l %<CR>

""" end mappings """


""" helpers """
function ToggleColorColumn()
    highlight ColorColumn ctermbg=7

    if &colorcolumn == 100
        set colorcolumn=0
    else
        set colorcolumn=100
    endif
endfunction
""" end helpers """
