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

call quickui#menu#install('Edit', [
            \ [ "Undo\tCtrl+z", ':undo' ],
            \ [ "Redo\tCtrl+r", ':redo' ],
            \ [ "--", '' ],
            \ [ "Select all\tCtrl+a", 'ggVG' ],
            \ [ "--", '' ],
            \ [ "Delete lines\tCtrl+d", ':delete' ],
            \ [ "Move up lines\tCtrl+u", ':.move .-2' ],
            \ [ "Move down lines\tCtrl+j", ':.move .+1' ],
            \ [ "Duplicate lines\tCtrl+k", ':.copy .' ],
            \ ])

call quickui#menu#install('Tabs', [
            \ [ "Move tab to the left", ':tabmove -1' ],
            \ [ "Move tab to the right", ':tabmove +1' ],
            \ ])

call quickui#menu#install('Explorer', [
            \ [ "Toggle", ':NERDTreeTabsToggle' ],
            \ [ "Reveal current file\tCtrl+g", ':NERDTreeFind' ],
            \ ])

function! SearchInFiles()
    let searchTerm = input('Search in files: ')
    execute "CtrlSF " searchTerm
endfunction
call quickui#menu#install('Search', [
            \ [ "Search by file path\tCtrl+o", ':CtrlP' ],
            \ [ "Search in files\tCtrl+f", ':call SearchInFiles()' ],
            \ [ "Toggle Search in files", ':CtrlSFToggle' ],
            \ ])

call quickui#menu#install('Plugins', [
            \ [ "Status", ':PlugStatus' ],
            \ [ "Install plugins", ':PlugInstall' ],
            \ [ "Update plugins", ':PlugUpdate' ],
            \ [ "Remove unlisted plugins", ':PlugClean' ],
            \ [ "Upgrade vim-plug", ':PlugUpgrade' ],
            \ ])

let typescriptEntries = [
            \ [ "Format", ':Prettier' ],
            \ ]
if $DENO
    call quickui#menu#install('Completion', [
            \ [ "COC Info", ':CocInfo' ],
            \ [ "COC Restart", ':CocRestart' ],
            \ ], '<auto>', 'ts,tsx,typecript')
endif

if $TYPESCRIPT
    let typescriptEntries = typescriptEntries + [
            \ [ "--", '' ],
            \ [ "Tsuquyomi Reload", ':TsuquyomiReload' ],
            \ [ "Tsuquyomi Check server", ':TsuquyomiStatusServer' ],
            \ [ "Tsuquyomi Start server", ':TsuquyomiStartServer' ],
            \ [ "Tsuquyomi Stop server", ':TsuquyomiStopServer' ],
            \ ]
endif

call quickui#menu#install('Typescript', typescriptEntries, '<auto>', 'ts,tsx,typescript')


call quickui#menu#install('JSON', [
            \ [ "Format", ':Prettier' ],
            \ ], '<auto>', 'json')

call quickui#menu#install('Javascript', [
            \ [ "Format", ':Prettier' ],
            \ ], '<auto>', 'js,jsx,javascript')

call quickui#menu#install('YAML', [
            \ [ "Format", ':Prettier' ],
            \ ], '<auto>', 'yml,yaml')

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" Border style
let g:quickui_border_style = 2

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>