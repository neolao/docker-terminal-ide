set statusline+=%#warningmsg#
if exists("*SyntasticStatuslineFlag")
    set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']
if $NODEJS_DEFAULT_VERSION
    let g:syntastic_json_checkers = ['jsonlint']
endif


