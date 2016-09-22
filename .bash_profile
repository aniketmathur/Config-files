#!/usr/local/bin/bash

# ease of access variables
MYVIMRC="$HOME/.vimrc"
MYBASH="$HOME/.bash_profile"

# aliases
alias grep="grep --color=always"
alias ls="ls --color"
alias EV="vi $MYVIMRC"
alias EBP="vi $MYBASH"
alias SBP=". $MYBASH"

# old prompt color
#export PS1="[\[\033[38;5;39m\]\u\[\033[38;5;15m\]:\[\033[38;5;50m\]\W\[\033[38;5;15m\]]>\[$(tput sgr0)\] "

# updated prompt that prevents colors from mixing
BLUE="\[\e[38;5;4m\]"
GREEN="\[\e[38;5;47m\]"
YELLOW="\[\e[38;5;179m\]"
END="\[\e[m\]"
export PS1="$BLUE\u$END||$GREEN\W$END$YELLOW ➤ $END "

# Configure path to look at brew installed gnu utils instead of the BSD ones
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# changes ls colors
eval `dircolors /Users/aniketmathur/.dir_colors`
