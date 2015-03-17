" ==== CONTEXT LAYOUT SETTINGS ====
let g:default_context = {
    \ 'winheight'           : 15   ,
    \ 'update_time'         : 200  ,
    \ 'prompt'              : '⋙ ' ,
    \ 'enable_start_insert' : 0    ,
    \ 'marked_icon'         : '✔ ' ,
    \ 'ignorecase'          : 1    ,
    \ 'smartcase'           : 1    ,
\ }
call unite#custom#profile('default', 'context', default_context)

" ==== MENU SETTINGS ==== 
let g:unite_source_menu_menus = {}

" unite-menu-update {{{
    let g:unite_source_menu_menus.update = {
        \ 'description' : 'Auto Update the vimrc'
    \}
    let g:unite_source_menu_menus.update.command_candidates = [
        \['▷ editor versions                nomapping',  'Unite rcUpdate'],
        \['▷ plugin updates                 nomapping',  'NeoBundleCheckUpdate'],
    \]
"}}}

" unite-menu-git {{{
    let g:unite_source_menu_menus.git = {
        \ 'description' : '<leader> with g in front. Command related to git.'
    \}
    let g:unite_source_menu_menus.git.command_candidates = [
        \['▷ git status                     <leader>gs', 'normal ,gs'],
        \['▷ git diff                       <leader>gd', 'normal ,gd'],
        \['▷ git add                        <leader>ga', 'normal ,ga'],
        \['▷ git commit                     <leader>gc', 'normal ,gc'],
    \]
"}}}

" unite-menu-search {{{
    let g:unite_source_menu_menus.search = {
        \ 'description' : '<leader> with f in front. Command related to searching. Such as files, buffer, marks, functions...'
    \}
    let g:unite_source_menu_menus.search.command_candidates = [
        \['▷ file search               <leader>ff',     'normal ,ff'],
        \['▷ mru search                <leader>fm',     'normal ,fm'],
        \['▷ grep search               <leader>fg',     'normal ,fg'],
        \['▷ mark search               <leader>ms',     'normal ,ms'],
        \['▷ buffer search             <leader>bs',     'normal ,bs'],
        \['▷ yank search               <leader>ys',     'normal ,ys'],
        \['▷ code search               <leader>tcs',    'normal ,tcs'],
    \]
"}}}

" unite-menu-project {{{
    let g:unite_source_menu_menus.project = {
        \ 'description' : '<leader> with p in front. Command related to project management.'
    \}
    let g:unite_source_menu_menus.project.command_candidates = [
        \['▷ code layout                    <leader>pco', 'normal ,pco'],
        \['▷ project tree                   <leader>pdt', 'normal ,pdt'],
        \['▷ undo tree                      <leader>put', 'normal ,put'],
        \['▷ check error                    <leader>pce', 'normal ,pce'],
    \]
" }}}

" unite-menu-shell {{{
    let g:unite_source_menu_menus.shell = {
        \ 'description' : 'create a interactive shell in a seperate window'
    \}
    let g:unite_source_menu_menus.shell.command_candidates = [
        \['▷ popup shell                    nomapping..', ':VimShellPop'],
        \['▷ popup node shell               nomapping..', ':VimShellInteractive --split="split" node'],
        \['▷ popup python shell             nomapping..', ':VimShellInteractive --split="split" python'],
    \]
" }}}

" unite-menu-navigate {{{
    let g:unite_source_menu_menus.navigate = {
        \ 'description' : 'Command related to editor navigation.'
    \}
    let g:unite_source_menu_menus.navigate.command_candidates = [
        \['▷ create new buffer              <leader>bt', 'normal ,bt'],
        \['▷ next buffer                    <leader>bj', 'normal ,bj'],
        \['▷ prev buffer                    <leader>bk', 'normal ,bk'],
        \['▷ quit buffer                    <leader>bq', 'normal ,bq'],
        \['▷ search buffer                  <leader>bs', 'normal ,bs'],
        \['▷ window up                      <leader>wk', 'normal ,wk'],
        \['▷ window down                    <leader>wj', 'normal ,wj'],
        \['▷ window left                    <leader>wh', 'normal ,wh'],
        \['▷ window right                   <leader>wl', 'normal ,wl'],
        \['▷ window quit                    <leader>wq', 'normal ,wq'],
        \['▷ window search                  <leader>ws', 'normal ,ws'],
    \]
" }}}

" unite-menu-trace-code {{{
    let g:unite_source_menu_menus.code = {
        \ 'description' : '<leader> with t in front. Command related to trace code.'
    \}
    let g:unite_source_menu_menus.code.command_candidates = [
        \['▷ code search                    <leader>tcs', 'normal ,tcs'],
        \['▷ C function defination          <leader>tgd', 'normal ,tgd'],
        \['▷ C function reference           <leader>tgr', 'normal ,tgr'],
        \['▷ linux system call search       <leader>tls', 'normal ,tls'],
    \]
"}}}

" ==== FILE SEARCH SETTINGS ====
" unite_file_search_settings {{{
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#custom#source('file_rec', 'ignore_globs', split(&wildignore, ','))

    " use ag instead of the default grep
    if executable('ag')
        "let g:unite_source_rec_async_command = '""ag --follow --nocolor --nogroup --hidden -g""'
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --ignore=*.pyc --ignore=*.o --ignore=*.ko'
    elseif executable('awk')
        let g:unite_source_grep_command='ack'
        let g:unite_source_grep_default_opts='--no-group --no-color'
    endif

    " basic config for unite
    let g:unite_data_directory = expand("~/.vim/.cache/unite")
    let g:unite_source_rec_max_cache_files = 5000
    let g:unite_source_history_yank_enable=1
    let g:unite_source_history_yank_limit=10000
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_search_word_highlight=1

" }}}

let g:unite_source_mark_marks = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdeghijklmnopqrstuvwxyz"
