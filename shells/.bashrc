# jump folders
J=/usr/share/autojump/autojump.bash
if [ -f $J ]; then
    . $J
fi

# prompt
export PS1="\A \w \[\e[35m\]➢\[\e[m\]  "

# enhanced commands
alias ls='ls -Gao'
alias e='emacsclient -nw '
alias ke='emacsclient -e "(kill-emacs)"'

# node version manager
export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use

# rbenv
export PATH="$HOME/.jenv/bin:$HOME/.rbenv/bin:$HOME/.config/yarn/global:$PATH"
eval "$(rbenv init -)"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# global packages
export PATH="$(yarn global bin):$PATH"

# share history between tabs
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend

# command completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
