set nocompatible
set showcmd
filetype plugin indent on
colorscheme slate
syntax on

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
  set guioptions-=T
endif

set cc=80
set number
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start

set ignorecase
set smartcase
set hlsearch

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop> 
inoremap <Right> <nop> 
inoremap jj <Esc>
