MYVIMRC="$HOME/.vimrc"
MYZSHRC="$HOME/.zshrc"
MYBASH="$HOME/.bash_profile"

# aliases
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -l"
alias lla="ls -la"
alias la="ls -a"
alias jn="jupyter notebook"

# aliases to allow easy config changes
alias EV="vi $MYVIMRC"
alias EZ="vi $MYZSHRC"
alias SZ=". $MYZSHRC"
alias EBP="vi $MYBASH"
alias SBP=". $MYBASH"


# MacOS specific + brew installed coreutils.
MANPATH="${MANPATH}:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk/usr/share/man"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
export PATH="/usr/local/sbin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

eval `dircolors ${HOME}/.dircolors`
