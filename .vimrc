set nocompatible
set showcmd
filetype on
colorscheme slate
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'vim-scripts/a.vim'
Plugin 'bronson/vim-trailing-whitespace'
" Bundles end

:let mapleader = ","

filetype plugin indent on

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 15
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
set smarttab
set laststatus=2            " always show the status line


set smartindent
set cindent
"Place cursor in a new line after opening {
inoremap { {<CR>}<up><end><CR>

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


" remove trailing spaces on save
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
