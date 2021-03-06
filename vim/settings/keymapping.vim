" Unite-Mapping {{{
    " Basic Mappings {{{
        nnoremap <silent><leader>, :Unite menu <CR>
        nnoremap <silent><leader>h :Unite mapping <CR>
    " }}}
    
    " File Search {{{
        nnoremap <silent><leader>ff :Unite -buffer-name=files file_rec/async:!<CR>
        nnoremap <silent><leader>fm :Unite -buffer-name=files file_mru<CR>
        nnoremap <silent><leader>fg  :<C-u>Unite grep:. -buffer-name=grep <CR> 
        nnoremap <silent><leader>fgg :<C-u>Unite grep:. -buffer-name=grep <CR><C-R><C-W>
    " }}}
    
    " Misc Search {{{
        nnoremap <silent><leader>ws :Unite window:no-current<CR>
        nnoremap <silent><leader>bs :Unite buffer<CR>
        nnoremap <silent><leader>ms :Unite mark<CR>
        nnoremap <silent><leader>ys :Unite yankround<CR>
    " }}}
    
    " Code Search {{{
        nnoremap <leader>tgd :<C-u>Unite gtags/def:
        nnoremap <leader>tgr :Unite gtags/ref:
        nnoremap <leader>tgg :Unite gtags/grep:
        nnoremap <silent><leader>tgc :Unite gtags/context<CR>
        nnoremap <silent><leader>tcs :Unite outline<CR>
    " }}}
"}}}

" linux_tracing {{{
    nnoremap <leader>tls  :<C-u>Unite grep:. -buffer-name=grep <CR>SYSCALL_DEFINE[0-6]\(,<Left>
    nnoremap <leader>tlss :<C-u>Unite grep:. -buffer-name=grep <CR>SYSCALL_DEFINE[0-6]\(<C-R><C-W>,<CR>
" }}}

" TagBar-setting {{{
    nnoremap <silent><leader>pco :TagbarToggle<CR>
" }}}

" undotree {{{
    nnoremap <silent><leader>put :UndotreeToggle<CR>
" }}}

" Syntastic-Mapping {{{
    nnoremap <silent><leader>pce :SyntasticCheck<CR>:Unite location_list<CR>
" }}}

" fguitive {{{
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>ga :Git add %<CR>
"}}}

" buffertab-navigation {{{
    function! IsUnwantedBuffer() abort
        if bufname('%') =~ 'vimfiler'
            return 1
        endif

        if bufname('%') =~ 'vimshell'
            return 1
        endif

        if bufname('%') =~ 'QuickFix'
            return 1
        endif

        return 0
    endfunction

    function! NextBuffer()
        bnext
        if IsUnwantedBuffer()
            call NextBuffer()
        endif
    endfunction

    function! PrevBuffer()
        bprev
        if IsUnwantedBuffer()
            call PrevBuffer()
        endif
    endfunction

    " create new buffer
    nnoremap <silent><leader>bt :enew<CR>

    " next buffer
    nnoremap <silent><leader>bj :call NextBuffer()<CR>
    nnoremap <silent><leader>bk :call PrevBuffer()<CR>

    " close a buffer
    nnoremap <silent><leader>bq :call PrevBuffer() <BAR> bd #<CR>
" }}}

" window-navigation {{{
    nnoremap <silent><leader>wn <C-w>n
    nnoremap <silent><leader>wj <C-w>j
    nnoremap <silent><leader>wk <C-w>k
    nnoremap <silent><leader>wh <c-w>h
    nnoremap <silent><leader>wl <c-w>l
    nnoremap <silent><leader>wq <c-w>q
" }}}

" vim-over-setting {{{
    nnoremap <silent><leader>s :OverCommandLine<CR>
    nnoremap <silent>sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" }}}

" neocomplete {{{ 
    inoremap <expr><C-g> neocomplete#undo_completion()
    inoremap <expr><C-l> neocomplete#complete_common_string()
    inoremap <expr><C-y> neocomplete#close_popup()
    inoremap <expr><C-e> neocomplete#cancel_popup()
"}}}

" neosnippet {{{
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)

    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" }}}

" debug-key-mapping {{{
    nnoremap <silent><leader>. :so ~/.vim/vimrc<CR>
" }}}
