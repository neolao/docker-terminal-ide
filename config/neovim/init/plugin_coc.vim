let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-yaml']
if $DENO
    let g:coc_global_extensions = g:coc_global_extensions + ['coc-tsserver', 'coc-deno']
elseif $TYPESCRIPT
    let g:coc_global_extensions = g:coc_global_extensions + ['coc-tsserver', 'coc-eslint', 'coc-styled-components']
endif
