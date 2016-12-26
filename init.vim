" The python path should be include in the very begeinning
if filereadable(expand("~/.config/nvim/conf.d/python_path.vim"))
    source ~/.config/nvim/conf.d/python_path.vim
endif

" We need to set the mapleader here since some of the plugin mapping will use the leader key
let mapleader=','

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

" Default Settings
source ~/.config/nvim/settings/default.vim
source ~/.config/nvim/settings/netrw.vim
" Default Keymappings
source ~/.config/nvim/settings/keymapping.vim

" Include user speicify settings
if filereadable(expand("~/.config/nvim/conf.d/user_settings.vim"))
    source ~/.config/nvim/conf.d/user_settings.vim
endif

" Include user speicify keymappings
if filereadable(expand("~/.config/nvim/conf.d/user_keymappings.vim"))
    source ~/.config/nvim/conf.d/user_keymappings.vim
endif
