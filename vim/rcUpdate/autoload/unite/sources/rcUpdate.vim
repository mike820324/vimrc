" define source
function! unite#sources#rcUpdate#define()
    return s:source
endfunction

" source
let s:source = {
\   'name': 'rcUpdate',
\   'max_candidates': 50,
\   'required_pattern_length': 0,
\   'action_table': {},
\   'hooks': {},
\   'default_action': {'word': 'execute'},
\   'default_kind': 'word'
\}

function! s:source.hooks.on_init(args, context)"{{{
    call RCUpdate_git_fetch()
endfunction"}}}

function! s:source.gather_candidates(args, context) "{{{
    let rc_version = RCUpdate_getVersions()
    
    let candidates = []
    let Fn_tag = function("RCUpdate_git_checkout_tag")
    for tag in rc_version.tag
        " tag info
        let info_msg = RCUpdate_get_tag_info(tag)
        let candidate = {
\           'word': tag,
\           'is_multiline': 1,
\           'abbr': info_msg,
\           'kind': 'word',
\           'source': 'rcUpdate',
\           'action__command': Fn_tag,
\       }
        call add(candidates, candidate)
    endfor
   
    " newest branch
    let Fn_branch = function("RCUpdate_git_checkout_branch")
    let candidate = {
\      'word': 'master',
\      'kind': 'word',
\      'source': 'rcUpdate',
\      'action__command': Fn_branch
\   }
    call add(candidates, candidate)

    return candidates
endfunction "}}}

" action_tables {{{
let s:action_table = {}
let s:action_table.execute = {
\   'description': 'Update to the version'
\}
function! s:action_table.execute.func(candidate) "{{{
    let save_ignorecase = &ignorecase
    set noignorecase
    call a:candidate.action__command(a:candidate.word)
    let &ignorecase = save_ignorecase
endfunction"}}}

let s:action_table.info = {
\   'description': 'version info'
\}
function! s:action_table.info.func(candidate) "{{{ 
    call RCUpdate_get_tag_info(a:candidate.word)
endfunction "}}}

let s:source.action_table.common = s:action_table
" }}}
let s:rc_repo = expand('~/.vim/')


function! RCUpdate_git_wrapper(repo_path, options) "{{{
    let command = 'git -C ' . a:repo_path . ' ' . a:options
    return command
endfunction "}}}

function! RCUpdate_get_tag_info(tag) "{{{
    let options = 'tag -l -n9 ' . a:tag
    let command = RCUpdate_git_wrapper(s:rc_repo, options)
    let sub = vimproc#popen2(command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    return res
endfunction "}}}

function! RCUpdate_git_fetch() "{{{
    let command = RCUpdate_git_wrapper(s:rc_repo, 'fetch')
    call vimproc#system(command)
endfunction "}}}

function! RCUpdate_git_checkout_tag(tag_version) "{{{
    let options = "checkout tags/" . a:tag_version
    let command = RCUpdate_git_wrapper(s:rc_repo, options)
    call RCUpdate_git_checkout(command)
endfunction "}}}

function! RCUpdate_git_checkout_branch(branch_name) "{{{
    let options = "checkout " . a:branch_name
    let command = RCUpdate_git_wrapper(s:rc_repo, options)
    call RCUpdate_git_checkout(command)
endfunction "}}}

function! RCUpdate_git_checkout(command) "{{{
    let sub =  vimproc#popen2(a:command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    echo res
    
    " source the new version
    so ~/.vimrc
endfunction "}}}

function! RCUpdate_git_tag() "{{{
    let command = RCUpdate_git_wrapper(s:rc_repo, 'tag')
    let sub = vimproc#popen2(command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    let git_tags = split(res, "\n")
    return git_tags
endfunction "}}}

function! RCUpdate_git_branch() "{{{
    let command = RCUpdate_git_wrapper(s:rc_repo, 'branch -a')
    let sub = vimproc#popen2("command")
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    let git_branches = split(res, "\n")
    return git_branches
endfunction "}}}

function! RCUpdate_getVersions() "{{{
    let git_tags = RCUpdate_git_tag()
    let git_branches = RCUpdate_git_branch()
    
    let rc_version = {
    \   'tag': git_tags,
    \   'branch': git_branches
    \}

    return rc_version
endfunction "}}}
