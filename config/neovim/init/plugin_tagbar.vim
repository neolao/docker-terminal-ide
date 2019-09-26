let g:tagbar_left = 0
let g:tagbar_vertical = 0
"autocmd VimEnter * nested :TagbarOpen
"autocmd VimEnter * nested :ToggleNERDTreeAndTagbar

" Afficher / Cacher TagBar
let g:tagbaropened=0
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
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'f:function:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:1:1',
    \ 'e:enums:1:1',
    \ 't:typealias:1:1',
    \ 'i:interface:0:1',
    \ 'c:const:1:1',
    \ 'C:class:0:1',
    \ 'p:property:0:1',
    \ 'm:method:0:1',
    \ 'v:variable:1:1',
  \ ],
  \ 'sort' : 0
\ }
