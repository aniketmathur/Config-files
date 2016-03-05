" Name:     vimrc
" Author:   Aniket
" Modified: 11th February 2016
" --------------------------- Vundle ------------------------------ {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'https://github.com/altercation/solarized.git'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}}
" --------------------------- General + UI ------------------------ {{{
set number              " displays line numbers
set showcmd             " show command bar
set wildmenu            " visual autocomplete for cmd menu
set colorcolumn=80      " sets a color column at 80 characters
set showmatch           " highlights matching parentheses
set hlsearch            " highlights matched patterns
set incsearch           " searches while typing in pattern
set backspace=indent,eol,start
set ruler               " shows cursor line and column number
set confirm             " activates confirmation messages
set visualbell
"set t_vb=
set mouse=a
let mapleader=","
set foldenable          " enable folding
set foldlevelstart=0    " open most folds by default
set foldmethod=marker   " folds based on indent level
set splitright
set splitbelow
set list listchars=tab:»·,trail:· " highlights trailing whitespaces
"}}}
" --------------------------- Arm Assembly ------------------------ {{{
let asmsyntax='armasm'
let filetype_inc='armasm'
"}}}
" --------------------------- Indentation settings ---------------- {{{
set tabstop=4               " number of visual spaces per tab
set shiftwidth=4            " controls the level of indentation
set softtabstop=4           " number of spaces used while editing
set expandtab               " converts tabs to space
filetype plugin indent on   " enables filetype
syntax on                   " activates syntax
set autoindent              " sets autoindentation for all files
"}}}
" --------------------------- Colors ------------------------------ {{{

let g:solarized_termcolors=256
syntax enable
set background=dark                 " uses a dark background for vim
colorscheme solarized               " theme setter

" Some custom highlighting to get the background color correct
hi Normal ctermbg=none ctermfg=none
hi NonText ctermbg=none
hi Folded ctermbg=none

"}}}
" --------------------------- Key Remappings ---------------------- {{{
" remaps the keys to make it easier to move around in split mode
" makes it a single keypress action instead of two keypresses
" using the movement keys (h, j, k, l) while holding down the
" control key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <space> za
" maps the F4 key to insert a header in the current file
inoremap <F4> <ESC>mz:execute FillHeader()<CR>`z7jA
"}}}
" --------------------------- file specific indentation ----------- {{{
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType c++ setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType cpp setlocal expandtab shiftwidth=2 softtabstop=2
"}}}
" --------------------------- functions --------------------------- {{{

function FillHeader()
    let s:line = line(".")
    call setline(s:line, "/***")
    call append(s:line,  " * Author:                ")
    call append(s:line+1, " * Email:                 a3mathur@ucsd.edu")
    call append(s:line+2, " *")
    call append(s:line+3, " * Date:                  " .strfitme("%b %d, %Y"))
    call append(s:line+4, " *")
    call append(s:line+5, " * File:                  " .expand("%"))
    call append(s:line+6, " *")
    call append(s:line+7, " * Description:           ")
    call append(s:line+8, " ***/")
    unlet s:line
endfunction
"}}}
