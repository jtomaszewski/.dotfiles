# This file is included in both bash and zsh.

if [ -d $HOME/.rbenv/bin ]; then
  export RBENV_ROOT=$HOME/.rbenv
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.bin" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [ -f "$HOME/.dotfiles/custom/profile" ]; then
  source "$HOME/.dotfiles/custom/profile"
fi

export EDITOR=vim

if command -v apt-get &> /dev/null; then
  alias ai="apt-get install"
fi

if command -v apt &> /dev/null; then
  alias as="apt search"
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
  # Get container process
  alias dps="docker ps"
  # Get latest container ID
  alias dpsl="docker ps -l -q"
  # Get process included stop container
  alias dpsa="docker ps -a"
  # Get images
  alias di="docker images"
  # Print and follow container's log
  alias dl='docker logs -f'
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
    docker exec -it $(did $1) "${@:2}"
  }
  # Find container by id or name, and enter terminal in it
  dterm() {
    dex $1 bash
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

if test -d /Users/slimak/Library/Android/sdk; then
  export ANDROID_SDK=/Users/slimak/Library/Android/sdk
fi
