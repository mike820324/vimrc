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
    let rc_version = rcUpdate:getVersions()
    
    let candidates = []
    let Fn_tag = function("rcUpdate:git:checkout:tag")
    for tag in rc_version.tag
        let candidate = {
\           'word': tag,
\           'kind': 'common',
\           'source': 'help',
\           'action__command': Fn_tag
\       }
        call add(candidates, candidate)
    endfor
    
    let Fn_branch = function("rcUpdate:git:checkout:branch")
    for branch in rc_version.branch
        let candidate = {
\           'word': branch,
\           'kind': 'common',
\           'source': 'help',
\           'action__command': Fn_branch
\       }
        call add(candidates, candidate)
        
    endfor

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

function! rcUpdate:git:pull() "{{{
    call vimproc#system_bg("git pull")
endfunction "}}}

function! rcUpdate:git:checkout:tag(tag_version) "{{{
    let command = "git checkout tags/" . a:tag_version
    call rcUpdate:git:checkout(command)
endfunction "}}}

function! rcUpdate:git:checkout:branch(branch_name) "{{{
    let command = "git checkout " . a:branch_name
    call rcUpdate:git:checkout(command)
endfunction "}}}

function! rcUpdate:git:checkout(command) "{{{
    let sub =  vimproc#popen2(a:command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    echo res
    
    " source the new version
    so ~/.vimrc
endfunction "}}}

function! rcUpdate:git:tag() "{{{
    let sub = vimproc#popen2("git tag")
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    let git_tags = split(res, "\n")
    return git_tags
endfunction "}}}

function! rcUpdate:git:branch() "{{{
    let sub = vimproc#popen2("git branch -a")
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    let git_branches = split(res, "\n")
    return git_branches
endfunction "}}}

function! rcUpdate:getVersions() "{{{
    let git_tags = rcUpdate:git:tag()
    let git_branches = rcUpdate:git:branch()
    
    let rc_version = {
    \   'tag': git_tags,
    \   'branch': git_branches
    \}

    return rc_version
endfunction "}}}

