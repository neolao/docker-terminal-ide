if $DENO
    let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-yaml', 'coc-tsserver', 'coc-deno']
elseif $TYPESCRIPT
    let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-yaml', 'coc-tsserver']
endif
