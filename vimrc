"
" Ron's .vimrc
"

set nobackup
set nowritebackup
set noswapfile

syntax on
colo pablo

set encoding=utf8

set fileformats=unix,dos

if has("gui_running")
    set guifont=DejaVu_Sans_Mono:h11:cDEFAULT
    set guioptions=arbh
    set columns=80
    set lines=40
    set colorcolumn=81
endif

set ruler


set list
set listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:_
set nohlsearch

set scrolloff=999
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set formatoptions+=r
set formatoptions+=o
set formatoptions+=j

nmap <c-n> :cn<cr>
nmap <c-p> :cp<cr>

" C# compiler error format
set efm+=%f(%l\\\,%c):\ %m

