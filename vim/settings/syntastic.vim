" checker settings
" c options
let g:syntastic_c_checkers = ['clang_check', 'gcc']
let g:syntastic_c_compiler_options="-std=gnu99"

" cpp options
let g:syntastic_cpp_checkers=['clang_check', 'gcc']
let g:syntastic_cpp_compiler_options="-std=c++11"

" shell script
let g:syntastic_sh_checkers=['shellcheck', 'sh']
let g:syntastic_sh_shellcheck_exec="~/.cabal/bin/shellcheck"

" other scripting language
let g:syntastic_python_checkers = ['flake8', 'pep8']
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
let g:syntastic_always_populate_loc_list = 1
