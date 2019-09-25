# boom
export EDITOR="emacsclient -c"

# where things live
export DEV_ROOT="$HOME/build"
export DEV_PREFIX="$DEV_ROOT/os"

# PGP
GPG_TTY=$(tty)
export GPG_TTY

# jump folders
J=$HOME/.autojump/etc/profile.d/autojump.sh
if [ -f $J ]; then
    . $J
fi

# prompt
export PS1="\A \w \[\e[35m\]➢\[\e[m\]  "

# enhanced commands
alias ls='ls -Gao'
alias e='emacsclient -nw'
alias em='emacsclient -c -n'
alias ke='emacsclient -e "(kill-emacs)"'

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# global packages
export PATH="$(yarn global bin):$PATH"

# share history between tabs
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend

# # command completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# path
export PATH="$DEV_PREFIX/bin:$PATH"
