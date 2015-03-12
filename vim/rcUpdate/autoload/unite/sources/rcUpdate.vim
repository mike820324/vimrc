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
\   'default_action': {'common': 'execute'}
\}

function! s:source.gather_candidates(args, context) "{{{
    let rc_version = RCUpdate_getVersions()
    
    let candidates = []
    let Fn_tag = function("RCUpdate_git_checkout_tag")
    for tag in rc_version.tag
        let candidate = {
\           'word': tag,
\           'kind': 'common',
\           'source': 'rcUpdate',
\           'action__command': Fn_tag
\       }
        call add(candidates, candidate)
    endfor
   
    " newest branch
    let Fn_branch = function("RCUpdate_git_checkout_branch")
    let candidate = {
\      'word': 'master',
\      'kind': 'common',
\      'source': 'rcUpdate',
\      'action__command': Fn_branch
\   }
    call add(candidates, candidate)

    return candidates
endfunction "}}}

" action
let s:action_table = {}

let s:action_table.execute = {
\   'description': 'lookup help'
\}
function! s:action_table.execute.func(candidate) "{{{
    let save_ignorecase = &ignorecase
    set noignorecase
    call a:candidate.action__command(a:candidate.word)
    let &ignorecase = save_ignorecase
endfunction"}}}

let s:source.action_table.common = s:action_table

function! RCUpdate_git_pull() "{{{
    call vimproc#system_bg("git pull")
endfunction "}}}

function! RCUpdate_git_checkout_tag(tag_version) "{{{
    let command = "git checkout tags/" . a:tag_version
    call RCUpdate_git_checkout(command)
endfunction "}}}

function! RCUpdate_git_checkout_branch(branch_name) "{{{
    let command = "git checkout " . a:branch_name
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
    let sub = vimproc#popen2("git tag")
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    let git_tags = split(res, "\n")
    return git_tags
endfunction "}}}

function! RCUpdate_git_branch() "{{{
    let sub = vimproc#popen2("git branch -a")
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

