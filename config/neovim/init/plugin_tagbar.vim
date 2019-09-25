" Afficher / Cacher TagBar
let g:tagbaropened=1
function! ToggleTagBar()
    execute(":TagbarToggle")
    if g:tagbaropened != 0
        let g:tagbaropened=0
    else
        let g:tagbaropened=1
    endif
endfunction
function! ResumeTagBar()
    if g:tagbaropened != 0
        execute(":TagbarOpen")
    else
        execute(":TagbarClose")
    endif
endfunction

" Ouvrir TagBar à chaque fois qu'on lance vim
" Et aussi à chaque fois qu'on change d'onglet
" La même sidebar est réutilisée à chaque fois
"autocmd VimEnter * execute ResumeTagBar()
"autocmd VimEnter * wincmd p
"autocmd TabLeave * wincmd p
"autocmd TabEnter * execute ResumeTagBar()
"autocmd TabEnter * wincmd p

let g:tagbar_type_typescript = {
  \ 'kinds': [
    \ 'c:class:0:1',
  \ ],
  \ 'sort' : 0
\ }
