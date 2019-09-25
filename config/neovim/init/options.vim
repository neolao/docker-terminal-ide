" Define the shell
" Useful for GitGutter
" set shell=/bin/zsh

" Fix delete for iPad
":fixdel

" Encodage
scriptencoding utf-8
set enc=utf-8
set fenc=utf-8

" Mode non compatible avec Vi
set nocompatible

" Changer le dossier contenant les fichiers temporaires
if isdirectory('~/.vim-backup') == 0
  :silent !mkdir -p ~/.vim-backup >/dev/null 2>&1
endif
set backupdir=~/.vim-backup/
set backup
if isdirectory('~/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=~/.vim-swap/
if exists("+undofile")
  if isdirectory('~/.vim-undo') == 0
    :silent !mkdir -p ~/.vim-undo > /dev/null 2>&1
  endif
  set undodir=~/.vim-undo/
  set undofile
endif


" Display tabs and spaces
highlight Tab ctermbg=darkgray guibg=darkgray
highlight Space ctermbg=darkgray guibg=darkgray
au BufWinEnter * let w:m2=matchadd('Tab', '\t', -1)
au BufWinEnter * let w:m3=matchadd('Space', '\s\+$\| \+\ze\t', -1)
set list listchars=tab:» ,trail:·,nbsp:×

" Display line numbers
set number

" Indentat
set cindent
"set cinoptions+={2
set autoindent
set smartindent
set noai sw=4 ts=4 expandtab
set tabstop=4

" Le backspace
set backspace=indent,eol,start

" Activate the backup
set backup

" History length
set history=100

" Undo levels
set undolevels=150

" Suffixes à cacher
"set suffixes=.jpg,.png,.jpeg,.gif,.bak,~,.swp,.swo,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyo

" Inclusion d'un autre fichier avec des options
if filereadable(expand("~/.vimrc_local.vim"))
    source ~/.vimrc_local.vim
endif

" Activation de la syntaxe
if has("syntax")
    syntax on
endif

" Quand un fichier est changé en dehors de Vim, il est relu automatiquement
set autoread
au CursorHold * checktime

" Aucun son ou affichage lors des erreurs
set errorbells
set novisualbell
set t_vb=

" Quand une fermeture de parenthèse est entrée par l'utilisateur,
" l'éditeur saute rapidement vers l'ouverture pour montrer où se
" trouve l'autre parenthèse. Cette fonction active aussi un petit
" beep quand une erreur se trouve dans la syntaxe.
set showmatch
set matchtime=2

" Afficher la barre d'état
set laststatus=2

" Tout ce qui concerne la recherche. Incrémentale avec un highlight.
" Elle prend en compte la différence entre majuscule/minuscule.
set incsearch
set noignorecase
set infercase

" Quand la rechercher atteint la fin du fichier, pas
" la peine de la refaire depuis le début du fichier
set hlsearch

" Ne pas nous afficher un message quand on enregistre un readonly
"set writeany

" Afficher les commandes incomplètes
set showcmd

" Display ruler
set ruler

" Deactivate wrapping
set nowrap

" Options folding
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}

" Un petit menu qui permet d'afficher la liste des éléments
" filtrés avec un wildcard
set wildmenu
set wildignore=*.o,*#,*~,*.dll,*.so,*.a
set wildmode=full

" Format the statusline
"set statusline=%F%m\ %r\ Line:%l\/%L,%c\ %p%%
"set statusline=%<%f\ %{VCSCommandGetStatusLine()}\ %h%m%r%=%l,%c%V\ %P
"set laststatus=2
"if has('statusline')
"    function! SetStatusLineStyle()
"        let &stl=""                             .
"                \"%{fugitive#statusline()} "    .
"                \"%f %y "                       .
"                \"%([%R%M]%)"                   .
"                \"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
"                \"%{'$'[!&list]}"               .
"                \"%{'~'[&pm=='']}"              .
"                \"%="                           .
"                \"#%n %l/%L,%c%V "              .
"                \""
"    endfunc
"    call SetStatusLineStyle()
"
"    if has('title')
"        set titlestring=%t%(\ [%R%M]%)
"    endif
"endif

" Configuration de la souris en mode console
" ="" pas de souris par défaut
"set mouse=""
set mouse=a

" Améliore l'affichage en disant à vim que nous utilisons un terminal rapide
set ttyfast

" Lazy redraw permet de ne pas mettre à jour l'écran
" quand un script vim est entrain de faire une opération
set lazyredraw

if has("gui_running")
    "map <S-Insert> <MiddleMouse>
    "map <S-Insert> <MiddleMouse>

    " On cache la souris en mode gui
    "set mousehide

    " ligne de commande dans deux ligne
    "set ch=2
endif

" faire en sorte que le raccourci CTRL-X-F
" marche même quand le fichier est après
" le caractère égal. Comme :
" variable=/etc/<C-XF>
"set isfname-==

" Languages
filetype on
filetype plugin on
au BufRead,BufNewFile *.md      set filetype=markdown
au BufRead,BufNewFile *.js      set filetype=javascript
au BufRead,BufNewFile *.gs      set filetype=javascript
au BufRead,BufNewFile *.as      set filetype=actionscript
au BufRead,BufNewFile *.css     set filetype=css
au BufRead,BufNewFile *.scss    set filetype=scss
au BufRead,BufNewFile *.php     set filetype=php

" Auto completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
