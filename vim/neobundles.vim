" NeoBundle Plugin Manager {{{
    if has('vim_starting')
        set nocompatible
        " Install neobundle if there is no 
        let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
        if !filereadable(neobundle_readme)
            echo "Installing neobundle.vim."
            echo ""
            silent !mkdir -p ~/.vim/bundle
            silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
            echo "Install complete"
        endif

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
