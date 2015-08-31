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
" Plugin 'myusuf3/numbers.vim'
Plugin 'tmhedberg/matchit'
" Plugin 'vim-scripts/Gundo'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
" Plugin 'mattn/gist-vim'
Plugin 'rstacruz/sparkup'
" Plugin 'ton/vim-bufsurf'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'einars/js-beautify'
" Plugin 'garbas/vim-snipmate'
" Plugin 'joonty/vim-phpqa'
" Plugin 'joonty/vim-taggatron'
" Plugin 'Shougo/neocomplcache.vim'
" Plugin 'joonty/vim-sauce'
" Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-obsession'
" Plugin 'tpope/vim-rails'
Plugin 'othree/html5.vim'
Plugin 'nanotech/jellybeans.vim'
" Plugin 'chrisbra/csv.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

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
set relativenumber
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

" color scheme
colorscheme jellybeans

" plugin config
let g:NERDTreeWinPos="right"
let tlist_php_settings='php;f:function' 
let g:DisableAutoPHPFolding = 1

let g:ftplugin_sql_omni_key = '<C-l>'

" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
"                       \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']


" syntastic
" let g:syntastic_ignore_files=['\v^.*\.(twig-html|mustache)$']

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_quiet_messages = {
"     \ "!level": "errors",
"     \ "type"  : "style"
" \}
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" " let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" " end syntastic

let g:UltiSnipsExpandTrigger="<C-s>"

"" end config """


""" mappings """
map <leader>f :echo @%<CR> " echo current filename
map <leader>c :call ToggleColorColumn()<CR> " put a gray column at col 80
map <leader>u :set relativenumber!<CR>
map <leader>w :set wrap!<CR>
map <leader>r :set ruler!<CR>
map <leader>h :set hlsearch!<CR>
map <leader>8 gggqGgg
vmap <leader>j :!jq .<CR>
vmap <leader>sj y:vsp x<CR><C-W><C-R>p:%!jq .<CR>:se ft=json<CR>
map <C-l> :BufSurfForward<CR>
map <C-h> :BufSurfBack<CR>
nmap <leader>i :!clear; bash %<CR>
cmap w!! w !sudo tee %

" plugin mappings
" map <leader>n :NumbersToggle<CR>
map <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :<C-U>RangerChooser<CR>

" Tagbar
map <leader>t :TagbarToggle<CR>

let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_autoclose = 0
let g:tagbar_top_align = 1 " only available in my version of tagbar

let g:vdebug_keymap = {
\    "run"              : "<leader>d",
\    "run_to_cursor"    : "<leader>r",
\    "step_over"        : "<C-o>",
\    "step_into"        : "<C-i>",
\    "step_out"         : "<C-u>",
\    "close"            : "<leader>C",
\    "detach"           : "<leader>D",
\    "set_breakpoint"   : "<leader>b",
\    "get_context"      : "<leader>c",
\    "eval_under_cursor": "<leader>E",
\    "eval_visual"      : "<Leader>e",
\}

let g:vdebug_options= {
\    "port"              : 9000,
\    "server"            : 'localhost',
\    "timeout"           : 60,
\    "on_close"          : 'detach',
\    "break_on_open"     : 1,
\    "ide_key"           : '',
\    "path_maps"         : {},
\    "debug_window_level": 0,
\    "debug_file_level"  : 0,
\    "debug_file"        : "",
\    "watch_window_style": 'expanded',
\    "marker_default"    : '⬦',
\    "marker_closed_tree": '▸',
\    "marker_open_tree"  : '▾'
\}

let g:vdebug_features = {
\    'max_children': 128,
\    'max_data'    : 512,
\    'max_depth'   : 3
\}

map <leader>e :VdebugEval 

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" php helpers
:autocmd FileType php noremap <leader>m :w!<CR>:!/usr/bin/php %<CR>
:autocmd FileType php noremap <leader>l :!/usr/bin/php -l %<CR>
:autocmd FileType markdown set textwidth=72

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

" Compatible with ranger 1.4.2 through 1.6.*
"
" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
""" end helpers """
