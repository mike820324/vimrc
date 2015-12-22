" checker settings
" c and cpp
let g:syntastic_c_checkers = ['clang_check', 'gcc']
let g:syntastic_cpp_checkers=['clang_check', 'gcc']

" shell script
let g:syntastic_shellcheck_exec="~/.cabal/bin/shellcheck"
let g:syntastic_sh_checkers=['shellcheck', 'sh']

" other scripting language
let g:syntastic_python_checkers = ['python']
let g:syntastic_javascript_checkers = ['eslint']

" general settings
let g:syntastic_auto_jump = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_close = 1
let g:syntastic_enable_signs = 1
let g:syntastic_warning_symbol  = '⚠ '
let g:syntastic_style_warning_symbol = '⚠ '
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✗'

