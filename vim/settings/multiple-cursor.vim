" when mulitple cursor is fired disable NeoComplete
function! Multiple_cursors_before() abort
    exe 'NeoCompleteLock'
    echomsg string('locked')
endfunction

function! Multiple_cursors_after() abort
    exe 'NeoCompleteUnlock'
    echomsg string('unlocked')
endfunction
