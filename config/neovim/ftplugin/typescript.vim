if $TYPESCRIPT
    let b:ale_fixers = ['tslint']

    " Autocompletion with Tsuquyomi
    setlocal omnifunc=tsuquyomi#complete
else
    if $DENO
        "let b:ale_fixers = ['denofmt']
        let b:ale_fixers = []
    else
        let b:ale_fixers = []
    endif
endif


" Fix with tslint
"map <A-f> <Esc> :ALEFix tslint<cr>
"imap <A-f> <Esc> :ALEFix tslint<cr>
"vmap <A-f> <Esc> :ALEFix tslint<cr>

