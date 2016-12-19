if !has("lua")
    let g:neocomplete#disable_auto_complete = 1
else
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#data_directory = expand('~/.vim/.cache/neocomplete')
endif
