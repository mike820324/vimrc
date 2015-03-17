" define source
function! unite#sources#rcUpdate#define()
    return s:source
endfunction

" source
let s:source = {
\   'name'                    : 'rcUpdate'          ,
\   'max_candidates'          : 50                  ,
\   'required_pattern_length' : 0                   ,
\   'action_table'            : {}                  ,
\   'hooks'                   : {}                  ,
\   'default_action'          : {'word': 'execute'} ,
\   'default_kind'            : 'word'
\}

function! s:source.hooks.on_init(args, context)"{{{
    call rcUpdate#git#Fetch()
endfunction"}}}

function! s:source.gather_candidates(args, context) "{{{
    let rc_version = rcUpdate#helper#Get_version()
    
    let candidates = []
    let Fn_tag = function("rcUpdate#git#Checkout_tag")
    for tag in rc_version.tag
        " tag info
        let info_msg = rcUpdate#git#Tag_info(tag, 0)
        let candidate = {
\           'word'            : tag        ,
\           'is_multiline'    : 1          ,
\           'abbr'            : info_msg   ,
\           'kind'            : 'word'     ,
\           'source'          : 'rcUpdate' ,
\           'action__command' : Fn_tag     ,
\       }
        call add(candidates, candidate)
    endfor
   
    " newest branch
    let Fn_branch = function("rcUpdate#git#Checkout_branch")
    let candidate = {
\      'word'            : 'master'   ,
\      'kind'            : 'word'     ,
\      'source'          : 'rcUpdate' ,
\      'action__command' : Fn_branch  ,
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
    call rcUpdate#git#Tag_info(a:candidate.word, 1)
endfunction "}}}

let s:source.action_table.common = s:action_table
" }}}
