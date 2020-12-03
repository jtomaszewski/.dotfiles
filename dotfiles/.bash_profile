#!/usr/bin/env bash

# Replace login shell from bash with zsh. (cuz we don't always have rights to run chsh)
#if [ -f "$(which zsh 2> /dev/null)" ]
#then
#  SHELL=$(which zsh) exec $(which zsh) --login
#fi

source $HOME/.profile

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Set my editor and git editor
export EDITOR="/usr/bin/vim -w"
export GIT_EDITOR='/usr/bin/vim -w'

# Don't check mail when opening terminal.
unset MAILCHECK

# Load Bash It
source $BASH_IT/bash_it.sh

# asdf support
if [ -d $HOME/.asdf ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi


if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
