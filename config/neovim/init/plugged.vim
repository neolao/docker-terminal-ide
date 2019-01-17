" Setup plugins
if filereadable(expand("~/plug.vim"))
    source ~/plug.vim
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'powerline/powerline'
Plug 'isRuslan/vim-es6'
Plug '~/.config/nvim/themes'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar'
Plug 'vimlab/split-term.vim'
Plug 'sheerun/vim-polyglot'
Plug 'niftylettuce/vim-jinja'
Plug 'cloudhead/neovim-fuzzy'
Plug 'prettier/vim-prettier', {'do' : 'npm install', 'for' : ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue']}
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'

# Linter
Plug 'w0rp/ale'

" To display and auto remove whitespace
Plug 'ntpeters/vim-better-whitespace'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

Plug 'vim-syntastic/syntastic'

if $NEOVIM_PLUGIN_TERN
    Plug 'ternjs/tern_for_vim'
endif

if $NEOVIM_PLUGIN_PHPCD
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
endif

call plug#end()


