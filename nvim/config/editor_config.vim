" Allow navigation away from dirty files, keep dirty files in memory
set hidden

" Don't redraw buffer during macro
set lazyredraw

" 8 line buffer for scrolling
set scrolloff=8

" Cache undos in a file, disable other backup settings
set noswapfile
set nobackup
set undofile

" Tab Settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent

" Copy to clipboard instead of vim text buffer
set clipboard=unnamedplus

" Relative line numbers
set number relativenumber

" Set underlined cursor line
set cursorline

" Leader
let mapleader=" "

" Syntax color
syntax on
set background=dark

" Set theme and prevent theme from changing BG color
au ColorScheme * hi Normal ctermbg=None
colorscheme monokain

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
nnoremap k gk
nnoremap j gj

noremap <Up> gk
noremap <Down> gj
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj

" Fuzzy finding
set path+=**
set wildmenu
set wildmode=longest,list

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.erl,*.css,*.ex,*.exs match BadWhitespace /\s\+$/

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
