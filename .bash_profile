alias rm="rm -i"
alias grep="grep --color=always"
alias ls="ls --color"

# old prompt color
#export PS1="[\[\033[38;5;39m\]\u\[\033[38;5;15m\]:\[\033[38;5;50m\]\W\[\033[38;5;15m\]]>\[$(tput sgr0)\] "

# updated prompt that prevents colors from mixing
export PS1="[\[\e[38;5;39m\]\u\[\e[m\]:\[\e[38;5;47m\]\W\[\e[m\]]> "

export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# changes ls colors
LS_COLORS='di=96:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=92:*.rpm=90'
export LS_COLORS
