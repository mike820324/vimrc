let g:indentLine_enabled = 1
let g:indentLine_faster = 1
" let g:indentLine_char = '¦'
let g:indentLine_char = '>'
let g:indentLine_color_term = 9
" let g:indentLine_leadingSpaceEnabled = 0
" let g:indentLine_leadingSpaceChar = '·'
" let g:indentLine_indentLevel = 5
let g:indentLine_fileTypeExclude = ['help', 'nerdtree']

" tab indent 
set list listchars=tab:\¦\ 


" some of the time, the indent depth is too deep
" as a result, this plugin will cause the navigation become very slow.
" to solve this issue
"   1. Disable leadingSpace by calling LeadingSpaceToggle
"   2. set the indentLine_indentLevel to a lower value
"
" let g:indentLine_faster = 1
" let g:indentLine_indentLevel = 5

