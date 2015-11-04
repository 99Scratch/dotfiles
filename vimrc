" ############
" ## VUNDLE ##
" ############
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my plugins
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'git://fedorapeople.org/home/fedora/wwoods/public_git/vim-scripts.git'
Plugin 'bogado/file-line'
Plugin 'nvie/vim-flake8'
" my plugins end

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ############
" ## vimrc ##
" ###########

set background=dark
" 256 colors color schemes
let &t_Co=256
colorscheme rainbo

set wildmenu
set wildmode=longest,list,full
"set mouse=a

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
set ignorecase
set smartcase
"set nowrap " lange zeilen nicht umbrechen
set linebreak
set scrolloff=2

" Automatische Einrückung (Globale Konfiguration)
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set modeline

" UTF-8 als Default-Encoding
set enc=utf-8

" to have , instead of \ as leader key
let mapleader = ","

" key bindings
"
" taglist toggle
nnoremap <silent> <F8> :TlistToggle<CR>

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

autocmd BufEnter *.{c,cpp,h} setl cindent
autocmd Filetype text setl textwidth=80 " Editor bricht nach 80 Zeichen automatisch um
"This is for setting Makefiles with tabs not spaces
autocmd FileType make setlocal noexpandtab
autocmd BufEnter *.make setlocal noexpandtab

" lets you use w!! to do that after you opened the file already, which you
" wanted to edit with root privileges
cmap w!! w !sudo tee % >/dev/null

