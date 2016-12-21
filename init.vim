set runtimepath+=/home/mike820324/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin('/home/mike820324/.config/nvim/bundle/')
call dein#add('Shougo/dein.vim')
" general-productive {{{
    call dein#add('tek/proteome.nvim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('mbbill/undotree')
    call dein#add('LeafCage/yankround.vim')
    call dein#add('osyo-manga/vim-over')
    call dein#add('brooth/far.vim')
    call dein#add('Shougo/deoplete.nvim')
" }}}

" code composing {{{
    call dein#add('godlygeek/tabular')               " lineup text
    call dein#add('jiangmiao/auto-pairs')            " auto pairs
    call dein#add('tpope/vim-commentary')            " quick comment
" }}}

" layout {{{
    call dein#add('chriskempson/base16-vim')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('Yggdroot/indentLine')            " indent indicator
" }}}
"
" code-tracing {{{
    call dein#add('neomake/neomake')
    call dein#add('mhinz/vim-grepper')
" }}}

" tmux integration {{{
    call dein#add('christoomey/vim-tmux-navigator')  " vim tmux navigator
    call dein#add('benmills/vimux')                  " send input to tmux
"}}}

call dein#end()

" ======= Genera Settings =======
" general-setting {{{
    let mapleader=','
    set history=50
    set nu
    set relativenumber
    set showcmd
    set cursorline
    set hidden
" }}}

" term-setting {{{
    set t_Co=256

    " do not remove the following line if you are using base16 colorscheme
    let base16colorspace=256

    if &term =~ '256color'
        " Disable Background Color Erase
        " This should fix the issue that the colorscheme may not work properly
        " when using xterm in screen or tmux
        set t_ut=
    endif

    if &term =~ '^screen'
        execute "set t_kP=\e[5;*~"
        execute "set t_kN=\e[6;*~"

        execute "set <xUp>=\e[1;*A"
        execute "set <xDown>=\e[1;*B"
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
    endif

" }}}

" encoding-setting {{{
    set termencoding=utf-8
    set encoding=utf-8
" }}}

" colorscheme-setting {{{
    syntax on
    set background=dark

    " base16-shell will generate a .vimrc_background for us
    if filereadable("/home/mike820324/.vimrc_background")
        source /home/mike820324/.vimrc_background
    endif
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
    autocmd FileType cpp setlocal ts=4 sw=4 noexpandtab
" }}}

" fold-settings {{{
    set foldmethod=marker
    autocmd FileType c,cpp setlocal foldmethod=syntax
    autocmd FileType python setlocal foldmethod=indent

" }}}

" ignore-setting {{{
    set wildignore=*/tmp/*,*/.git/*
    set wildignore+=*.log,*.swp,*.zip,*.gz,*.bz2,*.bmp,*.jpg
    set wildignore+=*.so,*.exe,*.dll,*.ppt
    set wildignore+=*.pyd
    set wildignore+=*/node_modules/*
" }}}

" ===== External Plugins Setup =====
source ~/.config/nvim/settings/keymapping.vim

" ===== Settings Based on Plugins =====
source ~/.config/nvim/settings/airline.vim
source ~/.config/nvim/settings/indentline.vim
source ~/.config/nvim/settings/undotree.vim
source ~/.config/nvim/settings/far.vim
source ~/.config/nvim/settings/vimux.vim
source ~/.config/nvim/settings/deoplete.vim
source ~/.config/nvim/settings/neomake.vim
