"if exists("*ncm2#enable_for_buffer")
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect
"endif
