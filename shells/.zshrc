# load Z to jump around
. /usr/local/etc/profile.d/z.sh

# avoid colors in Emacs
if [ -n "$INSIDE_EMACS" ]; then
   echo "inside Emacs"
else
   autoload -U promptinit; promptinit
   prompt pure
fi

export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history

setopt append_history
setopt share_history

export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/${HOME}/.rbenv/shims:${PATH}"

export RBENV_SHELL=zsh
command rbenv rehash 2>/dev/null

rbenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}
