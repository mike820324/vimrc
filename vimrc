" NeoBundle Plugin Manager {{{
    if has('vim_starting')
        set nocompatible
    
        " Required:
        set runtimepath+=~/.vim/bundle/neobundle.vim
    endif
    
    call neobundle#begin(expand('~/.vim/bundle/'))     " Required
    NeoBundleFetch 'Shougo/neobundle.vim'             " Required
    
    " vimproc
    NeoBundle 'Shougo/vimproc.vim', {
         \ 'build' : {
         \     'windows' : 'tools\\update-dll-mingw',
         \     'cygwin' : 'make -f make_cygwin.mak',
         \     'mac' : 'make -f make_mac.mak',
         \     'unix' : 'make -f make_unix.mak',
         \    },
         \ }
    
    " plugin for finding files
    NeoBundle 'Shougo/unite.vim'           " buffer explorer
    NeoBundle 'Shougo/neomru.vim'           " mru for unite
    NeoBundle 'Shougo/vimfiler.vim'           " file explorer
    
    " plugin for tracing code
    NeoBundle 'majutsushi/tagbar'           " source code navigator
    NeoBundle 'Shougo/unite-outline'       " source code navigator
    NeoBundle 'hewes/unite-gtags'           " gtag browser
    NeoBundle 'tacroe/unite-mark'            " mark browser
    NeoBundle 'Shougo/vimshell.vim'
    
    " plugin for productive of writing code
    NeoBundle 'mbbill/undotree'               " undotree explorer
    NeoBundle 'tpope/vim-fugitive'           " git binding 
    NeoBundle 'jmcantrell/vim-virtualenv'  " virtualenv for python
    NeoBundle 'scrooloose/syntastic'       " syntax checker
    NeoBundle 'LeafCage/yankround.vim'       " yank reuse
    NeoBundle 'osyo-manga/vim-over'           " fast substitude
    NeoBundle 'rking/ag.vim'               " ag in vim
    NeoBundle 'tpope/vim-commentary'       " quick comment
    NeoBundle 'Shougo/neocomplcache'       " neocomplete
    NeoBundle 'chrisbra/NrrwRgn'           " NrrRgn
    NeoBundle 'Yggdroot/indentLine'        " indent indicator
    
    " plugin for cool
    NeoBundle 'bling/vim-airline'            " status line prettify 

    " Unused 
    " NeoBundle 'thinca/vim-quickrun'           
    " NeoBundle 'tsukkee/unite-tag'           
    
    " vim color scheme
    NeoBundle 'Lokaltog/vim-distinguished'
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
    source ~/.vim/vim/keymapping.vim
" }}}
