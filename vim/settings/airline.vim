set laststatus=2
" theme-settings {{{
    " let g:airline_theme = 'powerlineish'
    " let g:airline_powerline_fonts = 1
    let g:airline_theme = 'base16'
"}}}

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" quickfix-stttings {{{
    let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
    let g:airline#extensions#quickfix#location_text = 'Location'
" }}}

" tabline-setting {{{
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#excludes = ['vimfiler', 'vimshell']
"}}}
