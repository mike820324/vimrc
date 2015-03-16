function! rcUpdate#helper#Command_wrapper(repo_path, options) "{{{
    let is_bigger = rcUpdate#helper#Compare_version('1.8.5')
    if is_bigger == 1
        let command = 'git -C ' . a:repo_path . ' ' . a:options
    elseif is_bigger == 0
        let git_dir = '--git-dir=' . a:repo_path . '.git'
        let work_tree = '--work-tree=' . a:repo_path
        let command = 'git ' . git_dir . ' ' . work_tree . ' ' . a:options
    endif
    return command
endfunction "}}}

function! rcUpdate#helper#Compare_version(target_version_string) "{{{
    let target_version = split(a:target_version_string, '\.')
    let current_version = rcUpdate#git#Version()

    for counter in [0,1,2]
        if current_version[counter] == target_version[counter]
            continue
        elseif current_version[counter] > target_version[counter]
            return 1
        else   
            return 0
        endif 
    endfor

    return 1
endfunction "}}}

function! rcUpdate#helper#Get_version() "{{{
    let git_tags = rcUpdate#git#Tag()
    let git_branches = rcUpdate#git#Branch()
    
    let rc_version = {
    \   'tag': git_tags,
    \   'branch': git_branches
    \}

    return rc_version
endfunction "}}}
