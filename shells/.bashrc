# jump folders
. /usr/share/autojump/autojump.bash

# prompt
export PS1="\A \w \[\e[35m\]➢\[\e[m\]  "

# enhanced commands
alias ls='ls -Gao --color'
alias e='emacsclient -nw '

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# rbenv
export PATH="$HOME/.jenv/bin:$HOME/.rbenv/bin:$HOME/.config/yarn/global:$PATH"
eval "$(rbenv init -)"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# global packages
export PATH="$(yarn global bin):$PATH"
