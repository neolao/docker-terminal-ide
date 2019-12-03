" Setup plugins
if filereadable(expand("~/plug.vim"))
    source ~/plug.vim
endif
"let g:plug_window = 'enew'
"let g:plug_window = 'botright split'

call plug#begin('~/.config/nvim/plugged')

" UI
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '~/.config/nvim/themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" File explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neolao/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pseewald/nerdtree-tagbar-combined'

" Tools
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim'
Plug 'majutsushi/tagbar'
Plug 'vimlab/split-term.vim'
Plug 'cloudhead/neovim-fuzzy'
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Git
Plug 'lambdalisue/gina.vim'

" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" To display and auto remove whitespace
Plug 'ntpeters/vim-better-whitespace'

" Interface
Plug 'neolao/vim-eighties'
Plug 'nathanaelkane/vim-indent-guides'

" Linter
Plug 'w0rp/ale'

" Syntax
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'ekalinin/Dockerfile.vim'
Plug 'niftylettuce/vim-jinja'
if $NODEJS_DEFAULT_VERSION
    Plug 'prettier/vim-prettier', {'do' : 'npm install', 'for' : ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue']}
endif

" styled components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Markdown table
Plug 'dhruvasagar/vim-table-mode'

" Javascript
Plug 'isRuslan/vim-es6'
if $NEOVIM_PLUGIN_TERN
    Plug 'ternjs/tern_for_vim', {'do' : 'npm install'}
endif

" Go
Plug 'fatih/vim-go', { 'tag': 'v1.21', 'do': ':GoUpdateBinaries' }

" Typescript
if ($NODEJS_DEFAULT_VERSION && $TYPESCRIPT)
    Plug 'leafgarland/typescript-vim'
    Plug 'Quramy/tsuquyomi', {'do' : 'npm install -g typescript'}
endif

" PHP
if $NEOVIM_PLUGIN_PHPCD
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
endif

call plug#end()

" Auto install
if !filereadable(expand("~/.config/nvim/plugged/ctrlp.vim/readme.md"))
    autocmd VimEnter * :PlugInstall --sync
endif
