

nnoremap <F3> :!~/dottas/.config/vim/modules/code/cpp.sh<CR>
nnoremap <F2> :!clear; rm %.out 2> /dev/null; g++ -o %.out % && ./%.out<CR>
" <F5> to run a bash script from the current working dir
" nnoremap <F5> :w|!clear|!%<CR>
nnoremap <F5> :w<CR>:!clear && ./%<CR>
