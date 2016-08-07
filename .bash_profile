alias rm="rm -i"
alias grep="grep --color=always"
alias ls="ls --color"

# old prompt color
#export PS1="[\[\033[38;5;39m\]\u\[\033[38;5;15m\]:\[\033[38;5;50m\]\W\[\033[38;5;15m\]]>\[$(tput sgr0)\] "

# updated prompt that prevents colors from mixing
export PS1="\[\e[38;5;27m\]\u\[\e[m\]: \[\e[38;5;47m\]\W\[\e[m\] ➤  "

export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# changes ls colors
eval `dircolors /Users/aniketmathur/.dir_colors`
