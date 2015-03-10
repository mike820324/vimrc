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
        nnoremap <silent><leader>bs :Unite buffer -winheight=5<CR>
        nnoremap <silent><leader>ms :Unite mark<CR>
        nnoremap <silent><leader>ys :Unite -quick-match yankround<CR>
    " }}}
    
    " Code Search {{{
        nnoremap <leader>tgd :<C-u>Unite gtags/def:
        nnoremap <leader>tgr :Unite gtags/ref:
        nnoremap <leader>tgg :Unite gtags/grep:
        nnoremap <silent><leader>tgc :Unite gtags/context<CR>
        nnoremap <silent><leader>tcs :Unite outline<CR>
    " }}}
"}}}
"
" linux_tracing {{{
    nnoremap <leader>tls  :<C-u>Unite grep:. -buffer-name=grep <CR>SYSCALL_DEFINE[0-6]\(,<Left>
    nnoremap <leader>tlss :<C-u>Unite grep:. -buffer-name=grep <CR>SYSCALL_DEFINE[0-6]\(<C-R><C-W>,<CR>
" }}}

" vimfiler {{{
    nnoremap <silent><leader>pdt :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<CR>
" }}}

" TagBar-setting {{{
    nnoremap <silent><leader>pco :TagbarToggle<CR>
" }}}

" undotree {{{
    nnoremap <silent><leader>put :UndotreeToggle<CR>
" }}}

" Syntastic-Mapping {{{
    nnoremap <silent><leader>pce :SyntasticCheck<CR>:Errors<CR>
" }}}

" fguitive {{{
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>ga :Git add %<CR>
"}}}


" buffertab-navigation {{{
    " create new buffer
    nnoremap <silent><leader>bt :enew<CR>

    " next buffer
    nnoremap <silent><leader>bj :bnext<CR>
    nnoremap <silent><leader>bk :bprev<CR>

    " close a buffer
    nnoremap <silent><leader>bq :bp <BAR> bd #<CR>
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
" }}

" neocomplcache {{{ 
    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
    inoremap <expr><C-y> neocomplcache#close_popup()
    inoremap <expr><C-e> neocomplcache#cancel_popup()
"}}}

