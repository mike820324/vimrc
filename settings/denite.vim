" general settings {{{
    " call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', split(&wildignore, ','))
    " call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', ['bundle/**'])
" }}}

" ===== Settings Based on Source =====
" file_rec settings {{{
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    call denite#custom#var('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
"}}}

" grep settings {{{
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])
" }}}

" ===== Customize Menus =====

let s:menus = {}

" plugin management menu {{{
    let s:menus.plugin = {
\       'description': 'Update Plugins'
\   }

    let s:menus.plugin.command_candidates = [
\       ['▷ plugin install                 nomapping',  'call dein#install()'],
\       ['▷ plugin updates                 nomapping',  'call dein#update()'],
\       ['▷ plugin register service        nomapping',  'UpdateRemotePlugins'],
\       ['▷ plugin list                    nomapping',  'Denite dein'],
\   ]
"}}}

" git command menu {{{
    let s:menus.git = {
\       'description' : '<leader> with g in front. Command related to git.'
\   }

    let s:menus.git.command_candidates = [
\       ['▷ git status                     <leader>gs', 'normal ,gs'],
\       ['▷ git diff                       <leader>gd', 'normal ,gd'],
\       ['▷ git add                        <leader>ga', 'normal ,ga'],
\       ['▷ git commit                     <leader>gc', 'normal ,gc'],
\   ]
"}}}

" terminal menu {{{
    let s:menus.shell = {
\       'description' : 'create a interactive shell in a seperate window'
\   }

    let s:menus.shell.command_candidates = [
\       ['▷ popup shell                    nomapping..', ':terminal'],
\       ['▷ popup node shell               nomapping..', ':call termopen("node")'],
\       ['▷ popup python shell             nomapping..', ':call termopen("python")'],
\       ['▷ popup shell with tmux          nomapping..', ':call VimuxOpenRunner()'],
\       ['▷ popup node shell with tmux     nomapping..', ':call VimuxRunCommand("node")'],
\       ['▷ popup python shell with tmux   nomapping..', ':call VimuxRunCommand("python")'],
\   ]
" }}}

call denite#custom#var('menu', 'menus', s:menus)
