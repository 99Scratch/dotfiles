" Ein Tab entspricht vier Leerzeichen (wie in PEP 8 definiert)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Start python on F5
autocmd FileType python map <F5> :w<CR>:!python "%"<CR>

