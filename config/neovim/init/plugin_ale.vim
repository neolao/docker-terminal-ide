function! FormatDeno(buffer) abort
    return {
        \   'command': 'deno fmt -'
        \}
endfunction
"execute ale#fix#registry#Add('denofmt', 'FormatDeno', ['typescript'], 'deno fmt for TypeScript')


if $DENO
    let g:ale_disable_lsp = 1
endif

let g:airline#extensions#ale#enabled = 1
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\}


" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

"let g:ale_typescript_tslint_config_path = ''

"let g:ale_fixers = { 'php': ['php_cs_fixer'] }
"let g:ale_fixers = { 'typescript': ['eslint'] }
"let g:ale_fixers = { 'php': ['php_cs_fixer'], 'typescript': ['tslint'] }
"let g:ale_php_phpstan_configuration = '/workspace/.phpstan/phpstan.neon'
