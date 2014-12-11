""" vundle """
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin list
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'joonty/vdebug'
Plugin 'ledger/vim-ledger'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'spf13/PIV'
" Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'ervandew/supertab'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'marijnh/tern_for_vim'
" Plugin 'mklabs/vim-backbone'
Plugin 'myusuf3/numbers.vim'
Plugin 'tmhedberg/matchit'
" Plugin 'vim-scripts/Gundo'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
" Plugin 'mattn/gist-vim'
Plugin 'rstacruz/sparkup'
Plugin 'ton/vim-bufsurf'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'einars/js-beautify'
" Plugin 'garbas/vim-snipmate'
" Plugin 'joonty/vim-phpqa'
" Plugin 'joonty/vim-taggatron'
" Plugin 'Shougo/neocomplcache.vim'
" Plugin 'joonty/vim-sauce'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-obsession'

call vundle#end()
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
set tags=./tags,tags,_tags
set ignorecase
set wrapscan
set incsearch
set hlsearch
" set viewoptions=folds,cursor
set viewoptions=cursor
set clipboard=unnamed
set fileformats=unix,dos,mac
set completeopt=menuone

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

let g:UltiSnipsExpandTrigger="<C-s>"

"" end config """


""" mappings """
map <leader>f :echo @%<CR> " echo current filename
map <leader>c :call ToggleColorColumn()<CR> " put a gray column at col 80
map <leader>u :set number!<CR>
map <leader>w :set wrap!<CR>
map <leader>r :set ruler!<CR>
map <leader>h :set hlsearch!<CR>
map <C-l> :BufSurfForward<CR>
map <C-h> :BufSurfBack<CR>

" plugin mappings
map <leader>n :NERDTreeToggle<CR>
map <leader>rn :NumbersToggle<CR>
map <C-k> :NumbersToggle<CR>

" Tagbar
map <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
" let g:tagbar_autoclose = 1
let g:tagbar_top_align = 1

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

let g:vdebug_features = { 'max_children': 256 }

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
