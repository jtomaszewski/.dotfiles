# This file is included in both bash and zsh.

export LANG=${LANG:-"en_US.UTF-8"}

if [ -d $HOME/.rbenv/bin ]; then
  export RBENV_ROOT=$HOME/.rbenv
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/Library/Python/2.7/bin" ]; then
  export PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

if [ -d "/opt/homebrew/bin" ]; then
  alias i='arch -x86_64'
  alias ibrew='arch -x86_64 /usr/local/bin/brew'
fi

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.bin" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [ -d $HOME/.asdf ]; then
  if [ -f $HOME/.asdf/asdf.sh ]; then
    . $HOME/.asdf/asdf.sh
  fi
  if [ -f /usr/local/opt/asdf/libexec/asdf.sh ]; then
    . /usr/local/opt/asdf/libexec/asdf.sh
  fi
fi

if [ -f "$HOME/.dotfiles/custom/profile" ]; then
  source "$HOME/.dotfiles/custom/profile"
fi

if test -d /usr/local/opt/openjdk/bin; then
  export JAVA_HOME=/usr/local/opt/openjdk
  export PATH="$JAVA_HOME/bin:$PATH"
elif test -d /opt/homebrew/opt/openjdk@11/bin; then
  export JAVA_HOME=/opt/homebrew/opt/openjdk@11
  export PATH="$JAVA_HOME/bin:$PATH"
fi

export EDITOR=vim

if command -v apt-get &> /dev/null; then
  alias ai="apt-get install"
fi

if command -v apt &> /dev/null; then
  alias as="apt search"
fi

if command -v kubectl &> /dev/null; then
  alias k='kubectl'
fi

if command -v docker &> /dev/null; then
  # Short alias for docker command
  alias d='docker'
  # Find container ID by ID or name
  did() {
    ID=$(docker ps -qf "id=$1" | head -n 1)
    if test -z "$ID"; then
      ID=$(docker ps -qf "name=$1")
    fi
    if test -z "$ID"; then
      echo "Couldn't find running image with ID or name containing $argv[1]"
      return 1
    fi
    echo $ID
  }
  # Build and run a ./Dockerfile
  # Taken from https://stackoverflow.com/a/45141443/1860149
  alias dbrun="docker build -t foo . && docker run --rm foo"
  # Get container process
  alias dps="docker ps"
  # Get latest container ID
  alias dpsl="docker ps -l -q"
  # Get process included stop container
  alias dpsa="docker ps -a"
  # Get images
  alias di="docker images"
  # Print and follow container's log
  dl() {
    docker logs -f $(did $1 | head -n 1) "${@:2}"
  }
  # List the docker images
  alias di='docker images | grep -v none'
  # List the docker volumes
  alias dv='docker volume ls'
  # Short alias for docker-compose command
  alias dc='docker-compose'
  # Short alias for docker-machine command
  alias dm='docker-machine'
  # Run an image
  alias drun='docker run --rm -it'
  # Find container by id or name, and exec sth on it
  dex() {
    docker exec -it $(did $1 | head -n 1) "${@:2}"
  }
  # Find container by id or name, and enter terminal in it
  dterm() {
    dex $1 sh
  }
  # Stop all containers
  alias dstop='docker stop $(docker ps -aq)'
  # Remove all containers
  alias drm='docker rm -f $(docker ps -aq)'
  # Remove all images
  alias drmi='docker rmi -f $(docker images -aq)'
  # Remove only dangling images
  alias drmid='docker rmi $(docker images --quiet --filter "dangling=true")'
  # Remove all volumes
  alias drmv='docker volume rm $(docker volume ls -q)'
  # Clear all cache
  alias dclean='docker builder prune -af && docker image prune -af && docker system prune -af'
fi

if test -d $HOME/.nvm; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi

if test -d $HOME/Library/Android/sdk; then
  export ANDROID_SDK=$HOME/Library/Android/sdk
fi
