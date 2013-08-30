set nocompatible
set showcmd
filetype on
filetype off
colorscheme slate
syntax on

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'airblade/vim-gitgutter'
" Bundles end

:let mapleader = ","

filetype plugin indent on

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
  set guioptions-=T
endif

set autoread   "auto load from disk if changed
set encoding=utf-8
set ruler       "show where i am
set cc=80
set number      "show line numbers
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

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

"gitgutter faster sign updates 
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
