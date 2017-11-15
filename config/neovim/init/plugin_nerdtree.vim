" Afficher / Cacher NERDTree
let g:nerdtreeopened=1
function! ToggleNERDTree()
    execute(":NERDTreeToggle")
    if g:nerdtreeopened != 0
        let g:nerdtreeopened=0
    else
        let g:nerdtreeopened=1
    endif
endfunction
function! ResumeNERDTree()
    if g:nerdtreeopened != 0
        execute(":NERDTree")
        execute(":NERDTreeMirror")
    else
        execute(":NERDTreeClose")
    endif
endfunction

" Ouvrir NERDTree à chaque fois qu'on lance vim
" Et aussi à chaque fois qu'on change d'onglet
" La même sidebar est réutilisée à chaque fois
"autocmd VimEnter * execute ResumeNERDTree()
"autocmd VimEnter * wincmd p
"autocmd TabLeave * wincmd p
"autocmd TabEnter * execute ResumeNERDTree()
"autocmd TabEnter * wincmd p

" Ne pas ignorer de fichiers
let NERDTreeIgnore=[]

" Affichier les dossiers et fichiers cachés
let NERDTreeShowHidden=1

" Taille de l'explorateur
let NERDTreeWinSize=30



