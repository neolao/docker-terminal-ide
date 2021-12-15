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

" Menus
Plug 'skywind3000/vim-quickui'

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
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Git
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
"Plug 'neoclide/coc-git.nvim', { 'do': 'yarn install --frozen-lockfile' }

" Auto complete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'

" Snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" To display and auto remove whitespace
Plug 'ntpeters/vim-better-whitespace'

" Interface
Plug 'neolao/vim-eighties'
Plug 'nathanaelkane/vim-indent-guides'

" Quickfix and location list
Plug 'yssl/QFEnter'

" Linter
Plug 'dense-analysis/ale'

" Syntax
Plug 'editorconfig/editorconfig-vim'
"Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'ekalinin/Dockerfile.vim'
Plug 'niftylettuce/vim-jinja'
if $NODEJS_DEFAULT_VERSION
    "  \ 'branch': 'release/0.x',
    Plug 'prettier/vim-prettier', {
      \ 'do' : 'yarn install --frozen-lockfile --production',
      \ 'for' : ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml']
      \ }
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
if $GO
    Plug 'fatih/vim-go', { 'tag': 'v1.21', 'do': ':GoUpdateBinaries' }
endif

" C++
Plug 'rhysd/vim-clang-format'

" Typescript
if ($NODEJS_DEFAULT_VERSION && $TYPESCRIPT)
    Plug 'leafgarland/typescript-vim'
    "Plug 'ncm2/nvim-typescript', {'do': 'npm install -g typescript && ./install.sh'}
    "Plug 'Quramy/tsuquyomi', {'do' : 'npm install -g typescript'}
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
endif

" Deno
if ($NODEJS_DEFAULT_VERSION && $DENO)
    "Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    Plug 'fannheyward/coc-deno', { 'do': 'yarn install --frozen-lockfile' }
endif

" PHP
if $PHP
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
    Plug 'stephpy/vim-php-cs-fixer'
    Plug 'phpactor/ncm2-phpactor'
    Plug 'phpstan/vim-phpstan'
    Plug 'kristijanhusak/deoplete-phpactor'
endif
if $NEOVIM_PLUGIN_PHPCD
    "Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
endif

" Jekyll
Plug 'tpope/vim-liquid'

call plug#end()

" Auto install
if !filereadable(expand("~/.config/nvim/plugged/ctrlp.vim/readme.md"))
    autocmd VimEnter * :PlugInstall --sync
endif
