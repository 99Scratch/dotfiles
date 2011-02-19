" Automatische Einrückung (Globale Konfiguration)
set smartindent
set smarttab

" UTF-8 als Default-Encoding
set enc=utf-8

" Ein Tab entspricht vier Leerzeichen (wie in PEP 8 definiert)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

let &t_Co=256 " 256 colors color schemes
colorscheme synic
filetype on " essential for taglist
filetype plugin on " essential for NERD Commenter
let mapleader = "," " to have , instead of \ as leader key

" key bindings
"
" taglist toggle
nnoremap <silent> <F8> :TlistToggle<CR>

" Start python on F5
autocmd FileType python map <F5> :w<CR>:!python "%"<CR>


