" accelerated jk {{{
    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)
" }}}
" open denite menus {{{
    nnoremap <leader>, :Denite menu -mode=normal<CR>
" }}}

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
    function! IsExcludeBuffer() abort
        for exclude_buf_name in ['man://', 'FAR', 'QuickFix']
            if bufname('%') =~ exclude_buf_name
                return 1
            endif
        endfor
    endfunction

    function! NextBuffer()
        bnext
        if IsExcludeBuffer()
            call NextBuffer()
        endif
    endfunction

    function! PrevBuffer()
        bprev
        if IsExcludeBuffer()
            call PrevBuffer()
        endif
    endfunction

    function! KillBuffer()
        if IsExcludeBuffer()
            bdelete! %
        else
            bdelete %
        endif
    endfunction


    " create new buffer in normal mode
    nnoremap <silent><leader>bt :enew<CR>

    " goto next buffer in normal mode
    nnoremap <silent><leader>bj :call NextBuffer()<CR>
    nnoremap <silent><leader>bk :call PrevBuffer()<CR>

    " close a buffer in normal mode
    nnoremap <silent><leader>bq :bd %<CR>

    " search buffer using denite
    nnoremap <silent><leader>bs :Denite buffer<CR>


    " create new buffer in terminal buffer mode
    tnoremap <silent><leader>bt <C-\><C-n>:enew<CR>

    " goto next buffer in terminal mode
    tnoremap <silent><leader>bj <C-\><C-n>:call NextBuffer()<CR>
    tnoremap <silent><leader>bk <C-\><C-n>:call PrevBuffer()<CR>

    " close a buffer in terminal mode
    tnoremap <silent><leader>bq <C-\><C-n>:bd %<CR>
    tnoremap <silent><leader>bs <C-\><C-n>:Denite buffer<CR>
" }}}

" window-navigation {{{
    nnoremap <silent><leader>wn <C-w>n
    nnoremap <silent><leader>wj <C-w>j
    nnoremap <silent><leader>wk <C-w>k
    nnoremap <silent><leader>wh <C-w>h
    nnoremap <silent><leader>wl <C-w>l
    nnoremap <silent><leader>wq :call KillBuffer()<CR>
" }}}

" Far-setting {{{
    nnoremap <leader>s :Far <C-r><C-w>  %<Left><Left>
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
