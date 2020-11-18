" clear all the menus
call quickui#menu#reset()

call quickui#menu#install('&File', [
            \ [ "New File", ':tabnew' ],
            \ [ "Close", ':q' ],
            \ [ "--", '' ],
            \ [ "Save", ':w'],
            \ [ "--", '' ],
            \ [ "Exit", ':qa!' ],
            \ ])

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" Border style
let g:quickui_border_style = 2

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>
