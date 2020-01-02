#!/bin/sh

REQUIRED_PACKAGES="git-core htop wget curl zsh vim tmux"

if test ! -n "`which git`"; then
  echo "please, install git by running command below:"
  echo "sudo apt-get install -y git-core"
  exit 1
fi

cd $HOME
git clone https://github.com/jtomaszewski/.dotfiles
cd .dotfiles
./install.sh

read -p "do you currently have sudo rights and apt-get command? (y/n)" answer
if [ "$answer" = "y" ] ; then
  sudo apt-get update
  sudo apt-get install -y $REQUIRED_PACKAGES

  # Hub not working yet - install it manually
  # mkdir -p ~/bin/hub
  # curl http://hub.github.com/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub
else
  echo "Make sure, you have installed and working $REQUIRED_PACKAGES."
fi

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

echo "All done"


