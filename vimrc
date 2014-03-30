"
" Ron's .vimrc
"

syntax on
colo pablo

set fileformats=unix,dos

if has("gui_running")
    set guifont=DejaVu_Sans_Mono:h11:cDEFAULT
    set guioptions=arbh
    set columns=80
    set lines=40
endif

set ruler

set list
set listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:_

set scrolloff=999
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

