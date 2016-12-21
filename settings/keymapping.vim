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

    " create new buffer in normal mode
    nnoremap <silent><leader>bt :enew<CR>

    " goto next buffer in normal mode
    nnoremap <silent><leader>bj :call NextBuffer()<CR>
    nnoremap <silent><leader>bk :call PrevBuffer()<CR>

    " close a buffer in normal mode
    nnoremap <silent><leader>bq :call PrevBuffer() <BAR> bd #<CR>

    " create new buffer in terminal buffer mode
    tnoremap <silent><leader>bt <C-\><C-n>:enew<CR>

    " goto next buffer in terminal mode
    tnoremap <silent><leader>bj <C-\><C-n>:call NextBuffer()<CR>
    tnoremap <silent><leader>bk <C-\><C-n>:call PrevBuffer()<CR>

    " close a buffer in terminal mode
    tnoremap <silent><leader>bq <C-\><C-n>:call PrevBuffer() <BAR> bd #<CR>
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

" deoplete {{{ 
    inoremap <expr><C-g> deoplete#undo_completion()
    inoremap <expr><C-y> deoplete#close_popup()
"}}}

" neosnippet {{{
    " imap <C-k> <Plug>(neosnippet_expand_or_jump)
    " smap <C-k> <Plug>(neosnippet_expand_or_jump)
    " xmap <C-k> <Plug>(neosnippet_expand_target)

    " imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    " \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    " \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" }}}

" debug-key-mapping {{{
    nnoremap <silent><leader>. :so ~/.config/nvim/init.vim<CR>
" }}}
