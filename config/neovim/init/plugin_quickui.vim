" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" Border style
let g:quickui_border_style = 2

" Color scheme
"let g:quickui_color_scheme = 'papercol dark'
let g:quickui_color_scheme = 'papercol light'

" clear all the menus
call quickui#menu#reset()

call quickui#menu#install('File', [
            \ [ "Reload", ':edit' ],
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

if !exists("g:last_replaces")
    let g:last_replaces = []
    let g:last_replaces_opts = {'title': 'Replace', 'index':g:quickui#listbox#cursor, 'syntax': 'less', 'color': 'QuickBG'}
endif
function! PromptAndSearchInProject()
    let l:searchTerm = input('Search in project: ')
    execute "CtrlSF " . l:searchTerm
endfunction
function! ReplaceAllInCurrentFile()
    let l:searchTerm = input('Search in current file: ')
    let l:replaceTerm = input('Replaced by: ')
    let l:command = "%s/" . l:searchTerm . "/" . l:replaceTerm . "/g"
    execute l:command
    let g:last_replaces = [ [ '"' . l:searchTerm . '" by "' . l:replaceTerm . '"', l:command ]] + g:last_replaces
endfunction
call quickui#menu#install('Search', [
            \ [ "Search by file path\tCtrl+o", ':CtrlP' ],
            \ [ "Search in files\tCtrl+f", ':call PromptAndSearchInProject()' ],
            \ [ "Toggle Search in files", ':CtrlSFToggle' ],
            \ [ "Replace all in current file", ':call ReplaceAllInCurrentFile()' ],
            \ [ "Last replaces\tCount: %{len(g:last_replaces)}", 'call quickui#listbox#open(g:last_replaces, g:last_replaces_opts)' ],
            \ ])

call quickui#menu#install('Plugins', [
            \ [ "Status", ':PlugStatus' ],
            \ [ "Install plugins", ':PlugInstall' ],
            \ [ "Update plugins", ':PlugUpdate' ],
            \ [ "Remove unlisted plugins", ':PlugClean' ],
            \ [ "Upgrade vim-plug", ':PlugUpgrade' ],
            \ ])

let g:auto_prettier_typescript_enabled = 0
let g:auto_deno_format_enabled = 0

function! ToggleAutoPrettierTypescript()
    if g:auto_prettier_typescript_enabled
        let g:auto_prettier_typescript_enabled = 0
        autocmd! AutoPrettierTypescript BufWritePost *.ts
    else
        let g:auto_deno_format_enabled = 0
        let g:auto_prettier_typescript_enabled = 1
        augroup AutoPrettierTypescript
            autocmd BufWritePost *.ts silent Prettier %
            autocmd BufWritePost *.ts edit
        augroup END
    endif
endfunction

function! ToggleAutoDenoFormat()
    if g:auto_deno_format_enabled
        let g:auto_deno_format_enabled = 0
        autocmd! AutoDenoFormat BufWritePost *.ts
    else
        let g:auto_prettier_typescript_enabled = 0
        let g:auto_deno_format_enabled = 1
        augroup AutoDenoFormat
            autocmd BufWritePost *.ts silent !deno fmt %
            autocmd BufWritePost *.ts edit
        augroup END
    endif
endfunction

let s:typescriptEntries = [
            \ [ "Prettier format", ':Prettier' ],
            \ [ "Toggle auto Prettier format\t%{get(g:, 'auto_prettier_typescript_enabled', 1)? 'On':'Off'}", ':call ToggleAutoPrettierTypescript()' ],
            \ ]
if $DENO
    call ToggleAutoDenoFormat()

    call quickui#menu#install('Completion', [
            \ [ "COC Info", ':CocInfo' ],
            \ [ "COC Restart", ':CocRestart' ],
            \ ], '<auto>', 'ts,tsx,typecript')
    let s:typescriptEntries = s:typescriptEntries + [
            \ [ "Deno format", ':! deno fmt %' ],
            \ [ "Toggle auto deno format\t%{get(g:, 'auto_deno_format_enabled', 1)? 'On':'Off'}", ':call ToggleAutoDenoFormat()' ],
            \ ]
endif

if $TYPESCRIPT
    "let s:typescriptEntries = s:typescriptEntries + [
    "        \ [ "--", '' ],
    "        \ [ "Tsuquyomi Reload", ':TsuquyomiReload' ],
    "        \ [ "Tsuquyomi Check server", ':TsuquyomiStatusServer' ],
    "        \ [ "Tsuquyomi Start server", ':TsuquyomiStartServer' ],
    "        \ [ "Tsuquyomi Stop server", ':TsuquyomiStopServer' ],
    "        \ ]
endif

call quickui#menu#install('Typescript', s:typescriptEntries, '<auto>', 'ts,tsx,typescript')


call quickui#menu#install('PHP', [
            \ [ "CS Fixer", ':call PhpCsFixerFixFile()' ],
            \ [ "Go to definition", ':PhpactorGotoDefinition' ],
            \ [ "Go to definition (new tab)", ':PhpactorGotoDefinitionTab' ],
            \ [ "Go to implementations", ':PhpactorGotoImplementations' ],
            \ [ "Find references", ':PhpactorFindReferences' ],
            \ ], '<auto>', 'php')

call quickui#menu#install('JSON', [
            \ [ "Format", ':Prettier' ],
            \ ], '<auto>', 'json')

call quickui#menu#install('Javascript', [
            \ [ "Format", ':Prettier' ],
            \ ], '<auto>', 'js,jsx,javascript')

call quickui#menu#install('YAML', [
            \ [ "Format", ':Prettier' ],
            \ ], '<auto>', 'yml,yaml')

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>




function! SearchInFile()
    let l:wordUnderCursor = expand("<cword>")
    let @/="" . l:wordUnderCursor . "\\c"
    execute "normal ggn"
endfunction
function! SearchAndReplaceInFile()
    let l:wordUnderCursor = expand("<cword>")
    let l:newWord = input('Replace "' . wordUnderCursor . '" by: ')
    execute "%s/" . l:wordUnderCursor . "/" . l:newWord . "/g"
endfunction
function! SearchInProject()
    let l:wordUnderCursor = expand("<cword>")
    execute "CtrlSF " . l:wordUnderCursor
endfunction
let contextMenu = [
            \ ["Search in file", ':call SearchInFile()' ],
            \ ["Search in project", ':call SearchInProject()' ],
            \ ["Search and replace in file", ':call SearchAndReplaceInFile()' ],
            \ ]

" set cursor to the last position
" Note: disabled because it breaks some features (ex. go to implementations)
"let opts = {'index':g:quickui#context#cursor}
"noremap <C-m> :call quickui#context#open(contextMenu, opts)<cr>
