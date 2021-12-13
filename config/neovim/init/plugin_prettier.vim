" Enable auto formatting of files that have "@format" or "@prettier" tag
let g:prettier#autoformat = 1

" Allow auto formatting for files without "@format" or "@prettier" tag
let g:prettier#autoformat_require_pragma = 0

" To run vim-prettier not only before saving, but also after changing text or leaving insert mode
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
