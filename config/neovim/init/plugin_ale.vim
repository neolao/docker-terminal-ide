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
