

nnoremap <F3> :!~/dottas/.config/vim/modules/code/cpp.sh<CR>
nnoremap <F2> :!clear; rm %.out 2> /dev/null; g++ -o %.out % && ./%.out<CR>
