" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-l> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-h> :set paste<CR>m`O<Esc>``:set nopaste<CR>


nnoremap <leader>yy :set nonumber norelativenumber<CR>
nnoremap <leader>yu :set number relativenumber<CR>


