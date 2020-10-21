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

# Short alias for docker command
alias d='docker'

# Short alias for docker-compose command
alias dc='docker-compose'

# Short alias for docker-machine command
alias dm='docker-machine'

# Run an image
alias drun='docker run --rm -it'

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -it"

# Stop all containers
alias dstop 'docker stop (docker ps -aq)'

# Remove all containers
alias drm='docker rm -f (docker ps -aq)'

# Remove all images
alias drmi='docker rmi -f (docker images -aq)'

# Remove only dangling images
alias drmid='docker rmi (docker images --quiet --filter "dangling=true")'

# Remove all volumes
alias drmv='docker volume rm (docker volume ls -q)'

alias dclean 'docker builder prune -af && docker image prune -af && docker system prune -af'
