#!/usr/local/bin/bash

# old prompt color
#export PS1="[\[\033[38;5;39m\]\u\[\033[38;5;15m\]:\[\033[38;5;50m\]\W\[\033[38;5;15m\]]>\[$(tput sgr0)\] "

# updated prompt that prevents colors from mixing
BLUE="\[\e[38;5;4m\]"
GREEN="\[\e[38;5;47m\]"
YELLOW="\[\e[38;5;179m\]"
RED="\[\e[38;5;197m\]"
END="\[\e[m\]"
S_BLUE="\[\e[0;34m\]"
S_CYAN="\[\e[0;36m\]"
# unicode arrow
#export PS1="$BLUE\u$END||$GREEN\W$END$YELLOW ➤ $END "

# special colours
#export PS1="$BLUE\u$END$YELLOW ¦ $END$GREEN\W$END$YELLOW >$END "

# Username and directory
#export PS1=" $S_BLUE\u$END$YELLOW ¦ $END$S_CYAN\W$END$YELLOW >$END "

# Just directory
export PS1="${S_BLUE}\w${END}${YELLOW}\n»${END} "

# define a prompt function
check_retcode() {
	revtal=$?
	if [[ $retval -eq 0 ]] || [[ $retval -eq 146 ]]; then
		arrow_col=${YELLOW}
	else
		arrow_col=${RED}
	fi

	PS1="${S_BLUE}\w${END}\n${arrow_col}»${END} "
}

PROMPT_COMMAND=check_retcode

iterm_shell_int="${HOME}/.iterm2_shell_integration.bash"
[[ -e ${iterm_shell_int} ]] && source ${iterm_shell_int}
