let s:rc_repo = expand('~/.vim/')

function! rcUpdate#git#Version() "{{{
    let command = 'git --version'
    let sub =  vimproc#popen2(command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile

    let version_msg = split(res, " ")[2]
    let git_version = split(version_msg, '\.')[0:2]
    return git_version
endfunction "}}}

function! rcUpdate#git#Tag_info(tag, verbose) "{{{
    let options = 'tag -l -n1 ' . a:tag
    let command = rcUpdate#helper#Command_wrapper(s:rc_repo, options)
    let sub = vimproc#popen2(command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    return res
endfunction "}}}

function! rcUpdate#git#Fetch() "{{{
    let command = rcUpdate#helper#Command_wrapper(s:rc_repo, 'fetch')
    call vimproc#system(command)
endfunction "}}}

function! rcUpdate#git#Checkout_tag(tag_version) "{{{
    let options = "checkout tags/" . a:tag_version
    let command = rcUpdate#helper#Command_wrapper(s:rc_repo, options)
    call rcUpdate#git#Checkout(command)
endfunction "}}}

function! rcUpdate#git#Checkout_branch(branch_name) "{{{
    let options = "checkout " . a:branch_name
    let command = rcUpdate#helper#Command_wrapper(s:rc_repo, options)
    call rcUpdate#git#Checkout(command)
endfunction "}}}

function! rcUpdate#git#Checkout(command) "{{{
    let sub =  vimproc#popen2(a:command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    echo res
    
    " source the new version
    so ~/.vimrc
endfunction "}}}

function! rcUpdate#git#Tag() "{{{
    let command = rcUpdate#helper#Command_wrapper(s:rc_repo, 'tag')
    let sub = vimproc#popen2(command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    let git_tags = split(res, "\n")
    return git_tags
endfunction "}}}

function! rcUpdate#git#Branch() "{{{
    let command = rcUpdate#helper#Command_wrapper(s:rc_repo, 'branch -a')
    let sub = vimproc#popen2(command)
    let res = ''
    while !sub.stdout.eof
        let res .= sub.stdout.read()
    endwhile
    let git_branches = split(res, "\n")
    return git_branches
endfunction "}}}
