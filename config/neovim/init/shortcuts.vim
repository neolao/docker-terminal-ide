" Tabs
map <C-t> :tabnew<cr>
imap <C-t> <Esc><C-t>
vmap <C-t> <Esc><C-t>
"map <C-w> :tabclose<cr>
"imap <C-w> <Esc><C-w>
"vmap <C-w> <Esc><C-w>
noremap <tab> :tabnext<cr>
map ,<tab> :tabprevious<cr>
map <S-tab> :tabprevious<cr>

" F7 : [PLUGIN] NERDTree
map <silent> <F7> :execute ToggleNERDTree()<cr>
map <C-e> :execute ToggleNERDTree()<cr>
imap <C-e> :execute ToggleNERDTree()<cr>
vmap <C-e> :execute ToggleNERDTree()<cr>
imap <F7> <Esc><F7>
vmap <F7> <Esc><F7>
map <silent> <F4> :NERDTreeFind<cr>
imap <F4> <Esc><F4>
vmap <F4> <Esc><F4>

" F8 : [PLUGIN] TagBar
map <silent> <F8> :execute ToggleTagBar()<cr>
map <C-l> :execute ToggleTagBar()<cr>
imap <C-l> :execute ToggleTagBar()<cr>
vmap <C-l> :execute ToggleTagBar()<cr>
imap <F8> <Esc><F8>
vmap <F8> <Esc><F8>

" Supprimer une ligne
map <silent> <C-d> :delete<cr>
imap <C-d> <Esc><C-d>:startinsert<cr>

" Déplacer la ligne vers le haut
map <silent> <C-u> :.move .-2<cr>
imap <C-u> <Esc><C-u>:startinsert<cr>

" Déplacer la ligne vers le bas
map <silent> <C-j> :.move .+1<cr>
imap <C-j> <Esc><C-j>:startinsert<cr>

" Déplacer les lignes vers le haut
vmap <silent> <C-u> :move '<-2<cr>gv

" Déplacer les lignes vers le bas
vmap <silent> <C-j> :move '>+1<cr>gv

" Dupliquer la ligne vers le haut
"map <silent> <C-i> :.copy .-1<cr>
"inoremap <C-i> <Esc>:.copy .-1<cr>:startinsert<cr>

" Dupliquer la ligne vers le bas
map <silent> <C-k> :.copy .<cr>
imap <C-k> <Esc><C-k>:startinsert<cr>

" Dupliquer les lignes vers le haut
vmap <silent> <C-i> :copy '><cr>gv

" Dupliquer les lignes vers le bas
vmap <silent> <C-k> :copy '<-1<cr>gv


