" Name:     vimrc
" Author:   Aniket
" Modified: 28th May 2016
" --------------------------- Vundle ------------------------------ {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rking/ag.vim'
" colorschemes
Plugin 'https://github.com/altercation/solarized.git'
Plugin 'jacoborus/tender'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required

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
"}}}
" --------------------------- General + UI ------------------------ {{{
set number              " displays line numbers
set showcmd             " show command bar
set wildmenu            " visual autocomplete for cmd menu
set lazyredraw
set colorcolumn=80      " sets a color column at 80 characters
set showmatch           " highlights matching parentheses
set hlsearch            " highlights matched patterns
set incsearch           " searches while typing in pattern
set backspace=indent,eol,start
set ruler               " shows cursor line and column number
set confirm             " activates confirmation messages
set noerrorbells
set foldenable          " enable folding by default
set mouse=a             " allow mouse use
let mapleader=","
set splitright
set splitbelow
set list listchars=tab:»·,trail:· " highlights trailing whitespaces
set laststatus=2        " makes airline appear
set notimeout ttimeout ttimeoutlen=100
"}}}
" --------------------------- Indentation settings ---------------- {{{
filetype plugin indent on   " enables filetype
syntax on                   " activates syntax
set tabstop=4               " number of visual spaces per tab
set shiftwidth=4            " controls the level of indentation
set softtabstop=4           " number of spaces used while editing
set expandtab               " converts tabs to space
set autoindent              " sets autoindentation for all files
"}}}
" --------------------------- file specific indentation ----------- {{{
augroup vim_folding         " folding method just for the vimrc
    autocmd!
    autocmd FileType vim setlocal foldlevelstart=0 foldmethod=marker
augroup END

augroup ruby_indent
    autocmd!
    autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
augroup END

augroup py_indent
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
augroup END

augroup makefile_indent
    autocmd!
    autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

augroup cpp_indent
    autocmd!
    autocmd FileType c++ setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType cpp setlocal expandtab shiftwidth=2 softtabstop=2
augroup END

"}}}
" --------------------------- Colors ------------------------------ {{{

let g:solarized_termcolors=256
syntax enable
set background=dark                 " uses a dark background for vim
colorscheme badwolf                 " theme setter
let g:airline_theme='badwolf'
let badwolf_tabline=0

" Some custom highlighting to get the background color correct
" hi Normal ctermbg=none ctermfg=none
" hi NonText ctermbg=none
" hi Folded ctermbg=none

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
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap <leader>g gg=G
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>" viw<ESC>a"<ESC>hbi"<ESC>lel
nnoremap <leader>' viw<ESC>a'<ESC>hbi'<ESC>lel
nnoremap H ^
nnoremap L $
inoremap jk <ESC>
" maps the F4 key to insert a header in the current file
inoremap <F4> <ESC>mz:execute FillHeader()<CR>`z8jA
"}}}
" --------------------------- functions --------------------------- {{{

function! FillHeader()
    let s:line = line(".")
    call setline(s:line, "/***")
    call append(s:line,  " * Author:                 Aniket Mathur")
    call append(s:line+1, " * Email:                 a3mathur@ucsd.edu")
    call append(s:line+2, " *")
    call append(s:line+3, " * Date:                  " .strftime("%b %d, %Y"))
    call append(s:line+4, " *")
    call append(s:line+5, " * File:                  " .expand("%"))
    call append(s:line+6, " *")
    call append(s:line+7, " * Description:           ")
    call append(s:line+8, " ***/")
    unlet s:line
endfunction
"}}}
" --------------------------- Abbreviations ----------------------- {{{
" Typo correction plus small convenience while typing lots of things
cnoreabbrev Wq wq
cnoreabbrev WQ wq
inoreabbrev @@ aniketmathur000@gmail.com
" }}}
