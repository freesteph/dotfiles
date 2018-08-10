# jump folders
eval "$(jump shell)"

# prompt
export PS1="\A \w :: "

# enhanced commands
alias ls='ls -G'
alias ll='ls -ao'

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
