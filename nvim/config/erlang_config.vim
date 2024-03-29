function! LoadErlangSettings()
  let g:erl_textwidth=80
  let &textwidth=g:erl_textwidth

  set colorcolumn=+1

  set tabstop=2
  set softtabstop=2
  set shiftwidth=2

  set expandtab
  set autoindent

  set fileformat=unix
endfunction

" Set erlang mode in escripts with extension 'es'
au BufNewFile,BufRead *.es set ft=erlang
au BufNewFile,BufRead *.erl,*.hrl,*.es call LoadErlangSettings()
