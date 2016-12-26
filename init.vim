" The python path should be include in the very begeinning
if filereadable(expand("~/.config/nvim/conf.d/python_path.vim"))
    source ~/.config/nvim/conf.d/python_path.vim
endif

source ~/.config/nvim/settings/default.vim
source ~/.config/nvim/settings/keymapping.vim

" dein plugin related setup {{{
    set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
    call dein#begin('~/.config/nvim/bundle/')
    call dein#load_toml('~/.config/nvim/plugins.toml')
    call dein#end()

    call dein#save_state()
    if dein#check_install()
        call dein#install()
    endif
" }}}

