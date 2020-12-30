#!/bin/sh

set -eo pipefail

[ "$DEBUG" = "true" ] && set -x

REQUIRED_PACKAGES="git-core htop wget curl zsh vim tmux"

if test ! -n "`which git`"; then
  echo "please, install git by running command below:"
  echo "sudo apt-get install -y git-core"
  exit 1
fi

cd $HOME
if test -d .dotfiles; then
  cd .dotfiles
  git pull -f
else
  git clone https://github.com/jtomaszewski/.dotfiles
  cd .dotfiles
fi
./install.sh

read -p "do you currently have sudo rights, and do you want to install the following packages: $REQUIRED_PACKAGES ? (y/n)" answer
if [ "$answer" = "y" ] ; then
  if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y $REQUIRED_PACKAGES
  elif command -v yum &> /dev/null; then
    sudo yum install -y $REQUIRED_PACKAGES
  else
    echo "We couldn't find apt-get on this machine."
    echo "Thus, you should install the following manually, using your OS package manager:"
    echo "$REQUIRED_PACKAGES"
  fi
else
  echo "Make sure you have installed following packages: $REQUIRED_PACKAGES"
fi

if command -v chsh &> /dev/null; then
  read -p "Do you want to set default shell? (by chsh - please, don't do it on root!): \"fish\"/\"zsh\"? (type nothing, if you don't want to)" answer
  if [ "$answer" = "zsh" ]; then
    if [ -n `which zsh` ]; then
      chsh -s `which zsh`
    else
      echo "no zsh isntalled!"
    fi
  elif [ "$answer" = "fish" ]; then
    echo "NOTE: you need to install fish2 manually (see their website)"
    if [ -n `which fish` ]; then
      chsh -s /usr/bin/fish
    else
      echo "no fish installed!"
    fi
  fi
else
  echo "We recommend changing your default shell to \`$(which zsh)\`"
  echo "You can do this by editing your user enty in /etc/passwd (\`vi /etc/passwd\`)"
fi

echo "All done\n"

echo "Additional things you'd want to do:\n"

echo "1. Setup git username on your machine (we do not store it in dotfile as we don't want to store it in the repo):"
echo "sudo git config --system user.name \"Jacek Tomaszewski\""
echo "sudo git config --system user.email \"jacek@jtom.me\""
echo "sudo git config --system github.user \"jtomaszewski\""



