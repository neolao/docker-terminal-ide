let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

"let g:airline#extensions#tabline#enabled = 1

"autocmd VimEnter * :AirlineRefresh
"autocmd TabEnter * :AirlineRefresh
"autocmd TabLeave * :AirlineRefresh
"autocmd BufEnter * :AirlineRefresh
"autocmd BufLeave * :AirlineRefresh

" the user doesn't press a key for a while
autocmd CursorHold * :AirlineRefresh

" the user doesn't press a key for a while in Insert mode
autocmd CursorHoldI * :AirlineRefresh

"autocmd CursorMoved * :AirlineRefresh
"autocmd CursorMovedI * :AirlineRefresh
