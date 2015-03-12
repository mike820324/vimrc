" ======= Autoupdate Plugins =====
set rtp+=~/.vim/vim/rcUpdate.vim
" ======= Neobundle Setup =======
source ~/.vim/vim/neobundles.vim

" ======= Genera Settings =======
" general-setting {{{
    let mapleader=','
    set history=50
    set nu
    set relativenumber
    set showcmd
    set cursorline
    set hidden
    set foldmethod=marker
" }}}

" encoding-setting {{{
    set term=xterm-256color
    set t_Co=256
    set termencoding=utf-8
    set encoding=utf-8
" }}}

" colorscheme-setting {{{
    syntax on
    set background=dark
    colorscheme distinguished
" }}}

" indent-setting {{{
    set autoindent
    set smarttab
    set smartindent
    set backspace=indent,eol,start

    " default indent settings
    set ts=4
    set sw=4
    set expandtab

    " different file type use different indent
    autocmd FileType python setlocal ts=4 sw=4
    autocmd FileType javascript setlocal ts=4 sw=4
    autocmd FileType c setlocal ts=4 sw=4 noexpandtab
" }}}

" ignore-setting {{{
    set wildignore=*/tmp/*,*/.git/*,*.log,*.swp,*.zip,*.gz,*.bz2,*.bmp,*.jpg
    set wildignore+=*.so,*.exe,*.dll,*.ppt
" }}}

" ======== External Plugins Setup =====
source ~/.vim/vim/setting.vim

