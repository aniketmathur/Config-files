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
"Plugin 'rking/ag.vim'
Plugin 'chrisbra/csv.vim'
" colorschemes
Plugin 'https://github.com/KeitaNakamura/neodark.vim'
Plugin 'https://github.com/tyrannicaltoucan/vim-quantum'
Plugin 'https://github.com/joshdick/onedark.vim'
Plugin 'https://github.com/altercation/solarized.git'
Plugin 'mhartington/oceanic-next'
Plugin 'ryanoasis/vim-devicons'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

"Plugin 'https://github.com/Valloric/YouCompleteMe.git'
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
set lazyredraw          " Don't redraw unless necessary
set colorcolumn=80      " sets a color column at 80 characters
set showmatch           " highlights matching parentheses
set hlsearch            " highlights matched patterns
set incsearch           " searches while typing in pattern
set backspace=indent,eol,start
set ruler               " shows cursor line and column number
set confirm             " activates confirmation messages
set noerrorbells        " the most necessary thing ever
"set scrolloff=10        " start scrolling when 10 lines from the edge
set foldenable          " enable folding by default
set mouse=a             " allow mouse use
let mapleader=","
set splitright
set splitbelow
set list listchars=tab:»·,trail:· " highlights trailing whitespaces
set laststatus=2        " makes airline appear
set notimeout ttimeout ttimeoutlen=100

augroup set_scrolloff
    autocmd!
    autocmd VimEnter,VimResized * call WinSizeSetScrollOff()
augroup END

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep=' '
let g:airline_right_sep=' '

set guifont=InconsolataForPowerline\ Nerd\ Font:h13
"}}}
" --------------------------- Indentation settings ---------------- {{{
filetype plugin indent on   " enables filetype
syntax on                   " activates syntax
"set tabstop=4               " number of visual spaces per tab
set shiftwidth=4            " controls the level of indentation
set softtabstop=4           " number of spaces used while editing
set autoindent              " sets autoindentation for all files
set expandtab               " tabs to spaces automagically
"}}}
" --------------------------- file specific indentation ----------- {{{
augroup coffee
    autocmd!
    autocmd bufReadPre,BufNewFile *.coffee setlocal filetype=javascript
augroup END

augroup kwmrc
    autocmd!
    autocmd bufReadPre,BufNewFile kwmrc setlocal filetype=javascript
augroup END

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

augroup bash
    autocmd!
    autocmd FileType sh setlocal noexpandtab shiftwidth=4 tabstop=4
augroup END

"}}}
" --------------------------- Colors ------------------------------ {{{

syntax enable
"set background=dark                 " uses a dark background for vim

" support use of 24 bit colors if available
if (has("termguicolors"))
    set termguicolors
else
    set t_Co=256
endif

let g:neodark#background='#191919'
let g:airline_theme='neodark'
colorscheme neodark                  " theme setter
set cursorline
hi CursorLine ctermbg=none guibg=NONE
hi CursorLineNr ctermbg=none guibg=NONE
"let g:quantum_black=1

" Some custom highlighting to get the background color correct
"hi Normal ctermbg=none ctermfg=none
"hi Folded ctermbg=0F7674
"hi LineNr ctermbg=0F7674 ctermfg=586e75
"hi ColorColumn ctermbg=0F7674
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
nnoremap ; :
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

function! WinSizeSetScrollOff()
    if  &lines < 40
        set scrolloff=0
    elseif &lines >= 40 && &lines < 80
        set scrolloff=5
    elseif &lines >= 80 && &lines < 100
        set scrolloff=15
    else
        set scrolloff=35
    endif
endfunction
"}}}
" --------------------------- Abbreviations ----------------------- {{{
" Typo correction plus small convenience while typing lots of things
cnoreabbrev Wq wq
cnoreabbrev WQ wq
inoreabbrev @@ aniketmathur000@gmail.com
" }}}
