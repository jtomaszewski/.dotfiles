if test -d /opt/homebrew/bin
    alias i='arch -x86_64'
    alias ibrew='arch -x86_64 /usr/local/bin/brew'
end

# Short alias for docker command
alias d='docker'
# Find container ID by ID or name
function did
    set ID (docker ps -qf "id=$argv[1]" | head -n 1)
    if test -z "$ID"
        set ID (docker ps -qf "name=$argv[1]")
    end
    if test -z "$ID"
        echo "Couldn't find any image with ID or name containing $argv[1]"
        return 1
    end
    echo $ID
end
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
function dl
    docker logs -f (did $argv[1] | head -n 1) $argv[2..-1]
end
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
function dex
    docker exec -it (did $argv[1] | head -n 1) $argv[2..-1]
end
# Find container by id or name, and enter terminal in it
function dterm
    dex $argv[1] sh
end
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
