" Use vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

" General stuff
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/deoplete.nvim'
Plugin 'easymotion/vim-easymotion'

" Erlang plugins
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'ludovicchabant/vim-gutentags'

" Elixir plugins
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format'
Plugin 'slashmili/alchemist.vim'

call vundle#end()
filetype plugin indent on 

" Tab Settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

" Copy to clipboard instead of vim text buffer
if has('win32')
    set clipboard=unnamed
endif
if has('unix')
    set clipboard=unnamedplus
endif

" Relative line numbers
set number relativenumber

" Set underlined cursor line
set cursorline

" Leader
let mapleader=" "

" Syntax color
syntax on
set background=dark
colorscheme PaperColor

" Better searching functionality
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

" Enable mouse
set mouse=a

" Keybindings
command! Wq wq
command! WQ wq
command! W w

" Line breaking
set wrap linebreak nolist
noremap k gk
noremap j gj
inoremap k <C-o>gk
inoremap j <C-o>gj

noremap <Up> gk
noremap <Down> gj
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj

" Fuzzy finding
set path+=**
set wildmenu
set wildmode=longest,list

" Ctags
set tags=./.tags;/
nnoremap <C-Space><Return> <C-]>
nnoremap <C-Space><BS> <C-t>
nnoremap <C-Space><C-Space> :silent !ctags -f .tags -R .<return><return><C-l>
nnoremap <C-m> :TagbarToggle<CR>

" Elixir Tagbar
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

" Autocompletion
let g:deoplete#enable_at_startup = 1
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Ignore these filetypes
set wildignore+=*.pdf,*.o,*.obj,*.bin,*.jpg,*.png,*.beam

" Mix format on save
let g:mix_format_on_save = 1

" Don't use alchemist.vim's ctag like functionality as I'm using ctags
let g:alchemist_tag_disable = 1

" NERDTREE toggle (normal mode)
nnoremap <C-n> :NERDTreeToggle<CR>

" Close VIM if NERDTREE is only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
