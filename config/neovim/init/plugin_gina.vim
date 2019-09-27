function! GitStatus()
    execute(':Gina status --opener="botright split"')
endfunction

command! GitStatus call GitStatus()
