# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
. ~/build/z/z.sh

# Prefer US English and use UTF-8
export CC=gcc
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

