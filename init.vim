" dein plugin related setup {{{
    set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
    call dein#begin('~/.config/nvim/bundle/')
    call dein#add('Shougo/dein.vim')
    " general-productive {{{
        call dein#add('tpope/vim-fugitive')             " git functionality for vim
        call dein#add('tek/proteome.nvim')              " multiple project management
        call dein#add('mbbill/undotree')                " undo tree
        call dein#add('brooth/far.vim')                 " search and replace for multiple files
        call dein#add('Shougo/deoplete.nvim')           " async omni complete
    " }}}

    " code composing {{{
        call dein#add('godlygeek/tabular')               " lineup text
        call dein#add('jiangmiao/auto-pairs')            " auto pairs
        call dein#add('tpope/vim-commentary')            " quick comment
    " }}}

    " layout {{{
        call dein#add('chriskempson/base16-vim')        " base16 for vim
        call dein#add('vim-airline/vim-airline')        " powerline for vim
        call dein#add('vim-airline/vim-airline-themes') " airline theme
        call dein#add('Yggdroot/indentLine')            " indent indicator
    " }}}

    " code-tracing {{{
        call dein#add('Shougo/denite.nvim')                  " async unite
        call dein#add('neomake/neomake')                " lint and run make task
        call dein#add('mhinz/vim-grepper')              " async grep code
    " }}}

    " tmux integration {{{
        call dein#add('christoomey/vim-tmux-navigator')  " vim tmux navigator
        call dein#add('benmills/vimux')                  " send input to tmux
    "}}}

    " misc {{
        call dein#add('Konfekt/FastFold')                " optimize vim folding method.
        call dein#add('rhysd/accelerated-jk')            " accelerated jk
    "}}

    call dein#end()
" }}}

source ~/.config/nvim/settings/default.vim
source ~/.config/nvim/settings/keymapping.vim

" ===== Settings Based on Plugins =====
source ~/.config/nvim/settings/airline.vim
source ~/.config/nvim/settings/indentline.vim
source ~/.config/nvim/settings/undotree.vim
source ~/.config/nvim/settings/far.vim
source ~/.config/nvim/settings/vimux.vim
source ~/.config/nvim/settings/deoplete.vim
source ~/.config/nvim/settings/neomake.vim
source ~/.config/nvim/settings/denite.vim
