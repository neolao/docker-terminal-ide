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
autocmd VimEnter * execute ResumeNERDTree()

" Sous plugin nerdtree tabs
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_focus_on_files = 1

" Ne pas ignorer de fichiers
let NERDTreeIgnore=[]

" Affichier les dossiers et fichiers cachés
let NERDTreeShowHidden=1

" Taille de l'explorateur
let NERDTreeWinSize=30

"autocmd VimEnter * execute ResumeNERDTree()
"autocmd TabEnter * execute ResumeNERDTree()


