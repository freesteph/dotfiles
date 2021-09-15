#!/usr/bin/bash

# boom
export EDITOR="emacsclient -c"

# where things live
export DEV_ROOT="$HOME/build"
export DEV_PREFIX="$DEV_ROOT/os"
export PATH="$DEV_PREFIX/bin:$PATH"

export GOPATH=$DEV_PREFIX/go
export PATH="$GOPATH/bin:$PATH"

# PGP
GPG_TTY=$(tty)
export GPG_TTY

# jump folders
J=$HOME/.autojump/etc/profile.d/autojump.sh
if [ -f $J ]; then
    . $J
fi

# prompt
export PS1="\A \w \[\e[1m\]£\[\e[m\]  "

# better listings
[[ -n `command -v gls` ]] && reals='gls' || reals='ls'
alias ls="$reals -ahog --color=auto"

# emacs client machinery
alias e='emacsclient -nw'
alias em='emacsclient -c -n -e "(toggle-frame-maximized)"'
alias ke='emacsclient -e "(kill-emacs)"'

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if [[ -n `command -v rbenv` ]]; then
  eval "$(rbenv init -)"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [[ -n `command -v pyenv` ]]; then
    eval "$(pyenv init --path)"
fi

# global packages
if [[ -n `command -v yarn` ]]; then
  export PATH="$(yarn global bin):$PATH"
fi

# share history between tabs
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend

# brew commands completion
if [[ -n `command -v brew` ]]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# bundle parallel gems
export BUNDLE_JOBS=4

export EMACS_THEME="modus-operandi"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

# python modules
export PATH="$HOME/.local/bin:$PATH"

# go modules
export PATH="$HOME/.cargo/bin:$PATH"
