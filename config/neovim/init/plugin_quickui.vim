" clear all the menus
call quickui#menu#reset()

call quickui#menu#install('File', [
            \ [ "New File", ':tabnew' ],
            \ [ "Close", ':q' ],
            \ [ "--", '' ],
            \ [ "Save", ':w'],
            \ [ "--", '' ],
            \ [ "Exit", ':qa!' ],
            \ ])

call quickui#menu#install('Plugins', [
            \ [ "Status", ':PlugStatus' ],
            \ [ "Install plugins", ':PlugInstall' ],
            \ [ "Update plugins", ':PlugUpdate' ],
            \ [ "Remove unlisted plugins", ':PlugClean' ],
            \ [ "Upgrade vim-plug", ':PlugUpgrade' ],
            \ ])

if $DENO
    call quickui#menu#install('Completion', [
            \ [ "COC Info", ':CocInfo' ],
            \ [ "COC Restart", ':CocRestart' ],
            \ ])
endif

if $TYPESCRIPT
    call quickui#menu#install('Typescript', [
            \ [ "Tsuquyomi Reload", ':TsuquyomiReload' ],
            \ [ "Tsuquyomi Check server", ':TsuquyomiStatusServer' ],
            \ [ "Tsuquyomi Start server", ':TsuquyomiStartServer' ],
            \ [ "Tsuquyomi Stop server", ':TsuquyomiStopServer' ],
            \ ])
endif

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" Border style
let g:quickui_border_style = 2

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>
