

""> setting up netrw 
nnoremap <leader>f :Lexplore %:p:h<CR>
nnoremap <leader>d :Lexplore<CR>
""> Keep the current directory and the browsing directory synced. This helps you avoid the move files error.
let g:netrw_keepdir = 0 
""> hide the annoying banner in netrw
let g:netrw_banner = 0  
""> netrw is going tree-style
let g:netrw_liststyle = 1
""> Change the copy command. Mostly to enable recursive copy of directories.
let g:netrw_localcopydircmd = 'cp -r'
""> Highlight marked files in the same way search matches are.
hi! link netrwMarkFile Search
set modifiable
""> here is where to continue the setup of netrw :: [Using Netrw, vim's builtin file explorer | Devlog](https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/)
" Hide dotfiles
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


if &columns < 90
  " If the screen is small, occupy half
  let g:netrw_winsize = 50
else
  " else take 30%
  let g:netrw_winsize = 30
endif

" Delete a non-empty directory
function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    " Prepare the delete command.
    " Make it so that is triggered by just pressing Enter
    cnoremap <buffer> <CR> rm -r<CR>
    " Unmark all files (don't want to delete anything by accident)
    normal mu

    " Mark the file/directory under the cursor
    normal mf

    " Show the prompt to enter the command
    " In here you either press Enter to confirm
    " or press ctrl + c to abort.
    " Don't do anything else!
    try
      normal mx
    catch
      echo "Canceled"
    endtry

    " Undo the Enter keymap
    cunmap <buffer> <CR>
  endif
endfunction

"" setting up netrw key mappings
function! NetrwMappings()
    nmap <buffer> h -
    nmap <buffer> l <CR>
    nmap <buffer> . gh
    nmap <buffer> P <C-w>z
    nmap <buffer> H u
    nmap <buffer> L <CR>:Lexplore<CR>
    nmap <buffer> . gh
    "" marking files
    nmap <buffer> <TAB> mf
    "" unmark all files in the current buffer
    nmap <buffer> <S-TAB> mF
    "" unmark all files
    nmap <buffer> <leader><TAB> mu
    "" file management
    nmap <buffer> ff %:w<CR>:buffer #<CR>
    nmap <buffer> fr R
    nmap <buffer> fc mc
    nmap <buffer> fC mtmc
    nmap <buffer> fm mm
    nmap <buffer> fM mtmm
    nmap <buffer> fx mx
    " Show the list of marked files
    nmap <buffer> fl :echo netrw#Expose("netrwmarkfilelist")<CR>
    " Show the current target directory
    nmap <buffer> fq :echo "Target:" . netrw#Expose("netrwmftgt")<CR>
    " Set the directory under the cursor as the current target
    nmap <buffer> fd mtfq
    " Delete a file
    nmap <buffer> FF :call NetrwRemoveRecursive()<CR>
    " 'Bookmark' a directory
    nmap <buffer> bb mb
    " Delete the most recent directory bookmark
    nmap <buffer> bd mB
    " Got to a directory on the most recent bookmark
    nmap <buffer> bl gb
endfunction


augroup NetrwMappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END
