" NeoBundle Plugin Manager {{{
    if has('vim_starting')
        set nocompatible
    
        " Required:
        set runtimepath+=~/.vim/bundle/neobundle.vim
        set runtimepath+=~/.vim/vim/plugins/
    endif
    
    call neobundle#begin(expand('~/.vim/bundle/'))     " Required
    NeoBundleFetch 'Shougo/neobundle.vim'             " Required
    
    runtime fileSearch.neo
    runtime traceCode.neo
    runtime productive.neo
    runtime layout.neo

    " Unused 
    " NeoBundle 'thinca/vim-quickrun'           
    " NeoBundle 'tsukkee/unite-tag'           
    
    call neobundle#end()
    
    filetype plugin indent on                         " Required
    NeoBundleCheck
"}}}

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

" external settings {{{
    source ~/.vim/vim/settings/indentline.vim
    source ~/.vim/vim/settings/airline.vim
    source ~/.vim/vim/settings/syntastic.vim
    source ~/.vim/vim/settings/unite.vim
    source ~/.vim/vim/settings/undotree.vim
    source ~/.vim/vim/settings/vimfiler.vim
    source ~/.vim/vim/settings/neocompletecache.vim
    source ~/.vim/vim/settings/virtualenv.vim
    source ~/.vim/vim/settings/yankround.vim
    source ~/.vim/vim/keymapping.vim
" }}}
