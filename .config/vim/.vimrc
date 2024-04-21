""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""   general settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> leader stuff
let mapleader = " "
" let maplocalleader = ','
""> reloading .vimrc [only works for certain tweaks]
nnoremap <leader>r :w<CR>:source $MYVIMRC<CR>
""> disabling compatibility with vi
set nocompatible
""> filetype detection plugins are enabled 
filetype plugin on
""> enable language-dependent indenting
filetype plugin indent on
""> navigating between buffers without saving
set hidden 
""> clipboard : vim's vs the system's
set clipboard=unnamedplus
"" vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
"" map <C-l> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JkJ:set nopaste<CR>
"">  show theys I type in normal  mode at the bottom of the page
set showcmd
""> setting up the swap thingy : it is driving me crazy!!
"set directory^=/home/reda/.vim/swappy_temp_dir//
set noswapfile
""> reading man pages inside of vim, using the built-in :Man command
runtime! ftplugin/man.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""   UI related settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> line numbers on the side
set number relativenumber
""> horizontal line to indicate the location of the cursor
set cursorline 
""> show the status line at the bottom
set laststatus=2
""> wrap line at the end
set wrap
""> setting the capacity of history [50]
set history=300
""> setting syntax highlighting
syntax on
" > Auto read when a file is changed on disk
set autoread
""> do not go all the way up/down before scrolling
set scrolloff=3
""> when I tab in command mode I want a suggestions menu
set wildmenu
set wildoptions+=pum
set wildchar=<Tab>  wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
""> set up my colorscheme
colorscheme lunaperche

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""    Editing settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> setting up tab stuff
set  tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType cpp set foldmethod=syntax
""> more and more undo levels
set undolevels=1000
""""> moving lines of text/code
""nnoremap <leader>j :m .+1<CR>==
""nnoremap <leader>k :m .-2<CR>==
""vnoremap <leader>j :m '>+1<CR>gv=gv
""vnoremap <leader>k :m '<-2<CR>gv=gv
""> native spell checking | this toggles it
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>
""> native code autocompletion 
set omnifunc=syntaxcomplete#Complete
" autocmd FileType python set omnifunc=python3complete#Complete
""> forgot to open the file with sudo privileges
nnoremap <leader>- :w !sudo tee %<CR>
""> see the diff for an edited file 
nnoremap <leader>e :w !diff % -<CR>
""> capitalizing words
" capitalize inside word
nnoremap gu guiw~l
""> less dizzying half page up and down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
""> Allow undoing after quitting 
" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo_dir")
    call mkdir($HOME."/.vim/undo_dir", "", 0700)
endif
set undodir=~/.vim/undo_dir
set undofile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""  searching stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> enable highlighting 
set hlsearch
""> mapping the disabling of the highlighting after finishing 
nnoremap <leader>p <Esc><Esc>:nohlsearch<Esc>
"">  show search matches as you type
set incsearch
""> searching is now case-insensitive
set ignorecase
""> If a capital letter is included in search, make it case-sensitive
set smartcase   
""> searching for files should include everything in our code base
set path+=**
"">ctags stuff
set mouse=n
map <2-LeftMouse> g<c-]>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""   setting up key mappings 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> switching between modes
inoremap jk <Esc>
inoremap kj <Esc>
" nnoremap ; :
" nnoremap : ;
nnoremap <leader>; ;
vnoremap ;l <Esc>
""> saving and quitting stuff
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
""> navigating text in normal mode
nnoremap { }
nnoremap } {
vnoremap { }
vnoremap } {
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
""> buffer stuff
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>b :ls<CR>:b 
" nnoremap <leader>d :w<CR>:bd<CR>
" nnoremap <leader>wq :wqa<CR>
" nnoremap <leader>w :wa<CR>
" nnoremap <leader>q :qa<CR>
" nnoremap <leader>q! :qa!<CR>
""> running commands in the vim terminal 
nnoremap <leader>c :terminal<CR>
""> tabs
nnoremap <leader>j :tabn<CR>
nnoremap <leader>k :tabp<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""  setting up the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> :help statusline :: [Learn to Create a Simple vimrc File With Helpful Examples From a Useful Vim Configuration Template](https://vimandgit.com/posts/vim/beginners/vim-config-vimrc-options-settings-and-neovim-init-configuration.html)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting up vimwiki and eventual plugins [maybe]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"> the autosave plugin  I put it in  in ~/.vim/plugins/Autosave.vim
"> I then :set rtp+=~/.vim/plugins   ; the :source ~/.vim/plugins/Autosave.vim
let g:auto_save = 0  " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
set rtp+=~/.vim/plugins/
source ~/.vim/plugins/AutoSave.vim

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
noremap gc :Commentary<CR>

" " write and refresh in browse
" nnoremap <leader>a :silent! !~/memalpha/arbeiten/reda_website/reload.sh<cr>


source ~/dottas/.config/vim/modules/colorschemes/colors.vim
source ~/dottas/.config/vim/modules/netrw/netrw_um.vim
source ~/dottas/.config/vim/modules/vimwiki/vimwiki_um.vim
source ~/dottas/.config/vim/modules/code/cpp.vim
