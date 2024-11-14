syntax off
set tabstop=4
set shiftwidth=4
set expandtab
set breakindent
set linebreak
set autoindent
set smartindent
set clipboard=unnamed

nnoremap j gj
nnoremap k gk
"vnoremap <A-u> <Esc>
"snoremap <A-u> <Esc>
"inoremap <A-u> <Esc>
inoremap <C-e> <C-o>$

let g:loaded_matchparen=1

highlight NonText ctermfg=0

autocmd VimEnter * if
  \ argc() == 0 &&
  \ bufname("%") == "" |
  \   exe "normal! `0" |
  \ endif
