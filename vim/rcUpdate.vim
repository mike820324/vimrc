
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

