" ===============================================
" # Env Init
" ===============================================

" Check nixos configs defined in vereis/nixos/home.nix
" to see where 'g:config_dir' is usually set
if !exists('g:config_dir')
  let g:config_dir='~/.config/nvim'
endif

if !exists('g:plugin_dir')
  let g:config_dir='~/.dotfiles/nvim/bundle'
endif

execute "set rtp^=" . g:config_dir
execute "set rtp^=" . g:plugin_dir

" ===============================================
" # Configure Plug + Plugins               
" ===============================================

call plug#begin(g:plugin_dir)

" General stuff
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'machakann/vim-swap'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'

" NERDTree stuff
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Language Server stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim' " CTags for CoC language servers

" Git plugins
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Erlang plugins
Plug 'vim-erlang/vim-erlang-omnicomplete' , { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler'     , { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-runtime'      , { 'for': 'erlang' }

" Elixir plugins
Plug 'elixir-editors/vim-elixir' , { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format'      , { 'for': 'elixir' }

" Handlebar Templates
Plug 'mustache/vim-mustache-handlebars' , { 'for': 'html' }

" SCSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim' , { 'for': 'scss' }

" FZF integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Bunch of nice themes
Plug 'flazz/vim-colorschemes'

call plug#end()


" ===============================================
" # Load all additional configuration files
" ===============================================
for config in split(glob(g:config_dir . '/config/*.vim'), '\n')
  exe 'source' config
endfor

filetype plugin indent on 
