" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on " essential for taglist
filetype plugin on " essential for NERD Commenter
filetype indent on

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Automatische Einrückung (Globale Konfiguration)
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4

" UTF-8 als Default-Encoding
set enc=utf-8

" Ein Tab entspricht vier Leerzeichen (wie in PEP 8 definiert)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" 256 colors color schemes
let &t_Co=256
colorscheme synic

" to have , instead of \ as leader key
let mapleader = ","

" key bindings
"
" taglist toggle
nnoremap <silent> <F8> :TlistToggle<CR>

" Start python on F5
autocmd FileType python map <F5> :w<CR>:!python "%"<CR>

" more than 20 commands and search patterns in history
set history=1000

" manage multiple buffers effectively
set hidden

" make /-style searches case-sensitive only if there is a capital letter in
" the search expression
set ignorecase
set smartcase

" set the terminal title
set title

" limited line numbering
set ruler

" make the bell visual
set visualbell

" line numbering on
set number
