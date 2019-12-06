let b:ale_fixers = ['tslint']

" Fix with tslint
map <A-f> <Esc> :ALEFix tslint<cr>
imap <A-f> <Esc> :ALEFix tslint<cr>
vmap <A-f> <Esc> :ALEFix tslint<cr>

" Autocompletion with Tsuquyomi
setlocal omnifunc=tsuquyomi#complete
