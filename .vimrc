""" vundle """
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle list
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'joonty/vdebug'
Bundle 'ledger/vim-ledger'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'spf13/PIV'
" Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ervandew/supertab'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'tmhedberg/matchit'
Bundle 'vim-scripts/Gundo'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'mattn/gist-vim'
Bundle 'rstacruz/sparkup'
" Bundle 'garbas/vim-snipmate'
" Bundle 'joonty/vim-phpqa'
" Bundle 'joonty/vim-taggatron'
" Bundle 'Shougo/neocomplcache.vim'
" Bundle 'joonty/vim-sauce'

filetype plugin indent on
""" end vundle """

""" config """
syntax on

set encoding=utf8
set ruler
set backspace=indent,eol,start
set nowrap
set hidden " allow unsaved buffers in background
set number
set cursorline
set expandtab
set autoindent
set smartindent
set tags=tags;/
set ignorecase
set wrapscan
set incsearch
set hlsearch
" set viewoptions=folds,cursor
set viewoptions=cursor
set clipboard=unnamed

let mapleader='\'

" autocommands
autocmd BufWinLeave        ?* mkview            " for remembering
autocmd BufWinEnter        ?* silent! loadview   " view (fold etc.) settings
autocmd BufNewFile,BufRead ?* set tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead ?* set foldtext=CustomFoldText()

" filetype specific config
autocmd BufNewFile,BufRead *.php set tabstop=4 shiftwidth=4

autocmd BufNewFile,BufRead *.twig-html,*.mustache set filetype=html

" stylings
highlight LineNr ctermfg=darkgray
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight Folded ctermfg=4 ctermbg=0

" plugin config
let g:NERDTreeWinPos="right"
let tlist_php_settings='php;f:function' 
let g:DisableAutoPHPFolding = 1

" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
"                       \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" let g:syntastic_ignore_files=['\v^.*\.(twig-html|mustache)$']

"" end config """


""" mappings """
map <leader>f :echo @%<CR> " echo current filename
map <leader>c :call ToggleColorColumn()<CR> " put a gray column at col 80
map <leader>u :set number!<CR>
map <leader>w :set wrap!<CR>
map <leader>r :set ruler!<CR>
map <leader>h :set hlsearch!<CR>
map <C-l> :bn<CR>
map <C-h> :bp<CR>

" plugin mappings
map <leader>t :TagbarToggle<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>rn :NumbersToggle<CR>
map <C-k> :NumbersToggle<CR>

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

function CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    " return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
    return line . expansionString . foldSizeStr . foldLevelStr
endf

function ToggleColorColumn()
    highlight ColorColumn ctermbg=7

    if &colorcolumn == 80
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunction
""" end helpers """
