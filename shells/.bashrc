# jump folders
. /usr/share/autojump/autojump.bash

# prompt
export PS1="\A \w \[\e[35m\]➢\[\e[m\]  "

# enhanced commands
alias ls='ls -Gao --color=auto'

# node version manager
# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
