let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_shortest_import_path = 1
let g:tsuquyomi_use_local_typescript = 1

if $TYPESCRIPT
  set completeopt=longest,menuone
  set omnifunc=tsuquyomi#complete
  autocmd FileType typescript TsuReload
  autocmd FileType typescript setlocal omnifunc=tsuquyomi#complete
  autocmd FileType typescript setlocal completeopt+=menu,preview
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
endif
