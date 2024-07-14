""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""   general settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> leader stuff
let mapleader = " "
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
"">  show theys I type in normal  mode at the bottom of the page
set showcmd
""> setting up the swap thingy : it is driving me crazy!!
"set directory^=/home/reda/.vim/swappy_temp_dir//
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""   UI related settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> line numbers on the side
set number relativenumber
""> horizontal line to indicate the location of the cursor
set cursorline 
""> show the status line at the bottom
set laststatus=2
""> wrap line at the end
set wrap
""> setting the capacity of history [50]
set history=50
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""    Editing settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""> setting up tab stuff
set  tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType cpp set foldmethod=syntax
""> more and more undo levels
set undolevels=1000
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""  searching stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""   setting up key mappings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""> running commands in the vim terminal 
nnoremap <leader>c :terminal<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting up vimwiki and eventual plugins [maybe]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/plugins/

"" automating the installation of vim plug
""curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'unblevable/quick-scope'
Plug 'vimwiki/vimwiki'
call plug#end()



source ~/dottas/.config/vim/modules/colorschemes/colors.vim
source ~/dottas/.config/vim/modules/netrw/netrw_um.vim
source ~/dottas/.config/vim/modules/vimwiki/vimwiki_um.vim
source ~/dottas/.config/vim/modules/code/cpp.vim
source ~/dottas/.config/vim/modules/keybinds/normal_mode_general.vim
" plugins
source ~/dottas/.config/vim/modules/important_plugins/git_gutter.vim
source ~/dottas/.config/vim/modules/important_plugins/fzf_vim_OSes_are_cool.vim
source ~/dottas/.config/vim/modules/important_plugins/vim_airline_vanity.vim
source ~/dottas/.config/vim/modules/important_plugins/quickscope_horizontal_mvmvt.vim
source ~/dottas/.config/vim/modules/important_plugins/cocky.vim
source ~/dottas/.config/vim/modules/funcs/delete_empty_no_name_buffers.vim
