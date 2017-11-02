
" [vim-plug] {{{1
" -------------

    " Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    if filereadable(expand("~/plug.vim"))
        source ~/plug.vim
    endif
    call plug#begin('~/.config/nvim/plugged')

    Plug 'tpope/vim-sensible'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'editorconfig/editorconfig-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'powerline/powerline'
    Plug 'isRuslan/vim-es6'
    Plug '~/.config/nvim/themes'

    " Initialize plugin system
    call plug#end()

 " } }}1

" [OPTION]  {{{1
" -------------
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
    au BufRead,BufNewFile *.as      set filetype=actionscript
    au BufRead,BufNewFile *.css     set filetype=css
    au BufRead,BufNewFile *.scss    set filetype=scss
    au BufRead,BufNewFile *.php     set filetype=php

" }}}1

" [T HEME] {{{1

    " Active le mode 256 couleurs (parce qu'on l'utilise souvent en remote!)
    set t_Co=256
    " set term=screen-256color

    "colorscheme neolao_colors256
    colorscheme molokai
    "let g:molokai_original = 1
    set cursorline
    set cursorcolumn
    set termguicolors
    " set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

    " Airline theme
    let g:airline_theme='molokai'
    let g:airline_powerline_fonts = 1

    " Powerline
    "set rtp+=/user/.config/nvim/plugged/powerline/bindings/vim/
    "set laststatus=2
" }}}1


" [PL UGIN] NERDTree {{{1
" ----------------------

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

    autocmd VimEnter * NERDTreeToggle
" }}}1

 " [Shortcuts] {{{1
" ----------------------

    " Tabs
    map <C-t> :tabnew<cr>
    imap <C-t> <Esc><C-t>
    vmap <C-t> <Esc><C-t>
    "map <C-w> :tabclose<cr>
    "imap <C-w> <Esc><C-w>
    "vmap <C-w> <Esc><C-w>
    noremap <tab> :tabnext<cr>
    map ,<tab> :tabprevious<cr>
    map <S-tab> :tabprevious<cr>

" }}}1
