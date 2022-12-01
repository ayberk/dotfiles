set nocompatible

set number
set showcmd
filetype off
syntax on

" Install VimPlug at https://github.com/junegunn/vim-plug
" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'jceb/vim-orgmode'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'mbbill/undotree'
Plug 'elzr/vim-json'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug '/usr/local/opt/fzf'

Plug 'morhetz/gruvbox'
call plug#end()
" Plugins -- end

colorscheme gruvbox
set background=dark

set splitbelow
set splitright

:let mapleader = ","

set autoread   "auto load from disk if changed
set clipboard=unnamed
set noswapfile
set nowritebackup
set encoding=utf-8
set ruler
set cc=100
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start
set nowrap
set smarttab
set laststatus=2            " always show the status line

set smartindent
set cindent

set ignorecase
set smartcase
set hlsearch
set incsearch

set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap jj <Esc>

nnoremap <leader>ut :UndotreeToggle

" Nerdtree
nmap <leader>nd :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

" Git/fugitive shortcuts
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Git push<CR>

" Synstastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" EO Synstastic

" remove trailing spaces on save
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e

" unlimited undo history
set undofile
set undodir=~/.vim/undodir

