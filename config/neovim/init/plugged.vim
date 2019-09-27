" Setup plugins
if filereadable(expand("~/plug.vim"))
    source ~/plug.vim
endif
call plug#begin('~/.config/nvim/plugged')

" UI
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'powerline/powerline'
Plug '~/.config/nvim/themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" File explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neolao/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pseewald/nerdtree-tagbar-combined'

Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
Plug 'isRuslan/vim-es6'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim'
Plug 'majutsushi/tagbar'
Plug 'vimlab/split-term.vim'
Plug 'niftylettuce/vim-jinja'
Plug 'cloudhead/neovim-fuzzy'
Plug 'prettier/vim-prettier', {'do' : 'npm install', 'for' : ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue']}
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Git
Plug 'lambdalisue/gina.vim'

" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Linter
Plug 'w0rp/ale'

" To display and auto remove whitespace
Plug 'ntpeters/vim-better-whitespace'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi', {'do' : 'npm install -g typescript'}

" styled components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Interface
Plug 'neolao/vim-eighties'

" Markdown table
Plug 'dhruvasagar/vim-table-mode'

if $NEOVIM_PLUGIN_TERN
    Plug 'ternjs/tern_for_vim'
endif

if $NEOVIM_PLUGIN_PHPCD
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
endif

call plug#end()
