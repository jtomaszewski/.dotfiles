#!/usr/bin/env bash

# Replace login shell from bash with zsh. (cuz we don't always have rights to run chsh)
#if [ -f "$(which zsh 2> /dev/null)" ]
#then
#  SHELL=$(which zsh) exec $(which zsh) --login
#fi

source $HOME/.profile

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="/usr/bin/vim -w"
export GIT_EDITOR='/usr/bin/vim -w'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Load Bash It
source $BASH_IT/bash_it.sh

# asdf support
if [ -d $HOME/.asdf ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi
