set nocompatible
set showcmd
filetype on
colorscheme slate
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
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

" More natural splits
set splitbelow
set splitright

set autoread   "auto load from disk if changed
set clipboard=unnamed 
set noswapfile
set nowritebackup
set encoding=utf-8
set ruler       "show where i am
set cc=80
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start
set nowrap
set cindent
set smarttab
set laststatus=2            " always show the status line

set number
set relativenumber

set ignorecase
set smartcase
set hlsearch
set incsearch

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop> 
inoremap <Right> <nop> 
inoremap jj <Esc>

" CtrlP 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
nnoremap <leader>t :CtrlPTag<cr>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.out     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Easy split tab movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" EasyTags
:let g:easytags_async = 1
:set tags=./tags;
:let g:easytags_dynamic_files = 2

" Nerdtree
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Git/fugitive shortcuts
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gf <C-W>h<C-W>czR
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gc :Gcommit -a<CR>

"no need relative in insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
